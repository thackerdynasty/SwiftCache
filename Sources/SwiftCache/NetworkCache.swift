//
//  NetworkCache.swift
//  SwiftCache
//
//  Created by Dhyan Thacker on 7/21/25.
//
//  Credit Apple for some of the caching techniques
//
import Foundation

/// A cache that has built-in REST API functionality.
///
/// This cache automatically stores and retrieves results of network requests for faster
/// load times. The `Value` generic parameter represents the model that will be decoded
/// from the JSON data returned from the api.
///
/// Since the cache doesn't persist between instances of `NetworkCache`, it is recommended
/// to use something like `@EnvironmentObject` to use one instance across your application.
public struct NetworkCache<Value: Sendable & Decodable> {
    private var cache: Cache<String, CacheEntry> = Cache()
    
    /// Gets an object from the cache if it is available, otherwise gets it from the URL provided.
    ///
    /// - Parameters:
    ///     - url: The URL used as the cache key and for the network request
    ///                  if the object is not already cached.
    ///     - headers: Any HTTP request headers, such as Content-Type, Authorization, etc. Default is an empty dictionary.
    ///     - decoder: A custom `JSONDecoder`, if you need to set any properties of the decoder for proper decoding. Default is a standard `JSONDecoder()`.
    ///     - httpMethod: The HTTP method to be used, specified as a case of the `HttpMethod` enum. Default is `.get`.
    /// - Returns: The object in the cache, or from the URL specified.
    ///
    /// - Discussion:
    ///   This method is designed to be resilient to repeated calls for the same URL while a request is already in progress.
    ///   If the data is already being fetched, the same task is reused to avoid duplicate network calls.
    ///   Once the data is retrieved and decoded successfully, it is stored in the cache for future access.
    ///   If an error occurs during the request, the cache entry is cleared to allow retries.
    ///   It is important to note that if you use this for creating new objects, not just getting them, there will be undefined behavior.
    public mutating func getObject(url: URL, headers: [String: String] = [:],
                                   decoder: JSONDecoder = JSONDecoder(), httpMethod: HttpMethod = .get) async throws -> Value {
        var request = URLRequest(url: url)
        for (header, value) in headers {
            request.addValue(value, forHTTPHeaderField: header)
        }
        request.httpMethod = httpMethod.rawValue
        
        let key = url.absoluteString
        
        if let cachedEntry = cache.object(forKey: key) {
            switch cachedEntry {
            case .inProgress(let task):
                return try await task.value
            case .ready(let value):
                return value
            }
        }
        
        let task = Task<Value, Error> {
            let (data, _) = try await URLSession.shared.data(for: request)
            return try decoder.decode(Value.self, from: data)
        }
        
        cache.setObject(.inProgress(task), forKey: key)
        
        do {
            let result = try await task.value
            cache.setObject(.ready(result), forKey: key)
            return result
        } catch {
            cache.setObject(nil, forKey: key)
            throw error
        }
    }
    
    private enum CacheEntry {
        case inProgress(Task<Value, Error>)
        case ready(Value)
    }
}

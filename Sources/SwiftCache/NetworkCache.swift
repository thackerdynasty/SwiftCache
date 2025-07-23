//
//  NetworkCache.swift
//  SwiftCache
//
//  Created by Dhyan Thacker on 7/21/25.
//
import Foundation

/// A cache that has built-in REST API functionality, parameterized by the type `Value`.
///
/// This cache automatically stores and retrieves results of network requests for faster
/// load times. The `Value` generic parameter represents the model that will be decoded
/// from the JSON data returned from the api.
public struct NetworkCache<Value> {
    private let cache: Cache<String, Value> = Cache()
    
    public func getObject(url: URL) {
        
    }
}

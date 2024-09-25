//
//  UnsafeCache.swift
//  SwiftCache
//
//  Created by Dhyan Thacker on 9/23/24.
//
import Foundation

/// Non type-safe cache
public struct UnsafeCache {
    private let cache: WrapperCache<AnyObject, AnyObject>
    
    public init() {
        cache = WrapperCache()
    }
    
    /// Inserts an object into the cache.
    /// - Parameters:
    ///     - object: The object to insert into the cache.
    ///     - key: The key to insert the object at.
    public func setObject(_ object: AnyObject, forKey key: AnyObject) {
        cache.setCachedObject(object, for: key)
    }
    
    /// Gets an object from the cache.
    /// - Parameters:
    ///     - key: The key the object is stored at.
    /// - Returns: The object at the location of the key in the cache.
    public func getObject(forKey key: AnyObject) -> AnyObject? {
        cache.getCachedObject(at: key)
    }
}

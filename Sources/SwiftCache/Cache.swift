//
//  NativeCache.swift
//  SwiftCache
//
//  Created by Dhyan Thacker on 9/24/24.
//
import Foundation

public struct Cache<KeyType: Hashable, ObjectType> {
    var cache: Dictionary<KeyType, ObjectType>
    
    public init() {
        cache = [:]
    }
    
    /// Inserts an object into the cache.
    /// - Parameters:
    ///     - object: The object to insert.
    ///     - key: The key to insert the object at.
    public mutating func setObject(_ object: ObjectType, forKey key: KeyType) {
        cache[key] = object
    }
    
    /// Gets an object from the cache.
    /// - Parameters:
    ///     - key: The key the object is stored at.
    /// - Returns: The object at the location of the key in the cache.
    public func object(forKey key: KeyType) -> ObjectType? {
        cache[key]
    }
    
    /// Clears the cache.
    public mutating func clear() {
        cache.removeAll()
    }
}

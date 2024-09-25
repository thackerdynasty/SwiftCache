//
//  NativeCache.swift
//  SwiftCache
//
//  Created by Dhyan Thacker on 9/24/24.
//
import Foundation

struct Cache<KeyType: Hashable, ObjectType> {
    var cache: Dictionary<KeyType, ObjectType>
    
    public init() {
        cache = [:]
    }
    
    public mutating func setObject(_ object: ObjectType, forKey key: KeyType) {
        cache[key] = object
    }
    
    public func object(forKey key: KeyType) -> ObjectType? {
        cache[key]
    }
}

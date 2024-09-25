//
//  UnsafeCache.swift
//  SwiftCache
//
//  Created by Dhyan Thacker on 9/23/24.
//
import Foundation

public struct UnsafeCache {
    private let cache: SwiftCache<AnyObject, AnyObject>
    
    public init() {
        cache = SwiftCache()
    }
    
    public func setObject(_ object: AnyObject, forKey key: AnyObject) {
        cache.setCachedObject(object, for: key)
    }
    
    public func getObject(forKey key: AnyObject) -> AnyObject? {
        cache.getCachedObject(at: key)
    }
}

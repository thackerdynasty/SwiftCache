//
//  UnsafeCache.swift
//  SwiftCache
//
//  Created by Dhyan Thacker on 9/23/24.
//
import Foundation

public struct UnsafeCache {
    private let cache: WrapperCache<AnyObject, AnyObject>
    
    public init() {
        cache = WrapperCache()
    }
    
    public func setObject(_ object: AnyObject, forKey key: AnyObject) {
        cache.setCachedObject(object, for: key)
    }
    
    public func getObject(forKey key: AnyObject) -> AnyObject? {
        cache.getCachedObject(at: key)
    }
}

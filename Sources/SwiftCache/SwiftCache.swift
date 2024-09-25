// The Swift Programming Language
// https://docs.swift.org/swift-book
import Foundation

public struct SwiftCache<KeyType, ObjectType> where KeyType: AnyObject, ObjectType: AnyObject {
    private let cache = NSCache<KeyType, ObjectType>()
    
    public func getCachedObject(at key: KeyType) -> ObjectType? {
        let object = cache.object(forKey: key)
        return object
    }
    
    public func setCachedObject(_ object: ObjectType, for key: KeyType) {
        cache.setObject(object, forKey: key)
    }
}

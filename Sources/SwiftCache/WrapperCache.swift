// The Swift Programming Language
// https://docs.swift.org/swift-book
import Foundation

@available(*, deprecated, renamed: "Cache")
public struct WrapperCache<KeyType, ObjectType> where KeyType: AnyObject, ObjectType: AnyObject {
    private let cache = NSCache<KeyType, ObjectType>()
    
    /// Gets an object from the cache.
    /// - Parameters:
    ///     - key: The key that the object is stored at.
    /// - Returns: The object at the location of the key in the cache.
    public func getCachedObject(at key: KeyType) -> ObjectType? {
        let object = cache.object(forKey: key)
        return object
    }
    
    /// Inserts an object into the cache.
    /// - Parameters:
    ///     - object: The object to insert into the cache.
    ///     - key: The key to insert the object at.
    public func setCachedObject(_ object: ObjectType, for key: KeyType) {
        cache.setObject(object, forKey: key)
    }
}

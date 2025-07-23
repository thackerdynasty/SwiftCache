// The Swift Programming Language
// https://docs.swift.org/swift-book
import Foundation

/// This class is only kept for the users that need the full capabilities of `NSCache`.
/// Migrate to `Cache` as soon as possible.
/// Use only if NSCache functionality is required.
@available(*, deprecated, message: "Use Cache instead. This will be removed in version 2.0 of SwiftCache.")
public struct WrapperCache<KeyType, ObjectType> where KeyType: AnyObject, ObjectType: AnyObject {
    /// The underlying wrapped NSCache
    public let cache = NSCache<KeyType, ObjectType>()
    
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

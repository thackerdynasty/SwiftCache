import Foundation
import Testing
@testable import SwiftCache

struct SwiftCacheTests {
    var cache: WrapperCache<NSString, NSNumber>!
    
    init() throws {
        cache = WrapperCache()
        cache.setCachedObject(1, for: "1")
    }
    
    @Test func getObject() throws {
        let num = cache.getCachedObject(at: "1")
        #expect(num == 1)
    }
    
    @Test func setObject() throws {
        cache.setCachedObject(2, for: "2")
        let num = cache.getCachedObject(at: "2")
        #expect(num == 2)
    }
}

//
//  NativeCacheTests.swift
//  SwiftCache
//
//  Created by Dhyan Thacker on 9/24/24.
//
import Foundation
import Testing
@testable import SwiftCache

struct CacheTests {
    var cache: Cache<String, Int>!
    
    init() throws {
        cache = Cache()
        cache.setObject(1, forKey: "1")
    }
    
    @Test func getObject() throws {
        let num = cache.object(forKey: "1")
        #expect(num == 1)
    }
    
    @Test mutating func setObject() throws {
        cache.setObject(2, forKey: "2")
        let num = cache.object(forKey: "2")
        #expect(num == 2)
    }
}

//
//  UnsafeCacheTests.swift
//  SwiftCache
//
//  Created by Dhyan Thacker on 9/24/24.
//
import Foundation
import Testing

@testable import SwiftCache

struct UnsafeCacheTests {
    let unsafeCache: UnsafeCache!
    
    init() {
        unsafeCache = UnsafeCache()
        let stringKey = "string"
        let nsStringKey = NSString(string: stringKey)
        let strValue = "Hello, World!"
        let nsStrValue = NSString(string: strValue)
        let num: NSNumber = 1
        let numKey: NSString = "num"
        
        unsafeCache.setObject(nsStrValue, forKey: nsStringKey)
        unsafeCache.setObject(num, forKey: numKey)
    }
    
    @Test func getObject() throws {
        let value = unsafeCache.getObject(forKey: "string" as NSString) as! NSString
        #expect(value == "Hello, World!")
    }
    
    @Test func setObject() throws {
        unsafeCache.setObject("Hello, World!" as NSString, forKey: "string2" as NSString)
        #expect(unsafeCache.getObject(forKey: "string" as NSString) as! NSString == "Hello, World!")
    }
    
    @Test func getInt() throws {
        #expect(unsafeCache.getObject(forKey: "num" as NSString) as! NSNumber == 1)
    }
    
    @Test func setInt() throws {
        unsafeCache.setObject(2 as NSNumber, forKey: "num2" as NSString)
        #expect(unsafeCache.getObject(forKey: "num2" as NSString) as! NSNumber == 2)
    }
}

//
//  NetworkCacheTests.swift
//  SwiftCache
//
//  Created by Dhyan Thacker on 7/23/25.
//

import Foundation
import Testing
@testable import SwiftCache

struct NetworkCacheTests {
    @Test func getObject() async throws {
        var cache = NetworkCache<Breed>()
        let breed = try await cache.getObject(url: URL(string: "https://dogapi.dog/api/v2/breeds/036feed0-da8a-42c9-ab9a-57449b530b13")!)
        #expect(breed.data.id == "036feed0-da8a-42c9-ab9a-57449b530b13")
    }
    
    @Test func cacheTest() async throws {
        var cache = NetworkCache<Breed>()
        let url = URL(string: "https://dogapi.dog/api/v2/breeds/036feed0-da8a-42c9-ab9a-57449b530b13")!

        let start1 = Date()
        _ = try await cache.getObject(url: url)
        let duration1 = Date().timeIntervalSince(start1)

        let start2 = Date()
        _ = try await cache.getObject(url: url)
        let duration2 = Date().timeIntervalSince(start2)

        print("First request duration: \(duration1)")
        print("Second request duration: \(duration2)")

        #expect(duration2 < duration1 * 0.001) // or any suitable ratio
    }
}

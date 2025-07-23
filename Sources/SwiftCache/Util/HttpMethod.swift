//
//  HttpMethod.swift
//  SwiftCache
//
//  Created by Dhyan Thacker on 7/22/25.
//

import Foundation

/// An enum for all the HTTP request types.
///
/// This enum stores all HTTP request types.
/// See `NetworkCache` for usages.
public enum HttpMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

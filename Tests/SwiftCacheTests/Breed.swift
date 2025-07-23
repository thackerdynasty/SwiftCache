//
//  Breed.swift
//  SwiftCache
//
//  Created by Dhyan Thacker on 7/23/25.
//
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let breed = try? JSONDecoder().decode(Breed.self, from: jsonData)

import Foundation

// MARK: - Breed
struct Breed: Codable, Sendable {
    let data: DataClass
    let links: Links
}

// MARK: - DataClass
struct DataClass: Codable, Sendable {
    let id, type: String
    let attributes: Attributes
}

// MARK: - Attributes
struct Attributes: Codable, Sendable {
    let name: String
    let life, maleWeight, femaleWeight: FemaleWeight
    let description: String
    let hypoallergenic: Bool

    enum CodingKeys: String, CodingKey {
        case name, life
        case maleWeight = "male_weight"
        case femaleWeight = "female_weight"
        case description, hypoallergenic
    }
}

// MARK: - FemaleWeight
struct FemaleWeight: Codable, Sendable {
    let min, max: Int
}

// MARK: - Links
struct Links: Codable, Sendable {
    let linksSelf: String

    enum CodingKeys: String, CodingKey {
        case linksSelf = "self"
    }
}

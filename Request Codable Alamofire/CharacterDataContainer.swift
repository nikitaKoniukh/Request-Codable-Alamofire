//
//  CharacterDataContainer.swift
//  Request Codable Alamofire
//
//  Created by Nikita Koniukh on 30/05/2020.
//  Copyright © 2020 Nikita Koniukh. All rights reserved.
//

struct CharacterDataContainer: Codable {
    let offset: Int?
    let limit: Int?
    let total: Int?
    let count: Int?
    let results: [Character]?

    enum CodingKeys: String, CodingKey {
        case offset
        case limit
        case total
        case count
        case results
    }
}

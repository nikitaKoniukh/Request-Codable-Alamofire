//
//  StoryList.swift
//  Request Codable Alamofire
//
//  Created by Nikita Koniukh on 31/05/2020.
//  Copyright © 2020 Nikita Koniukh. All rights reserved.
//

import Foundation

struct StoryList: Codable {

    let available: Int?
    let returned: Int?
    let collectionURI: String?
    let items: [StorySummary]?

    enum CodingKeys: String, CodingKey {
        case available
        case returned
        case collectionURI
        case items
    }
}

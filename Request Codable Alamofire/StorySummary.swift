//
//  StorySummary.swift
//  Request Codable Alamofire
//
//  Created by Nikita Koniukh on 31/05/2020.
//  Copyright © 2020 Nikita Koniukh. All rights reserved.
//

import Foundation

struct StorySummary: Codable {

    let resourceURI: String?
    let name: String?
    let type: String?

    enum CodingKeys: String, CodingKey {
        case resourceURI
        case name
        case type
    }
}

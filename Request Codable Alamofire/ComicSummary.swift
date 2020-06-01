//
//  ComicSummary.swift
//  Request Codable Alamofire
//
//  Created by Nikita Koniukh on 31/05/2020.
//  Copyright © 2020 Nikita Koniukh. All rights reserved.
//

struct ComicSummary: Codable {

    let resourceURI: String?
    let name: String?

    enum CodingKeys: String, CodingKey {
        case resourceURI
        case name
    }
}

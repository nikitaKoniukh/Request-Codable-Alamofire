//
//  Character.swift
//  Request Codable Alamofire
//
//  Created by Nikita Koniukh on 30/05/2020.
//  Copyright © 2020 Nikita Koniukh. All rights reserved.
//

struct Character: Codable {

    let id: Int?
    let name: String?
    let description: String?
    let thumbnail: Image?
    let comics: ComicList?
    let stories: StoryList?


    enum CodingKeys: String, CodingKey {
        case id
        case name
        case description
        case thumbnail
        case comics
        case stories
    }
}

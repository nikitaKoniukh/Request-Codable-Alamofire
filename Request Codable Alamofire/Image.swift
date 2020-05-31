//
//  Image.swift
//  Request Codable Alamofire
//
//  Created by Nikita Koniukh on 30/05/2020.
//  Copyright © 2020 Nikita Koniukh. All rights reserved.
//

import Foundation

struct Image: Codable {
    let path: String?
    let ext: String?

    enum CodingKeys: String, CodingKey {
        case path
        case ext = "extension"
    }
}

extension Image {

    var url: URL? {
        if let path = path, let ext = ext {
            return URL(string: "\(path).\(ext)")
        } else {
            return nil
        }
    }
}

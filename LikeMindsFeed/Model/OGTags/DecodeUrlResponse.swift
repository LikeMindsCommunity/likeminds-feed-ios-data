//
//  GetOGTagsResponse.swift
//  LMFeed
//
//  Created by Pushpendra Singh on 09/03/23.
//

import Foundation

public struct DecodeUrlResponse: Decodable {
    public let oGTags: OGTags?
    
    enum CodingKeys: String, CodingKey {
        case oGTags = "og_tags"
    }
}

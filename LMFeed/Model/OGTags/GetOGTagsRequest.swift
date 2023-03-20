//
//  GetOGTagsRequest.swift
//  LMFeed
//
//  Created by Pushpendra Singh on 09/03/23.
//

import Foundation

public class GetOGTagsRequest: Encodable {
    var link: String
    
    ///
    public init(_ link: String) {
        self.link = link
    }
    
    enum CodingKeys: String, CodingKey {
        case link = "url"
    }
    
}

//
//  GetOGTagsRequest.swift
//  LMFeed
//
//  Created by Pushpendra Singh on 09/03/23.
//

import Foundation

public class DecodeUrlRequest: Encodable {
    var link: String?
    
    /// Initiate method
    private init() {}
    
    public static func builder() -> DecodeUrlRequest {
        return DecodeUrlRequest()
    }
    
    public func build() -> DecodeUrlRequest {
        return self
    }
    
    public func link(_ link: String) -> DecodeUrlRequest {
        self.link = link
        return self
    }
    
    enum CodingKeys: String, CodingKey {
        case link = "url"
    }
    
}

//
//  BrandingResponse.swift
//  LMCore
//
//  Created by Pushpendra Singh on 19/02/23.
//

import Foundation

public struct BrandingResponse: Decodable, Encodable {
    public var basicColor: AdvanceColor?
    public var advanceColor: AdvanceColor?
    
    enum CodingKeys: String, CodingKey {
        case basicColor = "basic"
        case advanceColor = "advanced"
    }
}

public struct BasicColor: Decodable, Encodable {
    public var basicColor: String?
    enum CodingKeys: String, CodingKey {
        case basicColor = "primary_colour"
    }
}

public struct AdvanceColor: Decodable, Encodable {
    public var headerColor: String?
    public var buttonIconsColour: String?
    public var textLinksColour: String?
    
    enum CodingKeys: String, CodingKey {
        case headerColor = "header_colour"
        case buttonIconsColour = "buttons_icons_colour"
        case textLinksColour = "text_links_colour"
    }
}

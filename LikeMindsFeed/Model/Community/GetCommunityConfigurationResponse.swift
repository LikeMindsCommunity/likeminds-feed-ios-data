//
//  GetCommunityConfigurationResponse.swift
//  LikeMindsFeed
//
//  Created by Pushpendra Singh on 20/11/23.
//

import Foundation

public struct GetCommunityConfigurationResponse: Decodable {
    public let communityConfigurations: [CommunityConfiguration]?
    
    enum CodingKeys: String, CodingKey {
        case communityConfigurations = "community_configurations"
    }
}

// MARK: - CommunityConfiguration
public struct CommunityConfiguration: Codable {
    public let type: String?
    public let value: Value?
    public let description: String?
    
    // MARK: - Value
    public struct Value: Codable {
        public let post: String?
        public let maxVideoSize, maxImageSize: Int?
        public let widgetsEnabled: Bool?
        
        enum CodingKeys: String, CodingKey {
            case post
            case maxVideoSize = "max_video_size"
            case maxImageSize = "max_image_size"
            case widgetsEnabled = "widgets_enabled"
        }
    }
}

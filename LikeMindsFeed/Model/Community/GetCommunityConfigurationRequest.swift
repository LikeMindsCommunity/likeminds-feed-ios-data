//
//  GetCommunityConfiguration.swift
//  LikeMindsFeed
//
//  Created by Pushpendra Singh on 20/11/23.
//

import Foundation

public class GetCommunityConfigurationRequest: Encodable {
    var configurationTypes: [String]?
    
    /// Initiate method
    private init() {}
    
    public static func builder() -> GetCommunityConfigurationRequest {
        return GetCommunityConfigurationRequest()
    }
    
    public func build() -> Self {
        return self
    }
    
    enum CodingKeys: String, CodingKey {
        case configurationTypes = "configuration_types"
    }
    
    public func configurationTypes(_ configurationTypes: [String]) -> GetCommunityConfigurationRequest {
        self.configurationTypes = configurationTypes
        return self
    }
}

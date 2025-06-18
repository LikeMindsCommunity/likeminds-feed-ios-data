//
//  GetCommunityConfiguration.swift
//  LikeMindsFeed
//
//  Created by Pushpendra Singh on 20/11/23.
//

import Foundation

public final class GetCommunityConfigurationRequest: Encodable {
    private(set) var configurationTypes: [String]?
    
    private init(builder: Builder) {
        self.configurationTypes = builder.configurationTypes
    }
    
    public static func builder() -> Builder {
        return Builder()
    }
    
    public class Builder {
        var configurationTypes: [String]?
        
        public init() { }
        
        /// Sets the configuration types
        /// - Parameter configurationTypes: Array of configuration types
        /// - Returns: Builder instance for method chaining
        public func configurationTypes(_ configurationTypes: [String]) -> Builder {
            self.configurationTypes = configurationTypes
            return self
        }
        
        /// Builds the GetCommunityConfigurationRequest instance
        /// - Returns: Configured GetCommunityConfigurationRequest
        public func build() -> GetCommunityConfigurationRequest {
            return GetCommunityConfigurationRequest(builder: self)
        }
    }
    
    /// Converts the current request to a builder for modifications
    /// - Returns: Builder instance with current values
    public func toBuilder() -> Builder {
        var builder = Builder()
        if let configurationTypes = self.configurationTypes {
            builder = builder.configurationTypes(configurationTypes)
        }
        return builder
    }
    
    enum CodingKeys: String, CodingKey {
        case configurationTypes = "configuration_types"
    }
}

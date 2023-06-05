//
//  OGTags.swift
//  LMFeed
//
//  Created by Pushpendra Singh on 20/02/23.
//

import Foundation

// MARK: - OGTags
public class OGTags: Codable {
    public var title, image, description, url: String?
    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.title = try container.decodeIfPresent(String.self, forKey: .title)
        self.image = try container.decodeIfPresent(String.self, forKey: .image)
        self.description = try container.decodeIfPresent(String.self, forKey: .description)
        self.url = try container.decodeIfPresent(String.self, forKey: .url)
    }
    
    public init() {
    }
    
    public func title(_ title: String) -> OGTags {
        self.title = title
        return self
    }
    
    public func image(_ image: String) -> OGTags {
        self.image = image
        return self
    }
    
    public func description(_ description: String) -> OGTags {
        self.description = description
        return self
    }
    
    public func url(_ url: String) -> OGTags {
        self.url = url
        return self
    }
}

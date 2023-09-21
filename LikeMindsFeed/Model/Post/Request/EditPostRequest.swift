//
//  EditPostRequest.swift
//  LikeMindsFeed
//
//  Created by Pushpendra Singh on 01/06/23.
//

import Foundation

public class EditPostRequest: Encodable {
    var text: String?
    var heading: String?
    var attachments: [Attachment]?
    var postId: String?
    var onBehalfOfUUID: String?
    var topics: [String]?
    
    /// Initiate method
    private init() {}
    
    enum CodingKeys: String, CodingKey {
        case text, heading, attachments
        case postId = "post_id",
             onBehalfOfUUID = "on_behalf_of_uuid",
             topics = "topic_ids"
    }
    
    public static func builder() -> EditPostRequest {
        return EditPostRequest()
    }
    
    public func build() -> EditPostRequest {
        return self
    }
    
    public func postId(_ postId: String) -> EditPostRequest {
        self.postId = postId
        return self
    }
    
    public func attachments(_ attachments: [Attachment]) -> EditPostRequest {
        self.attachments = attachments
        return self
    }
    
    public func text(_ text: String?) -> EditPostRequest {
        self.text = text
        return self
    }
    
    public func heading(_ heading: String?) -> EditPostRequest {
        self.heading = heading
        return self
    }
    
    public func onBehalfOfUUID(_ onBehalfOfUUID: String?) -> EditPostRequest {
        self.onBehalfOfUUID = onBehalfOfUUID
        return self
    }
    
    public func addTopics(_ topics: [String]) -> EditPostRequest {
        self.topics = topics
        return self
    }
}

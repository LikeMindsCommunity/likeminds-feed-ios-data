//
//  EditPostRequest.swift
//  LikeMindsFeed
//
//  Created by Pushpendra Singh on 01/06/23.
//

import Foundation

public final class EditPostRequest: Encodable {
    private(set) var text: String?
    private(set) var heading: String?
    private(set) var attachments: [Attachment]?
    private(set) var postId: String?
    private(set) var onBehalfOfUUID: String?
    private(set) var topics: [String]?
    
    private init(builder: Builder) {
        self.text = builder.text
        self.heading = builder.heading
        self.attachments = builder.attachments
        self.postId = builder.postId
        self.onBehalfOfUUID = builder.onBehalfOfUUID
        self.topics = builder.topics
    }
    
    public static func builder() -> Builder {
        return Builder()
    }
    
    public class Builder {
        var text: String?
        var heading: String?
        var attachments: [Attachment]?
        var postId: String?
        var onBehalfOfUUID: String?
        var topics: [String]?
        
        public init() { }
        
        /// Sets the post text
        /// - Parameter text: Text content of the post
        /// - Returns: Builder instance for method chaining
        public func text(_ text: String?) -> Builder {
            self.text = text
            return self
        }
        
        /// Sets the post heading
        /// - Parameter heading: Heading of the post
        /// - Returns: Builder instance for method chaining
        public func heading(_ heading: String?) -> Builder {
            self.heading = heading
            return self
        }
        
        /// Sets the post attachments
        /// - Parameter attachments: Array of attachments for the post
        /// - Returns: Builder instance for method chaining
        public func attachments(_ attachments: [Attachment]) -> Builder {
            self.attachments = attachments
            return self
        }
        
        /// Sets the post ID
        /// - Parameter postId: ID of the post to edit
        /// - Returns: Builder instance for method chaining
        public func postId(_ postId: String) -> Builder {
            self.postId = postId
            return self
        }
        
        /// Sets the on-behalf-of UUID
        /// - Parameter onBehalfOfUUID: UUID of the user on whose behalf the post is being edited
        /// - Returns: Builder instance for method chaining
        public func onBehalfOfUUID(_ onBehalfOfUUID: String?) -> Builder {
            self.onBehalfOfUUID = onBehalfOfUUID
            return self
        }
        
        /// Sets the topics
        /// - Parameter topics: Array of topic IDs
        /// - Returns: Builder instance for method chaining
        public func addTopics(_ topics: [String]) -> Builder {
            self.topics = topics
            return self
        }
        
        /// Builds the EditPostRequest instance
        /// - Returns: Configured EditPostRequest
        public func build() -> EditPostRequest {
            return EditPostRequest(builder: self)
        }
    }
    
    /// Converts the current request to a builder for modifications
    /// - Returns: Builder instance with current values
    public func toBuilder() -> Builder {
        var builder = Builder()
        if let text = self.text {
            builder = builder.text(text)
        }
        if let heading = self.heading {
            builder = builder.heading(heading)
        }
        if let attachments = self.attachments {
            builder = builder.attachments(attachments)
        }
        if let postId = self.postId {
            builder = builder.postId(postId)
        }
        if let onBehalfOfUUID = self.onBehalfOfUUID {
            builder = builder.onBehalfOfUUID(onBehalfOfUUID)
        }
        if let topics = self.topics {
            builder = builder.addTopics(topics)
        }
        return builder
    }
    
    enum CodingKeys: String, CodingKey {
        case text, heading, attachments
        case postId = "post_id"
        case onBehalfOfUUID = "on_behalf_of_uuid"
        case topics = "topic_ids"
    }
}

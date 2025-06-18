//
//  AddPostRequest.swift
//  LMFeed
//
//  Created by Pushpendra Singh on 19/02/23.
//

import Foundation

// MARK: - AddPostRequest
///
/// A class for creating a request to add a new post, supporting optional fields like text, attachments, and topics.
public final class AddPostRequest: Encodable {
    private(set) var text: String?
    private(set) var heading: String?
    private(set) var onBehalfOfUUID: String?
    private(set) var attachments: [Attachment]?
    private(set) var topics: [String]?
    private(set) var tempId: String?

    private init(builder: Builder) {
        self.text = builder.text
        self.heading = builder.heading
        self.onBehalfOfUUID = builder.onBehalfOfUUID
        self.attachments = builder.attachments
        self.topics = builder.topics
        self.tempId = builder.tempId
    }
    
    public static func builder() -> Builder {
        return Builder()
    }

    enum CodingKeys: String, CodingKey {
        case text, heading, attachments
        case onBehalfOfUUID = "on_behalf_of_uuid"
        case topics = "topic_ids"
        case tempId = "temp_id"
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
        if let onBehalfOfUUID = self.onBehalfOfUUID {
            builder = builder.onBehalfOfUUID(onBehalfOfUUID)
        }
        if let attachments = self.attachments {
            builder = builder.attachments(attachments)
        }
        if let topics = self.topics {
            builder = builder.topics(topics)
        }
        if let tempId = self.tempId {
            builder = builder.tempId(tempId)
        }
        return builder
    }

    /// Builder pattern for creating an instance of `AddPostRequest`.
    public class Builder {
        var text: String?
        var heading: String?
        var onBehalfOfUUID: String?
        var attachments: [Attachment]?
        var topics: [String]?
        var tempId: String?

        public init() {}

        /// Sets the text content of the post.
        /// - Parameter text: The text content to be set
        /// - Returns: Builder instance for method chaining
        public func text(_ text: String?) -> Builder {
            self.text = text
            return self
        }

        /// Sets the heading of the post.
        /// - Parameter heading: The heading to be set
        /// - Returns: Builder instance for method chaining
        public func heading(_ heading: String?) -> Builder {
            self.heading = heading
            return self
        }

        /// Sets the UUID for acting on behalf of another user.
        /// - Parameter onBehalfOfUUID: The UUID to be set
        /// - Returns: Builder instance for method chaining
        public func onBehalfOfUUID(_ onBehalfOfUUID: String?) -> Builder {
            self.onBehalfOfUUID = onBehalfOfUUID
            return self
        }

        /// Adds attachments to the post.
        /// - Parameter attachments: Array of attachments to be added
        /// - Returns: Builder instance for method chaining
        public func attachments(_ attachments: [Attachment]?) -> Builder {
            self.attachments = attachments
            return self
        }

        /// Adds topics to the post.
        /// - Parameter topics: Array of topic IDs to be added
        /// - Returns: Builder instance for method chaining
        public func topics(_ topics: [String]?) -> Builder {
            self.topics = topics
            return self
        }

        /// Sets a temporary ID for the post.
        /// - Parameter tempId: The temporary ID to be set
        /// - Returns: Builder instance for method chaining
        public func tempId(_ tempId: String?) -> Builder {
            self.tempId = tempId
            return self
        }

        /// Builds and returns an `AddPostRequest` instance.
        /// - Returns: Configured AddPostRequest
        public func build() -> AddPostRequest {
            return AddPostRequest(builder: self)
        }
    }
}

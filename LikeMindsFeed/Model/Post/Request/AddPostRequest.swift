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
public class AddPostRequest: Encodable {
    private var text: String?
    private var heading: String?
    private var onBehalfOfUUID: String?
    private var attachments: [Attachment]?
    private var topics: [String]?
    private var tempId: String?

    private init(builder: Builder) {
        self.text = builder.text
        self.heading = builder.heading
        self.onBehalfOfUUID = builder.onBehalfOfUUID
        self.attachments = builder.attachments
        self.topics = builder.topics
        self.tempId = builder.tempId
    }

    enum CodingKeys: String, CodingKey {
        case text, heading, attachments
        case onBehalfOfUUID = "on_behalf_of_uuid"
        case topics = "topic_ids"
        case tempId = "temp_id"
    }

    /// Builder pattern for creating an instance of `AddPostRequest`.
    public class Builder {
        public var text: String?
        public var heading: String?
        public var onBehalfOfUUID: String?
        public var attachments: [Attachment]?
        public var topics: [String]?
        public var tempId: String?

        public init() {}

        /// Sets the text content of the post.
        public func text(_ text: String?) -> Builder {
            self.text = text
            return self
        }

        /// Sets the heading of the post.
        public func heading(_ heading: String?) -> Builder {
            self.heading = heading
            return self
        }

        /// Sets the UUID for acting on behalf of another user.
        public func onBehalfOfUUID(_ onBehalfOfUUID: String?) -> Builder {
            self.onBehalfOfUUID = onBehalfOfUUID
            return self
        }

        /// Adds attachments to the post.
        public func attachments(_ attachments: [Attachment]?) -> Builder {
            self.attachments = attachments
            return self
        }

        /// Adds topics to the post.
        public func topics(_ topics: [String]?) -> Builder {
            self.topics = topics
            return self
        }

        /// Sets a temporary ID for the post.
        public func tempId(_ tempId: String?) -> Builder {
            self.tempId = tempId
            return self
        }

        /// Builds and returns an `AddPostRequest` instance.
        public func build() -> AddPostRequest {
            return AddPostRequest(builder: self)
        }
    }
}

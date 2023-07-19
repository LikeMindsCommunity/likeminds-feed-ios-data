//
//  EditPostRequest.swift
//  LikeMindsFeed
//
//  Created by Pushpendra Singh on 01/06/23.
//

import Foundation

public class EditPostRequest: Encodable {
    var text: String?
    var attachments: [Attachment]?
    var postId: String?
    
    /// Initiate method
    private init() {}
    
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
}

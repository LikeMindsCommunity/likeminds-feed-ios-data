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
    var postId: String
    
    /// Initiate method with post text
    public init(_ postId: String) {
        self.postId = postId
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

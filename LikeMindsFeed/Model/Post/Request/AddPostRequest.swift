//
//  AddPostRequest.swift
//  LMFeed
//
//  Created by Pushpendra Singh on 19/02/23.
//

import Foundation

public class AddPostRequest: Encodable {
    var text: String?
    var attachments: [Attachment]?
    
    /// Initiate method
    private init() {}
    
    public static func builder() -> AddPostRequest {
        return AddPostRequest()
    }
    
    public func build() -> AddPostRequest {
        return self
    }
    
    public func attachments(_ attachments: [Attachment]) -> AddPostRequest {
        self.attachments = attachments
        return self
    }
    
    public func text(_ text: String?) -> AddPostRequest {
        self.text = text
        return self
    }
}

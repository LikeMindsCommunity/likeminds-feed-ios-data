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
    
    /// Initiate method with post text
    public init(text: String) {
        self.text = text
    }
    
    public func attachments(_ attachments: [Attachment]) -> AddPostRequest {
        self.attachments = attachments
        return self
    }
}

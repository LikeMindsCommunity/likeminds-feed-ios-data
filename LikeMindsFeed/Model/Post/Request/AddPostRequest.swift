//
//  AddPostRequest.swift
//  LMFeed
//
//  Created by Pushpendra Singh on 19/02/23.
//

import Foundation

public class AddPostRequest: Encodable {
    var text: String?
    var heading: String?
    var onBehalfOfUUID: String?
    var attachments: [Attachment]?
    var tempId: String?
    
    /// Initiate method
    private init() {}
    
    enum CodingKeys: String, CodingKey {
        case text, heading, attachments
        case onBehalfOfUUID = "on_behalf_of_uuid"
        case tempId = "temp_id"
    }
    
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
    
    public func heading(_ heading: String?) -> AddPostRequest {
        self.heading = heading
        return self
    }
    
    public func tempId(_ tempId: String) -> AddPostRequest {
        self.tempId = tempId
        return self
    }
    
    public func onBehalfOfUUID(_ onBehalfOfUUID: String?) -> AddPostRequest {
        self.onBehalfOfUUID = onBehalfOfUUID
        return self
    }
}

//
//  EditPostResponse.swift
//  LikeMindsFeed
//
//  Created by Pushpendra Singh on 04/06/23.
//

import Foundation

public struct EditPostResponse: Decodable {
    public let post: Post?
    public let users: [String: User]?
    public let widgets: [String: Widget]?
}

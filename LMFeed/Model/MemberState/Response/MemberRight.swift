//
//  MemberRight.swift
//  LMFeed
//
//  Created by Pushpendra Singh on 26/02/23.
//

import Foundation

// MARK: - MemberRight
public struct MemberRight: Codable {
    public let id: Int?
    public let isLocked, isSelected: Bool?
    public let state: Int?
    public let title: String?
    public let subTitle: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case isLocked = "is_locked"
        case isSelected = "is_selected"
        case state, title
        case subTitle = "sub_title"
    }
}

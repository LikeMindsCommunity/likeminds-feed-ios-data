//
//  MemberRight.swift
//  LMFeed
//
//  Created by Pushpendra Singh on 26/02/23.
//

import Foundation

protocol CaseIterableDefaultsLast: Decodable & CaseIterable & RawRepresentable
where RawValue: Decodable, AllCases: BidirectionalCollection { }

extension CaseIterableDefaultsLast {
    public init(from decoder: Decoder) throws {
        self = try Self(rawValue: decoder.singleValueContainer().decode(RawValue.self)) ?? Self.allCases.first!
    }
}

public enum MemberRightState: Int, Codable, CaseIterableDefaultsLast {
    case unknown = -1
    case createChatRooms = 0
    case createPolls = 1
    case createEvents = 2
    case respondsInChatRoom = 3
    case inviteMemberFromPrivateLink = 4
    case autoApproveCreatedChatroom = 5
    case createSecretChatRoom = 6
    case directMessage = 7
    case noClearYet = 8
    case createPost = 9
    case commentOrReplyOnPost = 10
}

// MARK: - MemberRight
public struct MemberRight: Codable {
    public let id: Int?
    public let isLocked, isSelected: Bool?
    public let state: MemberRightState?
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

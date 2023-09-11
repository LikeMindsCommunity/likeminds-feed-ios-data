//
//  User.swift
//  LMCore
//
//  Created by Pushpendra Singh on 19/02/23.
//

import Foundation

public struct User: Codable {
    public let id: Int?
    public let imageUrl, name, organisationName: String?
    public let userUniqueID, uuid: String?
    public let isGuest: Bool
    public let isDeleted: Bool?
    public let isOwner: Bool?
    public let customTitle: String?
    public let state, updatedAt: Int?
    public let sdkClientInfo: SDKClientInfo?
    public let memberSince: String?
    public let memberSinceEpoch: Int?
    public let menu: [MemberMenu]?
    public let questionAnswers: [QuestionAnswer]?
    public let route: String?
    public let customIntroText: String?
    
    enum CodingKeys: String, CodingKey {
        case customTitle = "custom_title"
        case id
        case isDeleted = "is_deleted"
        case imageUrl = "image_url"
        case isGuest = "is_guest"
        case isOwner = "is_owner"
        case memberSince = "member_since"
        case memberSinceEpoch = "member_since_epoch"
        case menu, name
        case organisationName = "organisation_name"
        case questionAnswers = "question_answers"
        case route
        case sdkClientInfo = "sdk_client_info"
        case state
        case updatedAt = "updated_at"
        case userUniqueID = "user_unique_id"
        case uuid
        case customIntroText = "custom_intro_text"
    }
    // Using UUID for user unique id
    public var clientUUID: String? {
        return self.sdkClientInfo?.uuid
    }
}

// MARK: - QuestionAnswer
public struct QuestionAnswer: Codable {
    public let question: UserQuestion?
    public let answer: UserAnswer?
    
    enum CodingKeys: String, CodingKey {
        case question
        case answer = "question_answer"
    }
}

// MARK: - QuestionAnswer
public struct UserQuestion: Codable {
    public let communityID: Int?
    public let directoryFields, isHidden: Bool?
    public let memberID, questionID: Int?
    public let questionTitle: String?
    public let state: Int?
    public let tag: String?
    public let value: String?
    public let imageURL: String?
    
    enum CodingKeys: String, CodingKey {
        case communityID = "community_id"
        case directoryFields = "directory_fields"
        case isHidden = "is_hidden"
        case memberID = "member_id"
        case questionID = "question_id"
        case questionTitle = "question_title"
        case state, tag, value
        case imageURL = "image_url"
    }
}

// MARK: - QuestionAnswer
public struct UserAnswer: Codable {
    public let communityID, memberID, questionID: Int?
    public let answer: String?
    
    enum CodingKeys: String, CodingKey {
        case communityID = "community_id"
        case memberID = "member_id"
        case questionID = "question_id"
        case answer
    }
}

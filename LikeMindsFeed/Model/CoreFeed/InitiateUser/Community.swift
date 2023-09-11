//
//  Community.swift
//  LMCore
//
//  Created by Pushpendra Singh on 19/02/23.
//

import Foundation

// MARK: - Community
public struct Community: Decodable {
    
    public let autoApproval: Bool?
//    public let branding: Branding?
    public let communitySettingRights: [CommunitySettingRight]?
    public let feeEvent, feeMembership, feePaymentPages, gracePeriod: Int?
    public let hideDmTab: Bool?
    public let id: Int?
    public let imageURL: String?
    public let isDiscoverable, isFreemiumCommunity, isPaid, isWhitelabel: Bool?
    public let membersCount: Int?
    public let name, purpose: String?
    public let referralEnabled: Bool?
    public let subType, type, updatedAt: Int?
//    public let whitelabelInfo: String?
    
    enum CodingKeys: String, CodingKey {
        case autoApproval = "auto_approval"
//        case branding
        case communitySettingRights = "community_setting_rights"
        case feeEvent = "fee_event"
        case feeMembership = "fee_membership"
        case feePaymentPages = "fee_payment_pages"
        case gracePeriod = "grace_period"
        case hideDmTab = "hide_dm_tab"
        case id
        case imageURL = "image_url"
        case isDiscoverable = "is_discoverable"
        case isFreemiumCommunity = "is_freemium_community"
        case isPaid = "is_paid"
        case isWhitelabel = "is_whitelabel"
        case membersCount = "members_count"
        case name, purpose
        case referralEnabled = "referral_enabled"
        case subType = "sub_type"
        case type
        case updatedAt = "updated_at"
//        case whitelabelInfo = "whitelabel_info"
    }
}

// MARK: - CommunitySettingRight
public struct CommunitySettingRight: Decodable {
    
    public let id: Int?
    public let isLocked, isSelected: Bool?
    public let state: Int?
    public let title, subTitle: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case isLocked = "is_locked"
        case isSelected = "is_selected"
        case state, title
        case subTitle = "sub_title"
    }
}

//
//  Community.swift
//  LMCore
//
//  Created by Pushpendra Singh on 19/02/23.
//

import Foundation

// MARK: - IntialCommunity
public struct Community: Decodable {
    let autoApproval: Bool
    let branding: BrandingResponse?
    let communitySettingRights: [CommunitySettingRight]?
    let feeEvent, feeMembership, feePaymentPages, gracePeriod: Int
    let hideDmTab: Bool
    let id: Int
    let imageURL: String
    let isDiscoverable, isFreemiumCommunity, isPaid, isWhitelabel: Bool
    let membersCount: Int
    let name, purpose: String
    let referralEnabled: Bool
    let subType, type, updatedAt: Int
    let whitelabelInfo: String?
    
    enum CodingKeys: String, CodingKey {
        case autoApproval = "auto_approval"
        case branding
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
        case whitelabelInfo = "whitelabel_info"
    }
}

// MARK: - CommunitySettingRight
struct CommunitySettingRight: Decodable {
    let id: Int
    let isLocked, isSelected: Bool
    let state: Int
    let title: String
    let subTitle: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case isLocked = "is_locked"
        case isSelected = "is_selected"
        case state, title
        case subTitle = "sub_title"
    }
}

//
//  BrandingRequest.swift
//  LMCore
//
//  Created by Pushpendra Singh on 16/02/23.
//

import Foundation

public class BrandingRequest: Encodable {
    public var communityId: Int
    
    public init(communityId: Int) {
        self.communityId = communityId
    }
}

//
//  GetAllMembersRequest.swift
//  LikeMindsFeed
//
//  Created by Pushpendra Singh on 01/09/23.
//

import Foundation

public class GetAllMembersRequest: Encodable {
    var page: Int = 1
    var pageSize: Int = 10
    
    /// Initiate method
    private init() {}
    
    public static func builder() -> GetAllMembersRequest {
        return GetAllMembersRequest()
    }
    
    public func build() -> GetAllMembersRequest {
        return self
    }
    
    enum CodingKeys: String, CodingKey {
        case page
        case pageSize = "page_size"
    }
    
    public func page(_ page: Int) -> GetAllMembersRequest {
        self.page = page
        return self
    }
    
    public func pageSize(_ pageSize: Int) -> GetAllMembersRequest {
        self.pageSize = pageSize
        return self
    }
}

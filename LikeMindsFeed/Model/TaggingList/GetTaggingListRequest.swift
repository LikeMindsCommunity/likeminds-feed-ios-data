//
//  GetTaggingListRequest.swift
//  LMFeed
//
//  Created by Pushpendra Singh on 10/05/23.
//

import Foundation

public class GetTaggingListRequest: Encodable {
    var searchName: String = ""
    var pageSize: Int = 10 //
    var page: Int = 1
    
    /// Initiate method
    private init() {}
    
    public static func builder() -> GetTaggingListRequest {
        return GetTaggingListRequest()
    }
    
    public func build() -> GetTaggingListRequest {
        return self
    }
    
    public func searchName(_ searchName: String) -> GetTaggingListRequest {
        self.searchName = searchName
        return self
    }
    
    public func page(_ page: Int) -> GetTaggingListRequest {
        self.page = page
        return self
    }
    
    public func pageSize(_ pageSize: Int) -> GetTaggingListRequest {
        self.pageSize = pageSize
        return self
    }
    
    enum CodingKeys: String, CodingKey {
        case searchName = "search_name"
        case page
        case pageSize = "page_size"
    }
}

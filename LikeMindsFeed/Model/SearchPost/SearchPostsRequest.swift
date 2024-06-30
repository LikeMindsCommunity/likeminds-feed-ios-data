//
//  SearchPostsRequest.swift
//  LikeMindsFeed
//
//  Created by Devansh Mohata on 29/06/24.
//

import Foundation

public class SearchPostsRequest {
    var search: String = ""
    var searchType: String = "text"
    var page: Int = 1
    var pageSize: Int = 10
    
    private init() { }
    
    public static func builder() -> SearchPostsRequest {
        return SearchPostsRequest()
    }
    
    public func build() -> Self {
        return self
    }
    
    public func search(_ search: String) -> Self {
        self.search = search
        return self
    }
    
    public func searchType(_ searchType: String) -> Self {
        self.searchType = searchType
        return self
    }
    
    public func page(_ page: Int) -> Self {
        self.page = page
        return self
    }
    
    public func pageSize(_ pageSize: Int) -> Self {
        self.pageSize = pageSize
        return self
    }
}


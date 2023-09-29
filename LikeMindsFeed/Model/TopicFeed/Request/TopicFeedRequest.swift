//
//  TopicFeedRequest.swift
//  LikeMindsFeed
//
//  Created by Devansh Mohata on 19/09/23.
//

import Foundation

public class TopicFeedRequest {
    var isEnabled: Bool = false
    var search: String?
    var searchType: String = "name"
    var page: Int = 1
    var pageSize: Int = 10
    
    private init() { }
    
    public static func builder() -> TopicFeedRequest {
        return TopicFeedRequest()
    }
    
    public func build() -> Self { self }
    
    public func setSearchTopic(_ topicName: String) -> Self {
        self.search = topicName
        return self
    }
    
    public func setSearchType(_ searchType: String) -> Self {
        self.searchType = searchType
        return self
    }
    
    public func setEnableState(_ isEnabled: Bool) -> Self {
        self.isEnabled = isEnabled
        return self
    }
    
    public func setPage(_ pageNumber: Int) -> Self {
        self.page = pageNumber
        return self
    }
    
    public func setPageSize(_ pageSize: Int) -> Self {
        self.pageSize = pageSize
        return self
    }
}

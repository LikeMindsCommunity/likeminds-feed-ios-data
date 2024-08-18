//
//  Topics.swift
//  Pods
//
//  Created by Devansh Mohata on 18/08/24.
//

// MARK: topics
struct TopicFeedAPIRequest: ServiceProtocol {
    var endPoint: String {
        "feed/topic"
    }
    
    var httpMethod: HTTPMethod { .get }
    
    var queryParams: [String : Any] {
        var params: [String: Any] = [:]
        
        params["page"] = request.page
        params["page_size"] = request.pageSize
        
        if request.isEnabled {
            params["is_enabled"] = true
        }
        
        if let search = request.search {
            params["search"] = search
            params["search_type"] = request.searchType
        }
        
        return params
    }
    
    let request: TopicFeedRequest
    
    init(request: TopicFeedRequest) {
        self.request = request
    }
}

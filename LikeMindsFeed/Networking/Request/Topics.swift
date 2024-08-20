//
//  Topics.swift
//  Pods
//
//  Created by Devansh Mohata on 18/08/24.
//

// MARK: topics
struct TopicFeedAPIRequest: RequestableAPIEndpointConfiguration {
    var endPoint: String {
        APIConstants.Endpoint.topic
    }
    
    var httpMethod: HTTPMethod { .get }
    
    var queryParams: [String : Any] {
        var params: [String: Any] = [:]
        
        params[APIConstants.QueryParam.page] = request.page
        params[APIConstants.QueryParam.pageSize] = request.pageSize
        
        if request.isEnabled {
            params[APIConstants.QueryParam.isEnabled] = true
        }
        
        if let search = request.search {
            params[APIConstants.QueryParam.search] = search
            params[APIConstants.QueryParam.searchType] = request.searchType
        }
        
        return params
    }
    
    let request: TopicFeedRequest
    
    init(request: TopicFeedRequest) {
        self.request = request
    }
}

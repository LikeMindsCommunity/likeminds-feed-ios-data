//
//  Misc.swift
//  Pods
//
//  Created by Devansh Mohata on 18/08/24.
//


// MARK: report
struct ReportAPIRequest: RequestableAPIEndpointConfiguration {
    var endPoint: String {
        APIConstants.Endpoint.report
    }
    
    var httpMethod: HTTPMethod { .post }
    
    var body: [String : Any] {
        [
            APIConstants.Body.entityID: request.entityId!,
            APIConstants.Body.uuid: request.uuid!,
            APIConstants.Body.entityType: request.entityType!,
            APIConstants.Body.tagID: request.tagId!,
            APIConstants.Body.reason: request.reason!
        ]
    }
    
    let request: ReportRequest
    
    init(request: ReportRequest) {
        self.request = request
    }
}


// MARK: report tags
struct GetReportTagAPIRequest: RequestableAPIEndpointConfiguration {
    var endPoint: String {
        APIConstants.Endpoint.reportTag
    }
    
    var httpMethod: HTTPMethod { .get }
    
    var queryParams: [String : Any] {
        [APIConstants.Body.type: request.type ?? 3]
    }
    
    let request: GetReportTagRequest
    
    init(request: GetReportTagRequest) {
        self.request = request
    }
}


// MARK: decode url
struct DecodeUrlAPIRequest: RequestableAPIEndpointConfiguration {
    var endPoint: String {
        APIConstants.Endpoint.decodeURL
    }
    
    var httpMethod: HTTPMethod { .get }
    
    var queryParams: [String : Any] {
        [APIConstants.QueryParam.url: request.link!]
    }
    
    let request: DecodeUrlRequest
    
    init(request: DecodeUrlRequest) {
        self.request = request
    }
}


// MARK: fetch tagging list
struct GetTaggingListAPIRequest: RequestableAPIEndpointConfiguration {
    var endPoint: String {
        APIConstants.Endpoint.tagging
    }
    
    var httpMethod: HTTPMethod { .get }
    
    var queryParams: [String : Any] {
        var params: [String: Any] = [APIConstants.QueryParam.page: request.page,
                                     APIConstants.QueryParam.pageSize: request.pageSize]
        
        if !request.searchName.isEmpty {
            params[APIConstants.QueryParam.searchName] = request.searchName
        }
        
        return params
    }
    
    let request: GetTaggingListRequest
    
    init(request: GetTaggingListRequest) {
        self.request = request
    }
}

//
//  Misc.swift
//  Pods
//
//  Created by Devansh Mohata on 18/08/24.
//


// MARK: report
struct ReportAPIRequest: RequestableAPIEndpointConfiguration {
    var endPoint: String {
        "community/report"
    }
    
    var httpMethod: HTTPMethod { .post }
    
    var body: [String : Any] {
        [
            "entity_id": request.entityId!,
            "uuid": request.uuid!,
            "entity_type": request.entityType!,
            "tag_id": request.tagId!,
            "reason": request.reason!
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
        "community/report/tag"
    }
    
    var httpMethod: HTTPMethod { .get }
    
    var queryParams: [String : Any] {
        ["type": request.type ?? 3]
    }
    
    let request: GetReportTagRequest
    
    init(request: GetReportTagRequest) {
        self.request = request
    }
}


// MARK: decode url
struct DecodeUrlAPIRequest: RequestableAPIEndpointConfiguration {
    var endPoint: String {
        "helper/url"
    }
    
    var httpMethod: HTTPMethod { .get }
    
    var queryParams: [String : Any] {
        ["url": request.link!]
    }
    
    let request: DecodeUrlRequest
    
    init(request: DecodeUrlRequest) {
        self.request = request
    }
}


// MARK: fetch tagging list
struct GetTaggingListAPIRequest: RequestableAPIEndpointConfiguration {
    var endPoint: String {
        "community/tag"
    }
    
    var httpMethod: HTTPMethod { .get }
    
    var queryParams: [String : Any] {
        var params: [String: Any] = ["page": request.page,
                                     "page_size": request.pageSize]
        
        if !request.searchName.isEmpty {
            params["search_name"] = request.searchName
        }
        
        return params
    }
    
    let request: GetTaggingListRequest
    
    init(request: GetTaggingListRequest) {
        self.request = request
    }
}

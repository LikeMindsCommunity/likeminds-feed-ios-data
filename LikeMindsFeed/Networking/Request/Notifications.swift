//
//  Notifications.swift
//  Pods
//
//  Created by Devansh Mohata on 18/08/24.
//

// MARK: read notification
struct MarkReadNotificationAPIRequest: RequestableAPIEndpointConfiguration {
    var endPoint: String {
        APIConstants.markRead(for: request.activityId!)
    }
    
    var httpMethod: HTTPMethod { .post }
    
    let request: MarkReadNotificationRequest
    
    init(request: MarkReadNotificationRequest) {
        self.request = request
    }
}


// MARK: get notification count
struct GetUnreadNotificationCountAPIRequest: APIEndpointConfiguration {
    var endPoint: String {
        APIConstants.Endpoint.notificationCount
    }
    
    var httpMethod: HTTPMethod { .get }
}


// MARK: get notification
struct GetNotificationFeedAPIRequest: RequestableAPIEndpointConfiguration {
    var endPoint: String {
        APIConstants.Endpoint.notification
    }
    
    var httpMethod: HTTPMethod { .get }
    
    var queryParams: [String : Any] {
        [APIConstants.QueryParam.page: request.page,
         APIConstants.QueryParam.pageSize: request.pageSize]
    }
    
    let request: GetNotificationFeedRequest
    
    init(request: GetNotificationFeedRequest) {
        self.request = request
    }
}

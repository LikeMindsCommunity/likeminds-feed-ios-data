//
//  Notifications.swift
//  Pods
//
//  Created by Devansh Mohata on 18/08/24.
//

// MARK: read notification
struct MarkReadNotificationAPIRequest: RequestableAPIEndpointConfiguration {
    var endPoint: String {
        "feed/user/activity/\(request.activityId!)/mark_read"
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
        "feed/user/activity/unread_count"
    }
    
    var httpMethod: HTTPMethod { .get }
}


// MARK: get notification
struct GetNotificationFeedAPIRequest: RequestableAPIEndpointConfiguration {
    var endPoint: String {
        return "feed/user/activity"
    }
    
    var httpMethod: HTTPMethod { .get }
    
    var queryParams: [String : Any] {
        ["page": request.page,
         "page_size": request.pageSize]
    }
    
    let request: GetNotificationFeedRequest
    
    init(request: GetNotificationFeedRequest) {
        self.request = request
    }
}

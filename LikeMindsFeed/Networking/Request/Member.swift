//
//  Member.swift
//  Pods
//
//  Created by Devansh Mohata on 17/08/24.
//


// MARK: get member state
struct GetMemberAPIRequest: ServiceProtocol {
    var endPoint: String {
        "community/member/state"
    }
    
    var httpMethod: HTTPMethod { .get }
}


// MARK: community config
struct GetCommunityConfigurationAPIRequest: ServiceProtocol {
    var endPoint: String {
        "community/configurations"
    }
    
    var httpMethod: HTTPMethod { .get }
    
    var queryParams: [String : Any] {
        ["configuration_types": request.configurationTypes ?? []]
    }
    
    let request: GetCommunityConfigurationRequest
    
    init(request: GetCommunityConfigurationRequest) {
        self.request = request
    }
}

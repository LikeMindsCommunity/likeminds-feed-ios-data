//
//  Member.swift
//  Pods
//
//  Created by Devansh Mohata on 17/08/24.
//


// MARK: Initiate SDK
struct InitiateUserAPIRequest: RequestableAPIEndpointConfiguration {
    var endPoint: String {
        APIConstants.Endpoint.initiateSDK
    }
    
    var httpMethod: HTTPMethod { .post }
    
    var body: [String : Any] {
        [APIConstants.QueryParam.userName: request.userName!,
         APIConstants.QueryParam.uuid: request.uuid!,
         APIConstants.QueryParam.isGuest: request.isGuest ?? false]
    }
    
    var baseHTTPHeaders: [String: Any] {
        [
            APIConstants.HeaderKey.platform: APIConstants.HeaderKey.platform,
            APIConstants.HeaderKey.versionCode: BuildManager.buildVersion,
            APIConstants.HeaderKey.sdkSource: APIConstants.HeaderKey.sdkSourceCode,
            APIConstants.HeaderKey.apiKey: request.apiKey!
        ]
    }
    
    let request: InitiateUserRequest
    
    init(request: InitiateUserRequest) {
        self.request = request
    }
}

// MARK: get member state
struct GetMemberAPIRequest: APIEndpointConfiguration {
    var endPoint: String {
        APIConstants.Endpoint.memberState
    }
    
    var httpMethod: HTTPMethod { .get }
}


// MARK: logout use
struct LogoutAPIRequest: RequestableAPIEndpointConfiguration {
    var endPoint: String {
        APIConstants.Endpoint.logout
    }
    
    var httpMethod: HTTPMethod { .post }
    
    var additionalHTTPHeaders: [String : Any] {
        [APIConstants.HeaderKey.deviceId: request.deviceId!]
    }
    
    
    var body: [String : Any] {
        [APIConstants.Body.refreshToken: request.refreshToken!]
    }
    
    let request: LogoutRequest
    
    init(request: LogoutRequest) {
        self.request = request
    }
}


// MARK: register device
struct RegisterDeviceAPIRequest: RequestableAPIEndpointConfiguration {
    var endPoint: String {
        APIConstants.Endpoint.registerDevice
    }
    
    var httpMethod: HTTPMethod { .post }
    
    var additionalHTTPHeaders: [String : Any] {
        [APIConstants.HeaderKey.deviceId: request.deviceId!]
    }
    
    var body: [String : Any] {
        [APIConstants.Body.token: request.token!]
    }
    
    let request: RegisterDeviceRequest
    
    init(request: RegisterDeviceRequest) {
        self.request = request
    }
}


// MARK: refresh LTM
struct RefreshAccessTokenAPIRequest: RequestableAPIEndpointConfiguration {
    var endPoint: String {
        APIConstants.Endpoint.refreshToken
    }
    
    var httpMethod: HTTPMethod { .post }
    
    var additionalHTTPHeaders: [String : Any] {
        [APIConstants.HeaderKey.authorization: request]
    }
    
    let request: String
    
    init(request: String) {
        self.request = request
    }
}


// MARK: validate use
struct ValidateUserAPIRequest: RequestableAPIEndpointConfiguration {
    var endPoint: String {
        APIConstants.Endpoint.initiateSDK
    }
    
    var httpMethod: HTTPMethod { .get }
    
    let request: ValidateUserRequest
    
    init(request: ValidateUserRequest) {
        self.request = request
    }
}


// MARK: community config
struct GetCommunityConfigurationAPIRequest: RequestableAPIEndpointConfiguration {
    var endPoint: String {
        APIConstants.Endpoint.communityConfig
    }
    
    var httpMethod: HTTPMethod { .get }
    
    var queryParams: [String : Any] {
        [APIConstants.QueryParam.configurationType: request.configurationTypes ?? []]
    }
    
    let request: GetCommunityConfigurationRequest
    
    init(request: GetCommunityConfigurationRequest) {
        self.request = request
    }
}

//
//  Member.swift
//  Pods
//
//  Created by Devansh Mohata on 17/08/24.
//


// MARK: Initiate SDK
struct InitiateUserAPIRequest: RequestableAPIEndpointConfiguration {
    var endPoint: String {
        "sdk/initiate"
    }
    
    var httpMethod: HTTPMethod { .post }
    
    var body: [String : Any] {
        ["user_name": request.userName!,
         "uuid": request.uuid!,
         "is_guest": request.isGuest ?? false]
    }
    
    var baseHTTPHeaders: [String : Any] {
        [
            "x-platform-code": "ios",
            "x-version-code": BuildManager.buildVersion,
            "x-sdk-source": "feed",
            "x-api-key": request.apiKey!
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
        "community/member/state"
    }
    
    var httpMethod: HTTPMethod { .get }
}


// MARK: logout use
struct LogoutAPIRequest: RequestableAPIEndpointConfiguration {
    var endPoint: String {
        "user/logout"
    }
    
    var httpMethod: HTTPMethod { .post }
    
    var additionalHTTPHeaders: [String : Any] {
        ["x-device-id": request.deviceId!]
    }
    
    
    var body: [String : Any] {
        ["refresh_token": request.refreshToken!]
    }
    
    let request: LogoutRequest
    
    init(request: LogoutRequest) {
        self.request = request
    }
}


// MARK: register device
struct RegisterDeviceAPIRequest: RequestableAPIEndpointConfiguration {
    var endPoint: String {
        "user/device/push"
    }
    
    var httpMethod: HTTPMethod { .post }
    
    var additionalHTTPHeaders: [String : Any] {
        ["x-device-id": request.deviceId!]
    }
    
    var body: [String : Any] {
        ["token": request.token!]
    }
    
    let request: RegisterDeviceRequest
    
    init(request: RegisterDeviceRequest) {
        self.request = request
    }
}


// MARK: refresh LTM
struct RefreshAccessTokenAPIRequest: RequestableAPIEndpointConfiguration {
    var endPoint: String {
        "user/refresh"
    }
    
    var httpMethod: HTTPMethod { .post }
    
    var additionalHTTPHeaders: [String : Any] {
        ["Authorization": request]
    }
    
    let request: String
    
    init(request: String) {
        self.request = request
    }
}


// MARK: validate use
struct ValidateUserAPIRequest: RequestableAPIEndpointConfiguration {
    var endPoint: String {
        "sdk/initiate"
    }
    
    var httpMethod: HTTPMethod { .get }
    
    var additionalHTTPHeaders: [String : Any] {
        ["Authorization": request.accessToken]
    }
    
    let request: ValidateUserRequest
    
    init(request: ValidateUserRequest) {
        self.request = request
    }
}


// MARK: community config
struct GetCommunityConfigurationAPIRequest: RequestableAPIEndpointConfiguration {
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

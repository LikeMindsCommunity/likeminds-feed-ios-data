//
//  APIEndpointConfiguration.swift
//  LikeMindsFeed
//
//  Created by Devansh Mohata on 17/08/24.
//


enum HTTPMethod: String {
    case get, head, post, put, delete, connect, options, trace, patch
}

protocol APIEndpointConfiguration {
    var baseURL: String { get }
    var endPoint: String { get }
    var httpMethod: HTTPMethod { get }
    var baseHTTPHeaders: [String: Any] { get }
    var additionalHTTPHeaders: [String: Any] { get }
    var queryParams: [String: Any] { get }
    var body: [String: Any] { get }
}

protocol RequestableAPIEndpointConfiguration: APIEndpointConfiguration {
    associatedtype Request
    var request: Request { get }
}


extension APIEndpointConfiguration {
    var baseURL: String {
        APIConstants.baseURL
    }
    
    var queryParams: [String: Any] { [:] }
    
    var body: [String: Any] { [:] }
 
    // TODO: Write better logic
    var baseHTTPHeaders: [String: Any] {
        let accessToken = FeedTokenManager.shared.accessToken ?? ""
        let buildVersion = BuildManager.buildVersion
        
        return [
            APIConstants.HeaderKey.platform: APIConstants.HeaderKey.platformCode,
            APIConstants.HeaderKey.versionCode: buildVersion,
            APIConstants.HeaderKey.sdkSource: APIConstants.HeaderKey.sdkSourceCode,
            APIConstants.HeaderKey.authorization: "Bearer " + accessToken
        ]
    }
    
    var additionalHTTPHeaders: [String: Any] { [:] }
    
    private func aggregateHTTPHeaders() -> [String: Any] {
        var headers = baseHTTPHeaders
        headers.merge(additionalHTTPHeaders) { (_, new) in new }
        
        return headers
    }
    
    func fetchURLRequest() -> URLRequest? {
        // Construct the URL
        guard var urlComponents = URLComponents(string: baseURL) else {
            return nil
        }
        
        // Add endpoint to the path
        urlComponents.path += endPoint
        
        // Add query parameters
        if !queryParams.isEmpty {
            urlComponents.queryItems = queryParams.map { URLQueryItem(name: $0.key, value: "\($0.value)") }
        }
        
        // Create the URL
        guard let url = urlComponents.url else {
            return nil
        }
        
        // Create and configure the URLRequest
        var request = URLRequest(url: url)
        request.httpMethod = httpMethod.rawValue
        
        // Add HTTP headers
        let headers = aggregateHTTPHeaders()
        for (key, value) in headers {
            request.setValue("\(value)", forHTTPHeaderField: key)
        }
        
        // Add body if it exists
        if !body.isEmpty {
            do {
                request.httpBody = try JSONSerialization.data(withJSONObject: body, options: [])
                request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            } catch {
                print("Error serializing body: \(error)")
                return nil
            }
        }
        
        return request
    }
}

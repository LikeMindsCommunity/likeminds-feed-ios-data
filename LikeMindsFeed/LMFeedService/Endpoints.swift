import Foundation

public struct Endpoint {
    let path: String
    let queryItems: [URLQueryItem]
}

public extension Endpoint {

    var url: URL? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = ServiceConfiguration.authBaseURL
        components.path = path
        components.queryItems = queryItems
        return components.url
    }
}

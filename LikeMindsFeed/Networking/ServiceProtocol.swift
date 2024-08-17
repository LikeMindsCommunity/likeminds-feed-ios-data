//
//  ServiceProtocol.swift
//  LikeMindsFeed
//
//  Created by Devansh Mohata on 17/08/24.
//


enum HTTPMethod: String {
    case get, head, post, put, delete, connect, options, trace, patch
}

protocol ServiceProtocol {
    var baseURL: String { get }
    var endPoint: String { get }
    var httpMethod: HTTPMethod { get }
    var queryParams: [String: Any] { get }
    var pathParams: [String: String] { get }
    var body: [String: Any] { get }
    
    func fetchURLRequest() -> URLRequest?
}

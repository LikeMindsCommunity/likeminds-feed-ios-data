//
//  NetworkLayer.swift
//  LikeMindsFeed
//
//  Created by Devansh Mohata on 17/08/24.
//

import Foundation

enum LMFeedNetworkError: Error {
    case invalidRequest
    case invalidResponse
    case invalidTokens
    case noData
}

protocol NetworkProtocol: AnyObject {
    func request<T: Decodable>(request: ServiceProtocol, response: @escaping ((LMResponse<T>) -> Void))
}

final class NetworkLayer: NetworkProtocol {
    private let urlSession: URLSession
    
    static let shared = NetworkLayer()
    
    init(urlSession: URLSession = URLSession.shared) {
        self.urlSession = urlSession
    }
    
    func request<T: Decodable>(request: any ServiceProtocol, response: @escaping ((LMResponse<T>) -> Void)) {
        guard let urlRequest = request.fetchURLRequest() else {
            response(LMResponse.failureResponse(LMFeedNetworkError.invalidRequest.localizedDescription))
            return
        }
        
        urlSession.dataTask(with: urlRequest) { [weak self] data, urlResponse, error in
            defer {
                NetworkLogger.logAPICall(request: urlRequest, response: urlResponse, data: data, error: error)
            }
            
            guard let self else { return }
            
            DispatchQueue.main.async {
                if let error = error {
                    response(LMResponse.failureResponse(error.localizedDescription))
                    return
                }
                
                guard let httpResponse = urlResponse as? HTTPURLResponse else {
                    response(LMResponse.failureResponse(LMFeedNetworkError.invalidResponse.localizedDescription))
                    return
                }
                
                if httpResponse.statusCode == 401 {
                    self.handleUnauthorizedResponse(request: request, originalResponse: response)
                } else {
                    self.handleSuccessResponse(data: data, response: response)
                }
            }
        }.resume()
    }
    
    private func handleSuccessResponse<T: Decodable>(data: Data?, response: @escaping ((LMResponse<T>) -> Void)) {
        guard let data = data else {
            response(LMResponse.failureResponse(LMFeedNetworkError.noData.localizedDescription))
            return
        }
        
        do {
            let decodedResponse = try JSONDecoder().decode(LMResponse<T>.self, from: data)
            response(decodedResponse)
        } catch {
            response(LMResponse.failureResponse(error.localizedDescription))
        }
    }
    
    private func handleUnauthorizedResponse<T: Decodable>(request: any ServiceProtocol, originalResponse: @escaping ((LMResponse<T>) -> Void)) {
        if request.endPoint == "user/refresh" {
            MyFeedTokenManager.shared.onRefreshTokenExpired()
        } else {
            MyFeedTokenManager.shared.refreshAccessToken { [weak self] result in
                guard let self else { return }
                
                switch result {
                case .success:
                    self.request(request: request, response: originalResponse)
                case .failure(let error):
                    originalResponse(LMResponse.failureResponse(error.localizedDescription))
                }
            }
        }
    }
}

extension URLRequest {
    func cURL() -> String {
        let cURL = "curl -f"
        let method = "-X \(self.httpMethod ?? "GET")"
        let url = url.flatMap { "--url '\($0.absoluteString)'" }
        
        let header = self.allHTTPHeaderFields?
            .map { "-H '\($0): \($1)'" }
            .joined(separator: " ")
        
        let data: String?
        if let httpBody, !httpBody.isEmpty {
            if let bodyString = String(data: httpBody, encoding: .utf8) { // json and plain text
                let escaped = bodyString
                    .replacingOccurrences(of: "'", with: "'\\''")
                data = "--data '\(escaped)'"
            } else { // Binary data
                let hexString = httpBody
                    .map { String(format: "%02X", $0) }
                    .joined()
                data = #"--data "$(echo '\#(hexString)' | xxd -p -r)""#
            }
        } else {
            data = nil
        }
        
        return [cURL, method, url, header, data]
            .compactMap { $0 }
            .joined(separator: " ")
    }
}

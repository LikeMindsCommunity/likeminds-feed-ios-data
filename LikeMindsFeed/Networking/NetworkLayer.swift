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
    func request<T: Decodable>(request: ServiceProtocol, response: @escaping ((Result<LMResponse<T>, Error>) -> Void))
}

final class NetworkLayer: NetworkProtocol {
    private let urlSession: URLSession
    
    static let shared = NetworkLayer()
    
    init(urlSession: URLSession = URLSession.shared) {
        self.urlSession = urlSession
    }
    
    func request<T: Decodable>(request: any ServiceProtocol, response: @escaping ((Result<LMResponse<T>, Error>) -> Void)) {
        guard let urlRequest = request.fetchURLRequest() else {
            response(.failure(LMFeedNetworkError.invalidRequest))
            return
        }
        
        urlSession.dataTask(with: urlRequest) { [weak self] data, urlResponse, error in
            guard let self else { return }
            
            if let error = error {
                response(.failure(error))
                return
            }
            
            guard let httpResponse = urlResponse as? HTTPURLResponse else {
                response(.failure(LMFeedNetworkError.invalidResponse))
                return
            }
            
            if httpResponse.statusCode == 401 {
                handleUnauthorizedResponse(request: request, originalResponse: response)
            } else {
                handleSuccessResponse(data: data, response: response)
            }
            
        }.resume()
    }
    
    private func handleSuccessResponse<T: Decodable>(data: Data?, response: @escaping (Result<LMResponse<T>, Error>) -> Void) {
        guard let data = data else {
            response(.failure(LMFeedNetworkError.noData))
            return
        }
        
        do {
            let decodedResponse = try JSONDecoder().decode(LMResponse<T>.self, from: data)
            response(.success(decodedResponse))
        } catch {
            response(.failure(error))
        }
    }
    
    private func handleUnauthorizedResponse<T: Decodable>(request: any ServiceProtocol, originalResponse: @escaping (Result<LMResponse<T>, Error>) -> Void) {
        if request.endPoint == "user/refresh" {
            MyFeedTokenManager.shared.onRefreshTokenExpired()
        } else {
            MyFeedTokenManager.shared.refreshAccessToken { [weak self] result in
                guard let self else { return }
                
                switch result {
                case .success:
                    self.request(request: request, response: originalResponse)
                case .failure(let error):
                    originalResponse(.failure(error))
                }
            }
        }
    }
}

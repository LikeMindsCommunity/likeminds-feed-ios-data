//
//  LMFeedClientServiceRequest+Extension.swift
//  LikeMindsFeed
//
//  Created by Pushpendra Singh on 14/06/23.
//

import Foundation

extension LMFeedClientServiceRequest {
    
    static func getNotificationFeed(_ request: GetNotificationFeedRequest, withModuleName moduleName: String, _ response: LMFeedClientResponse<GetNotificationFeedResponse>?) {
        let networkPath = ServiceAPIRequest.NetworkPath.getNotificationFeed(request)
        let endpoint = networkPath.apiURL
        guard let url = endpoint.url else {
          response?(LMResponse.failureResponse("Invalid URL"))
          return
        }
        DataNetwork.shared.request(for: url,
                                   withHTTPMethod: networkPath.httpMethod,
                                   headers: ServiceRequest.httpHeaders(),
                                   withParameters: networkPath.parameters,
                                   withEncoding: networkPath.encoding,
                                   withModuleName: moduleName) { (moduleName, responseData) in
            guard let data = responseData as? Data else {return}
            do {
                let result = try JSONDecoder().decode(LMResponse<GetNotificationFeedResponse>.self, from: data)
                response?(result)
            } catch let error {
                response?(LMResponse.failureResponse(error.localizedDescription))
            }
        } failureCallback: { (moduleName, error) in
            response?(LMResponse.failureResponse(error.localizedDescription))
        }
    }
    
    static func getNotificationFeedUnreadCount(withModuleName moduleName: String, _ response: LMFeedClientResponse<GetUnreadNotificationCountResponse>?) {
        let networkPath = ServiceAPIRequest.NetworkPath.getNotificationFeedUnreadCout
        let endpoint = networkPath.apiURL
        guard let url = endpoint.url else {
          response?(LMResponse.failureResponse("Invalid URL"))
          return
        }
        DataNetwork.shared.request(for: url,
                                   withHTTPMethod: networkPath.httpMethod,
                                   headers: ServiceRequest.httpHeaders(),
                                   withParameters: networkPath.parameters,
                                   withEncoding: networkPath.encoding,
                                   withModuleName: moduleName) { (moduleName, responseData) in
            guard let data = responseData as? Data else {return}
            do {
                let result = try JSONDecoder().decode(LMResponse<GetUnreadNotificationCountResponse>.self, from: data)
                response?(result)
            } catch let error {
                response?(LMResponse.failureResponse(error.localizedDescription))
            }
        } failureCallback: { (moduleName, error) in
            response?(LMResponse.failureResponse(error.localizedDescription))
        }
    }
    
    static func markReadNotification(_ request: MarkReadNotificationRequest, withModuleName moduleName: String, _ response: LMFeedClientResponse<NoData>?) {
        
        guard let activityId = request.activityId else {
            response?(LMResponse.failureResponse("Invalid URL"))
            return
        }
        
        let networkPath = ServiceAPIRequest.NetworkPath.markReadNotificationFeed(request)
        let endpoint = networkPath.apiURL
        guard let url = endpoint.url else {
          response?(LMResponse.failureResponse("Invalid URL"))
          return
        }
        DataNetwork.shared.request(for: url,
                                   withHTTPMethod: networkPath.httpMethod,
                                   headers: ServiceRequest.httpHeaders(),
                                   withParameters: networkPath.parameters,
                                   withEncoding: networkPath.encoding,
                                   withModuleName: moduleName) { (moduleName, responseData) in
            guard let data = responseData as? Data else {return}
            do {
                let result = try JSONDecoder().decode(LMResponse<NoData>.self, from: data)
                response?(result)
            } catch let error {
                response?(LMResponse.failureResponse(error.localizedDescription))
            }
        } failureCallback: { (moduleName, error) in
            response?(LMResponse.failureResponse(error.localizedDescription))
        }
    }
    
    static func getAllMembers(_ request: GetAllMembersRequest, withModuleName moduleName: String, _ response: LMFeedClientResponse<GetAllMembersResponse>?) {
        let networkPath = ServiceAPIRequest.NetworkPath.getAllMembers(request)
        let endpoint = networkPath.apiURL
        guard let url = endpoint.url else {
          response?(LMResponse.failureResponse("Invalid URL"))
          return
        }
        DataNetwork.shared.request(for: url,
                                   withHTTPMethod: networkPath.httpMethod,
                                   headers: ServiceRequest.httpHeaders(),
                                   withParameters: networkPath.parameters,
                                   withEncoding: networkPath.encoding,
                                   withModuleName: moduleName) { (moduleName, responseData) in
            guard let data = responseData as? Data else {return}
            do {
                let result = try JSONDecoder().decode(LMResponse<GetAllMembersResponse>.self, from: data)
                response?(result)
            } catch let error {
                response?(LMResponse.failureResponse(error.localizedDescription))
            }
        } failureCallback: { (moduleName, error) in
            response?(LMResponse.failureResponse(error.localizedDescription))
        }
    }
    
    static func searchMembers(_ request: SearchMembersRequest, withModuleName moduleName: String, _ response: LMFeedClientResponse<SearchMembersResponse>?) {
        let networkPath = ServiceAPIRequest.NetworkPath.searchMembers(request)
        let endpoint = networkPath.apiURL
        guard let url = endpoint.url else {
          response?(LMResponse.failureResponse("Invalid URL"))
          return
        }
        DataNetwork.shared.request(for: url,
                                   withHTTPMethod: networkPath.httpMethod,
                                   headers: ServiceRequest.httpHeaders(),
                                   withParameters: networkPath.parameters,
                                   withEncoding: networkPath.encoding,
                                   withModuleName: moduleName) { (moduleName, responseData) in
            guard let data = responseData as? Data else {return}
            do {
                let result = try JSONDecoder().decode(LMResponse<SearchMembersResponse>.self, from: data)
                response?(result)
            } catch let error {
                response?(LMResponse.failureResponse(error.localizedDescription))
            }
        } failureCallback: { (moduleName, error) in
            response?(LMResponse.failureResponse(error.localizedDescription))
        }
    }
    
    static func getCommunityConfiguration(_ request: GetCommunityConfigurationRequest, withModuleName moduleName: String, _ response: LMFeedClientResponse<GetCommunityConfigurationResponse>?) {
        let networkPath = ServiceAPIRequest.NetworkPath.getCommunityConfiguration(request)
        let endpoint = networkPath.apiURL
        guard let url = endpoint.url else {
          response?(LMResponse.failureResponse("Invalid URL"))
          return
        }
        DataNetwork.shared.request(for: url,
                                   withHTTPMethod: networkPath.httpMethod,
                                   headers: ServiceRequest.httpHeaders(),
                                   withParameters: networkPath.parameters,
                                   withEncoding: networkPath.encoding,
                                   withModuleName: moduleName) { (moduleName, responseData) in
            guard let data = responseData as? Data else {return}
            do {
                let result = try JSONDecoder().decode(LMResponse<GetCommunityConfigurationResponse>.self, from: data)
                response?(result)
            } catch let error {
                response?(LMResponse.failureResponse(error.localizedDescription))
            }
        } failureCallback: { (moduleName, error) in
            response?(LMResponse.failureResponse(error.localizedDescription))
        }
    }
    
    static func submitPollVote(_ request: SubmitPollVoteRequest, withModuleName moduleName: String, _ response: LMFeedClientResponse<NoData>?) {
        
        guard let pollID = request.pollID else {
            response?(LMResponse.failureResponse("Invalid URL"))
            return
        }
        
        let networkPath = ServiceAPIRequest.NetworkPath.submitVote(request)
        let endpoint = networkPath.apiURL
        guard let url = endpoint.url else {
          response?(LMResponse.failureResponse("Invalid URL"))
          return
        }
        
        DataNetwork.shared.request(for: url,
                                   withHTTPMethod: networkPath.httpMethod,
                                   headers: ServiceRequest.httpHeaders(),
                                   withParameters: networkPath.parameters,
                                   withEncoding: networkPath.encoding,
                                   withModuleName: moduleName) { (_, responseData) in
            guard let data = responseData as? Data else { return }
            
            do {
                let result = try JSONDecoder().decode(LMResponse<NoData>.self, from: data)
                response?(result)
            } catch let error {
                response?(LMResponse.failureResponse(error.localizedDescription))
            }
        } failureCallback: { moduleName, error in
            response?(LMResponse.failureResponse(error.localizedDescription))
        }
    }
    
    
    static func addPollOption(_ request: AddPollOptionRequest, withModuleName moduleName: String, _ response: LMFeedClientResponse<AddPollOptionResponse>?) {
        
        guard let pollID = request.pollID else {
            response?(LMResponse.failureResponse("Invalid URL"))
            return
        }
        
        let networkPath = ServiceAPIRequest.NetworkPath.addPollOption(request)
        
        let endpoint = networkPath.apiURL
        guard let url = endpoint.url else {
          response?(LMResponse.failureResponse("Invalid URL"))
          return
        }

        
        DataNetwork.shared.request(for: url,
                                   withHTTPMethod: networkPath.httpMethod,
                                   headers: ServiceRequest.httpHeaders(),
                                   withParameters: networkPath.parameters,
                                   withEncoding: networkPath.encoding,
                                   withModuleName: moduleName) { (_, responseData) in
            guard let data = responseData as? Data else {
                response?(.failureResponse("Unable to parse Data"))
                return
            }
            
            do {
                let result = try JSONDecoder().decode(LMResponse<AddPollOptionResponse>.self, from: data)
                response?(result)
            } catch let error {
                response?(LMResponse.failureResponse(error.localizedDescription))
            }
        } failureCallback: { moduleName, error in
            response?(.failureResponse(error.localizedDescription))
        }
    }
    
    static func getPollVotes(_ request: GetPollVotesRequest, withModuleName moduleName: String, _ response: LMFeedClientResponse<GetPollVotesResponse>?) {
        
        guard let pollID = request.pollID else {
            response?(LMResponse.failureResponse("Invalid URL"))
            return
        }
        
        let networkPath = ServiceAPIRequest.NetworkPath.getPollVotes(request)
        let endpoint = networkPath.apiURL
        guard let url = endpoint.url else {
          response?(LMResponse.failureResponse("Invalid URL"))
          return
        }

//        let path = "\(ServiceAPI.authBaseURL)\(networkPath.apiURL)".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
//        
//        guard let url = URL(string: path ?? "") else {
//            response?(.failureResponse("Invalid Request"))
//            return
//        }
//        
        DataNetwork.shared.request(for: url,
                                   withHTTPMethod: networkPath.httpMethod,
                                   headers: ServiceRequest.httpHeaders(),
                                   withParameters: nil,
                                   withEncoding: networkPath.encoding,
                                   withModuleName: moduleName) { (_, responseData) in
            guard let data = responseData as? Data else {
                response?(.failureResponse("Unable to parse Data"))
                return
            }
            
            do {
                let result = try JSONDecoder().decode(LMResponse<GetPollVotesResponse>.self, from: data)
                response?(result)
            } catch let error {
                response?(LMResponse.failureResponse(error.localizedDescription))
            }
        } failureCallback: { moduleName, error in
            response?(.failureResponse(error.localizedDescription))
        }
    }
    
    static func searchPosts(_ request: SearchPostsRequest, withModuleName moduleName: String, _ response: LMFeedClientResponse<GetFeedResponse>?) {
        let networkPath = ServiceAPIRequest.NetworkPath.searchPost(request)
        let endpoint = networkPath.apiURL
        guard let url = endpoint.url else {
          response?(LMResponse.failureResponse("Invalid URL"))
          return
        }

//        let path = "\(ServiceAPI.authBaseURL)\(networkPath.apiURL)".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
//        
//        guard let url = URL(string: path ?? "") else {
//            response?(.failureResponse("Invalid Request"))
//            return
//        }
        
        DataNetwork.shared.request(
            for: url,
            withHTTPMethod: networkPath.httpMethod,
            headers: ServiceRequest.httpHeaders(),
            withEncoding: networkPath.encoding,
            withModuleName: moduleName) { (_, responseData) in
                guard let data = responseData as? Data else {
                    response?(.failureResponse("Unable to parse Data"))
                    return
                }
                
                do {
                    let result = try JSONDecoder().decode(LMResponse<GetFeedResponse>.self, from: data)
                    response?(result)
                } catch let error {
                    response?(LMResponse.failureResponse(error.localizedDescription))
                }
            } failureCallback: { _, error in
                response?(.failureResponse(error.localizedDescription))
            }
    }
}

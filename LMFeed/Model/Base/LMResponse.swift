//
//  LMResponse.swift
//  LMFeed
//
//  Created by Pushpendra Singh on 19/02/23.
//

import Foundation

public struct LMResponse<T: Decodable>: Decodable {
    public let success: Bool?
    public let errorMessage: String?
    public let data: T?
    
    enum CodingKeys: String, CodingKey {
        case success, data
        case errorMessage = "error_message"
    }
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        success = try values.decodeIfPresent(Bool.self, forKey: .success)
        errorMessage = try values.decodeIfPresent(String.self, forKey: .errorMessage)
        data = try values.decodeIfPresent(T.self, forKey: .data)
    }
}

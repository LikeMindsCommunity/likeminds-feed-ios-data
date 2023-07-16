//
//  GetReportTagRequest.swift
//  LMFeed
//
//  Created by Pushpendra Singh on 13/04/23.
//

import Foundation

//public enum ReportTagType: Int {
//    case 
//}

public class GetReportTagRequest: Encodable {
    var type: Int?

    /// Initiate method
    private init() {}
    
    public static func builder() -> GetReportTagRequest {
        return GetReportTagRequest()
    }
    
    public func build() -> GetReportTagRequest {
        return self
    }
    
    public func type(_ type: Int) -> GetReportTagRequest {
        self.type = type
        return self
    }
}

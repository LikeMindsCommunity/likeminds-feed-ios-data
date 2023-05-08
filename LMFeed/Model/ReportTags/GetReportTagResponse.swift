//
//  GetReportTagResponse.swift
//  LMFeed
//
//  Created by Pushpendra Singh on 13/04/23.
//

import Foundation

public struct GetReportTagResponse: Decodable {
    public let reportTags: [ReportTag]?
    enum CodingKeys: String, CodingKey {
        case reportTags = "report_tags"
    }
}

public struct ReportTag : Decodable {
    public let id : Int?
    public let name : String?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
    }
}

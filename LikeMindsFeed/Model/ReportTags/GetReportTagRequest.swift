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
    var type: Int
    
    public init(_ type: Int) {
        self.type = type
    }
}

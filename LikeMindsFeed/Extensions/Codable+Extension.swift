//
//  Codable+Extension.swift
//  Pods
//
//  Created by Devansh Mohata on 20/08/24.
//

extension Encodable {    
    func toJSON() -> [String: Any] {
        let encoder = JSONEncoder()
        var dict: [String: Any] = [:]
        
        do {
            let jsonData = try encoder.encode(self)
            dict = try JSONSerialization.jsonObject(with: jsonData, options: []) as? [String: Any] ?? [:]
        } catch {
            print("Error in encoding object")
        }
        
        return dict
    }
}

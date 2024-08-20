//
//  URL+Extension.swift
//  Pods
//
//  Created by Devansh Mohata on 19/08/24.
//

extension URLRequest {
    func cURL() -> String {
        var components: [String] = []
        
        // Base cURL command
        components.append("curl -f")
        
        // Method
        components.append("-X \(httpMethod ?? "GET")")
        
        // URL
        if let url = url?.absoluteString {
            components.append("--url '\(url)'")
        }
        
        // Headers
        if let headers = allHTTPHeaderFields {
            for (key, value) in headers {
                components.append("-H '\(key): \(value)'")
            }
        }
        
        // Body data
        if let httpBody = httpBody, !httpBody.isEmpty {
            if let bodyString = String(data: httpBody, encoding: .utf8) {
                // JSON and plain text
                let escaped = bodyString.replacingOccurrences(of: "'", with: "'\\''")
                components.append("--data '\(escaped)'")
            } else {
                // Binary data
                let hexString = httpBody.map { String(format: "%02X", $0) }.joined()
                components.append(#"--data "$(echo '\#(hexString)' | xxd -p -r)""#)
            }
        }
        
        // Join components with newlines and indentation
        return components.joined(separator: " \\\n    ")
    }
}

//
//  NetworkLogger.swift
//  Pods
//
//  Created by Devansh Mohata on 17/08/24.
//

struct NetworkLogger {
    static func logAPICall(request: URLRequest, response: URLResponse?, data: Data?, error: Error?) {
        print("\n============================ API CALL START ============================\n")
        
        // Log Request
        print("📤 REQUEST")
        print("━━━━━━━━━━")
        print(request.cURL())
        
        // Log Response
        print("\n📥 RESPONSE")
        print("━━━━━━━━━━━")
        if let httpResponse = response as? HTTPURLResponse {
            print("Status Code: \(httpResponse.statusCode)")
            print("Headers:")
            for (key, value) in httpResponse.allHeaderFields {
                print("  • \(key): \(value)")
            }
        } else if let response = response {
            print("Response: \(response)")
        } else {
            print("No response")
        }
        
        // Log Data
        print("\n📦 DATA")
        print("━━━━━━━")
        if let jsonString = data?.prettyPrintedJSONString {
            print(jsonString)
        } else {
            print("Unable to parse JSON")
        }
        
        // Log Error
        print("\n❌ ERROR")
        print("━━━━━━━━")
        if let error = error {
            print("Error Domain: \(error.localizedDescription)")
            print("Error Code: \((error as NSError).code)")
            if let underlyingError = (error as NSError).userInfo[NSUnderlyingErrorKey] as? Error {
                print("Underlying Error: \(underlyingError)")
            }
        } else {
            print("No error")
        }
        
        print("\n============================ API CALL FINISH ===========================\n")
    }
}

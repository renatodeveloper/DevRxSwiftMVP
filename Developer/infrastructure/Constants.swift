//
//  Constants.swift
//  Developer
//
//  Created by Renato Rodrigues on 31/03/2019.
//  Copyright © 2019 Renato Rego. All rights reserved.
//

import Foundation
struct Constants {// 1
    /*fonte:
    https://medium.com/@marioamgad9/swift-4-2-building-a-network-layer-using-alamofire-and-rxswift-e044b5636d55
    */
    
    //The API's base URL
    //static let baseUrl = "https://jsonplaceholder.typicode.com"
    static let baseURL = "https://rdeveloper.getsandbox.com/"
    
    //The parameters (Queries) that we're gonna use
    struct Parameters {
        static let userId = "userId"
    }
    
    //-> D
    struct ParametersLogin {
        static let email = "email"
        static let password = "password"
    }
    
    //The header fields
    enum HttpHeaderField: String {
        case authentication = "Authorization"
        case contentType = "Content-Type"
        case acceptType = "Accept"
        case acceptEncoding = "Accept-Encoding"
    }
    
    //The content type (JSON)
    enum ContentType: String {
        case json = "application/json"
    }
}

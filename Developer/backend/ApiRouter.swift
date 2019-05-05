//
//  ApiRouter.swift
//  Developer
//
//  Created by Renato Rodrigues on 31/03/2019.
//  Copyright © 2019 Renato Rego. All rights reserved.
//

import Foundation
import Alamofire

enum ApiRouter: URLRequestConvertible {// 2
    
    //The endpoint name we'll call later
    case getPosts(userId: Int)
    
     //-> D - automaticamente implementa method, path e parameters dessa classe
    case doLogin(email: String, password: String)
    
    //MARK: - URLRequestConvertible
    func asURLRequest() throws -> URLRequest {
        let url = try Constants.baseURL.asURL()
        
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        
        //Http method
        urlRequest.httpMethod = method.rawValue
        
        // Common Headers
        urlRequest.setValue(Constants.ContentType.json.rawValue, forHTTPHeaderField: Constants.HttpHeaderField.acceptType.rawValue)
        urlRequest.setValue(Constants.ContentType.json.rawValue, forHTTPHeaderField: Constants.HttpHeaderField.contentType.rawValue)
        
        //Encoding
        let encoding: ParameterEncoding = {
            switch method {
            case .get:
                return URLEncoding.default
            default:
                return JSONEncoding.default
            }
        }()
        
        return try encoding.encode(urlRequest, with: parameters)
    }
    
    //MARK: - HttpMethod
    //This returns the HttpMethod type. It's used to determine the type if several endpoints are peresent
    private var method: HTTPMethod {
        switch self {
        case .getPosts:
            return .get
        case .doLogin(let email, let password):
            return .post
        }
    }
    
    //MARK: - Path
    //The path is the part following the base url
    private var path: String {
        switch self {
        case .getPosts:
            return "posts"
        case .doLogin(let email, let password):
            return "authentication"
        }
    }
    
    //MARK: - Parameters
    //This is the queries part, it's optional because an endpoint can be without parameters
    private var parameters: Parameters? {
        switch self {
        case .getPosts(let userId):
            //A dictionary of the key (From the constants file) and its value is returned
            return [Constants.Parameters.userId : userId]
        case .doLogin(let email, let password):
            return [Constants.ParametersLogin.email : email, Constants.ParametersLogin.password : password]
        }
    }
}

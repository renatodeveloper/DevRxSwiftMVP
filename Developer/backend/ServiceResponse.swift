//
//  ServiceResponse.swift
//  Developer
//
//  Created by Renato Rego on 01/04/2019.
//  Copyright © 2019 Renato Rego. All rights reserved.
//

import Foundation

class ServiceResponse : Codable {
    
    private var code: String
    private var message: String
    
    init(code: String, message: String){
        self.code = code
        self.message = message
    }
    
    public func setCode(code: String){
        self.code = code
    }
    public func getCode ()-> String{
        return code
    }
    
    public func setMessage(message: String){
        self.message = message
    }
    public func getMessage ()-> String{
        return message
    }
    
}

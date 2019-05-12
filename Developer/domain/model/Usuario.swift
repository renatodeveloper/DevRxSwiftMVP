//
//  Usuario.swift
//  Developer
//
//  Created by Renato Rego on 19/03/2019.
//  Copyright © 2019 Renato Rego. All rights reserved.
//

import Foundation
//-> A ( Codable ) transforma a classe num tipo Observable
class Usuario : Codable{
    var id : Int?
    var email : String?
    var password : String?
    
    init(email : String, password : String) {
        self.email = email
        self.password = password
    }
    
}

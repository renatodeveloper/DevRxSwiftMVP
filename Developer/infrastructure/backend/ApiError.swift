//
//  ApiError.swift
//  Developer
//
//  Created by Renato Rodrigues on 31/03/2019.
//  Copyright © 2019 Renato Rego. All rights reserved.
//

import Foundation
enum ApiError: Error { // 0
    case forbidden              //Status code 403
    case notFound               //Status code 404
    case conflict               //Status code 409
    case internalServerError    //Status code 500
}

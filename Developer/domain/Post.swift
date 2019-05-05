//
//  Post.swift
//  Developer
//
//  Created by Renato Rodrigues on 31/03/2019.
//  Copyright © 2019 Renato Rego. All rights reserved.
//

import Foundation
struct Post: Codable {
    let id: Int
    let title: String
    let body: String
    let userId: Int
}

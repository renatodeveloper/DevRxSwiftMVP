//
//  ILoginService.swift
//  Developer
//
//  Created by Renato Rego on 19/03/2019.
//  Copyright © 2019 Renato Rego. All rights reserved.
//

import Foundation
import RxSwift

protocol ILoginService {
    func doLogin(email : String, password : String) -> Bool
    func goLogin(email : String, password : String) -> Observable<Bool>
}

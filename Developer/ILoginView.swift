//
//  ILoginView.swift
//  Developer
//
//  Created by Renato Rego on 19/03/2019.
//  Copyright © 2019 Renato Rego. All rights reserved.
//

import Foundation

protocol ILoginView {

    func getIdUser() -> String
    func getEmail() -> String
    func getPassword() -> String
    
    func showEmailError(res : String)
    func showPasswordError(res : String)
    func showLoginError(res :String)
    func startMainActivity();
    
    //forgot password
    func showSucessForgotPassword()
    func showErrorForgotPassword(resId : String)
}

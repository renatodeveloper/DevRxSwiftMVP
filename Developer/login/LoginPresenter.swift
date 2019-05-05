//
//  LoginPresenter.swift
//  Developer
//
//  Created by Renato Rego on 19/03/2019.
//  Copyright © 2019 Renato Rego. All rights reserved.
//

import Foundation
import RxSwift

class LoginPresenter: ILoginPresenter{
    
    
    var view : ILoginView?
    var service : LoginService?
    
    
    init(view : ILoginView) {
        self.view = view
        service = LoginService()
    }
    
    
    func doLogin(email: String, password : String){
        if email.isEmpty == true {
            self.view?.showEmailError(res: "Preencha o email")
            return
        }
        
        if password.isEmpty == true {
            self.view?.showEmailError(res: "Preencha a senha")
             return
        }
        
        LoginService().goLogin(email: email, password: password)
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { result in
                if result {
                    self.view?.startMainActivity()
                    return
                }
                self.view?.showLoginError(res: "Erro no login")
                return
            }, onError: { error in
                switch error {
                case ApiError.conflict:
                    print("Conflict error")
                case ApiError.forbidden:
                    print("Forbidden error")
                case ApiError.notFound:
                    print("Not found error")
                default:
                    print("Unknown error:", error)
                }
                self.view?.showLoginError(res: "Erro no login")
                return

            })
    
        /*
         if self.service!.doLogin(email: email, password: password){
            self.view?.startMainActivity()
            return
         }else{
            self.view?.showLoginError(res: "Erro no login")
            return
         }
        */
       
    }
}

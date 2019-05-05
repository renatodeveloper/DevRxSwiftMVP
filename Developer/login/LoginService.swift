//
//  LoginService.swift
//  Developer
//
//  Created by Renato Rego on 19/03/2019.
//  Copyright © 2019 Renato Rego. All rights reserved.
//

import Foundation
import UIKit
import RxSwift

class LoginService :ILoginService {
 
    //Dispose bag
    private let disposeBag = DisposeBag()
    
    func goLogin(email: String, password: String)-> Observable<Bool>{
        return Observable.create { observer in
            ApiClient.doLogin(email: email, password: password)
                .observeOn(MainScheduler.instance)
                .subscribe(onNext: {
                    result in
                    print("Status: message:", result.getMessage(),"| code: \(result.getCode())")
                    if result.getCode() == "200" {
                        observer.onNext(true)
                        observer.onCompleted()
                    }
                    observer.onNext(false)
                    observer.onCompleted()
                }, onError: {
                    error in
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
                    observer.onError(error)
                })
            return Disposables.create()
        }
    }
    
    func doLogin(email: String, password: String) -> Bool {
        //-> B
        ApiClient.doLogin(email: "dev", password: "dev")
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: {
                result in
                print("Status: message:", result.getMessage(),"| code: \(result.getCode())")
            }, onError: {
                error in
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
            })
            .disposed(by: disposeBag)
        return false
    }

}

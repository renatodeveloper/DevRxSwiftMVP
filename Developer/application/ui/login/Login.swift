//
//  Login.swift
//  Developer
//
//  Created by Renato Rego on 19/03/2019.
//  Copyright © 2019 Renato Rego. All rights reserved.
//

import UIKit
import RxSwift
class Login: UIViewController, ILoginView {
    
    @IBOutlet  var email: UITextField!
    @IBOutlet weak var password: UITextField!
    
    var presenter: LoginPresenter?
    
    //Dispose bag
    //private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter = LoginPresenter(view: self)
        // 4
        /*
        ApiClient.getPosts(userId: 1)
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { postsList in
                print("List of posts:", postsList)
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
            })
            .disposed(by: disposeBag)
            */
    }
    
    @IBAction func login(_ sender: UIButton) {
        
        presenter?.doLogin(email : self.email.text!, password : self.password.text!)
    }
    
    func getIdUser()-> String {
        return ""
    }
    func getEmail() -> String {
        return email.text != "" ? email.text! : ""
    }
    
    func getPassword() -> String {
     return password.text != "" ? password.text! : ""
    }
    
    func startMainActivity() {
        performSegue(withIdentifier: "goToHome", sender: self)
    }
    
    func showSucessForgotPassword() {
        
    }
    
    func showErrorForgotPassword(resId: String) {
       
    }
    func showEmailError(res: String) {
        callShowAlert(msg: res)
    }
    
    func showPasswordError(res: String) {
        callShowAlert(msg: res)
        
    }
    
    func showLoginError(res: String) {
       callShowAlert(msg: res)
    }
    
    func callShowAlert(msg : String){
        let alertController = UIAlertController(title: "Atenção", message: msg, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
        self.present(alertController, animated: true, completion: nil)
    }
    
}

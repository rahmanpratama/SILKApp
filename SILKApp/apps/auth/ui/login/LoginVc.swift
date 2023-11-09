//
//  LoginVc.swift
//  SILKApp
//
//  Created by Rahman Pratama on 11/8/23.
//

import Foundation
import UIKit
import Factory
import RxSwift
class LoginVc : BaseViewController {
    
    @Injected(AuthContainer.router) private var router
    @Injected(AuthContainer.loginVm) private var viewModel
    
    override func loadView() {
        view = LoginView()
    }
    
    override func initComponent() {
        
    }
    
    override func initObserver() {
        viewModel.liveSuccessLogin.subscribe{ data in
            let view = self.view as! LoginView
            self.router.navigateToHome()
        }.disposed(by: self.disposeBag)
        
        viewModel.liveFailedLogin.subscribe{ data in
            let view = self.view as! LoginView
            view.warningLabel.isHidden = false
        }.disposed(by: self.disposeBag)
        
    }
    
    override func initEventListener() {
        let view = self.view as! LoginView
        view.delegate = self
    }
}

extension LoginVc: LoginViewDelegate {
    func didPressRegisterNow() {
        self.router.navigateToRegister(source: self)
    }
    
    func didButtonPressed() {
        let view = self.view as! LoginView
        let email = view.emailInput.textfield.text ?? ""
        let password = view.passwordInput.textfield.text ?? ""
        self.viewModel.requestLogin(email: email, password: password)
//        self.viewModel.requestOtp(email: "eve.holt@reqres.in", password: "cityslicka")
//        self.viewModel.requestOtp(email: "peter@klaven", password: "")
      
    }
}

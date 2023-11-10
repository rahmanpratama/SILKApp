//
//  RegisterVc.swift
//  SILKApp
//
//  Created by Rahman Pratama on 11/10/23.
//

import Foundation
import UIKit
import Factory
class RegisterVc : BaseViewController {
    
    @Injected(AuthContainer.router) private var router
    
    override func loadView() {
        view = RegisterView()
    }
    
    override func initComponent() {
        
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func initEventListener() {
        let view = self.view as! RegisterView
        view.delegate = self
    }
}

extension RegisterVc: RegisterViewDelegate {
    func didPressLoginNow() {
        self.router.navigateToLogin()
    }
    
    func didButtonPressed() {
        self.router.navigateToHome()
    }
}

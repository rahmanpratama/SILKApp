//
//  AuthContainer.swift
//  SILKApp
//
//  Created by Rahman Pratama on 11/8/23.
//

import Foundation
import Factory

class AuthRouter {

    func navigateToHome() {
        var navigation: UINavigationController!
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let vc = HomeVc()
        navigation = UINavigationController(rootViewController: vc)
        appDelegate.window?.rootViewController = navigation
    }
    
    func navigateToLogin() {
        var navigation: UINavigationController!
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let vc = LoginVc()
        navigation = UINavigationController(rootViewController: vc)
        appDelegate.window?.rootViewController = navigation
    }
    
    func navigateToRegister(source: UIViewController) {
        let vc = RegisterVc()
        source.navigationController?.pushViewController(vc, animated: true)
    }
}

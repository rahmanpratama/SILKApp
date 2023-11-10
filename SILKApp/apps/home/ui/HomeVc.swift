//
//  HomeVc.swift
//  SILKApp
//
//  Created by Rahman Pratama on 11/9/23.
//

import Foundation
import UIKit
import SnapKit
import Factory
class HomeVc : BaseViewController {
    
    @Injected(AuthContainer.router) private var authRouter
    @Injected(HomeContainer.router) private var homeRouter
    
    let sidebar =  HomeSidebarVc()
    override func loadView() {
        view = HomeView()
    }
    var sidebarshowing = false
    override func initComponent() {
        let view = self.view as! HomeView
        addChild(sidebar)
    
        view.addSubview(sidebar.view)
        sidebar.view.frame = CGRect(x: UIScreen.main.bounds.width, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
    
        sidebar.delegate = self
    }
    
    override func initEventListener() {
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let view = self.view as! HomeView
        setupCustomHomeNavBar()
        view.categoryServiceType.autoSelectfirstIndex()
    }
    
    func setupCustomHomeNavBar() {
        let view = self.view as! HomeView
        view.customNavBar.delegate = self
    }
    
    private func showSidebar() {
        UIView.animate(withDuration: 0.3) {
            self.sidebar.view.frame.origin.x = 0
        }
    }
    
    private func hideSidebar() {
        UIView.animate(withDuration: 0.3) {
            self.sidebar.view.frame.origin.x = UIScreen.main.bounds.width
        }
    }
}

extension HomeVc : SilkNavigationBarDelegate {
    func didPressMenu() {
        if self.sidebarshowing {
            self.hideSidebar()
            self.sidebarshowing = false
        } else {
            self.showSidebar()
            self.sidebarshowing = true
        }
    }
    
  
}

extension HomeVc : HomeSidebarVcDelegate {
    func didPressProfile() {
        self.homeRouter.navigateToProfile(source: self )
    }
    
    func didPressButton() {
        self.authRouter.navigateToLogin()
    }
    
    func didCancelPressed() {
        self.authRouter.navigateToHome()
    }
    
    
}

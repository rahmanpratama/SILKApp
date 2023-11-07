//
//  ViewController.swift
//  SILKApp
//
//  Created by Rahman Pratama on 11/7/23.
//

import UIKit
import SnapKit

class StarterVc: UIViewController {

    let icon: UIImageView = {
        let icon = UIImageView()
        icon.image = UIImage(named: "silk_logo")
        icon.contentMode = .scaleAspectFit
        
        return icon
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(icon)
        
        icon.snp.makeConstraints{ make in
            make.center.equalToSuperview()
            make.width.height.equalTo(200)
        }
    }
    
    
    // Routing, Dummy starter, for firebase or such starter.
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(false)
        changeScreen()
    }
    
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    
    func changeScreen() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
            var navigation: UINavigationController!
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let vc = LoginVc()
            navigation = UINavigationController(rootViewController: vc)
            appDelegate.window?.rootViewController = navigation
        })
        
    }
}


//
//  ProfileVc.swift
//  SILKApp
//
//  Created by Rahman Pratama on 11/10/23.
//

import Foundation
import UIKit
import SnapKit
import Factory
class ProfileVc : BaseViewController {
    
    override func loadView() {
        view = ProfileView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let view = self.view as! ProfileView
        view.categoryType.autoSelectfirstIndex()
    }
}

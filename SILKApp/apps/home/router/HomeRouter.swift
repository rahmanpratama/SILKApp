//
//  HomeRouter.swift
//  SILKApp
//
//  Created by Rahman Pratama on 11/8/23.
//

import Foundation
import UIKit

class HomeRouter {
    func navigateToProfile(source: UIViewController) {
        let vc = ProfileVc()
        source.navigationController?.pushViewController(vc, animated: true)
    }
}

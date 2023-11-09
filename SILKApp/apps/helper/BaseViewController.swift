//
//  BaseViewController.swift
//  SILKApp
//
//  Created by Rahman Pratama on 11/9/23.
//

import Foundation
import UIKit
import RxSwift

class BaseViewController: UIViewController, UIGestureRecognizerDelegate {
    private var _disposeBag: DisposeBag?
    var viewControllerIdentifier: String?
    var disposeBag: DisposeBag {
        get {
            if let d = self._disposeBag {
                return d
            } else {
                self._disposeBag = DisposeBag()
                return self._disposeBag!
            }
        }
    }
    
    override func viewDidLoad() {
        initComponent()
        initEventListener()
        initObserver()
        loadData()
        
        //backslide
        navigationController?.interactivePopGestureRecognizer?.delegate = self

    }
    
    func initComponent() {}
    
    func initEventListener() {}
    
    func initObserver() {}
    
    func loadData() {}
}

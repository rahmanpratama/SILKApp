//
//  LoginVm.swift
//  SILKApp
//
//  Created by Rahman Pratama on 11/10/23.
//

import Foundation
import RxSwift
import Factory

class LoginVm {
    
    @Injected(AuthContainer.authService) private var service
    
    private let _liveFailedLogin = { PublishSubject<String>() }()
    var liveFailedLogin: Observable<String> {
        _liveFailedLogin.asObservable()
    }
    
    private let _liveSuccessLogin = { PublishSubject<String>() }()
    var liveSuccessLogin: Observable<String> {
        _liveSuccessLogin.asObservable()
    }
    
    func requestLogin(email: String, password: String) {
        let request = LoginRequest(email: email, password: password)
        service.requestLogin(request: request) { result in
            switch result {
                case .success(let data): do {
                    self._liveSuccessLogin.onNext(data.token)
                }
                case .error(let error): do {
                    self._liveFailedLogin.onNext(error.message ?? "failed")
                }
            }
        }
    }
    
}

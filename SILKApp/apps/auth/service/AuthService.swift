//
//  AuthService.swift
//  SILKApp
//
//  Created by Rahman Pratama on 11/8/23.
//

import Foundation
import Alamofire
import Factory
class AuthService {
    @Injected(AuthContainer.authClient) private var client
    
    func requestLogin(request: LoginRequest, completion: @escaping(ApiResult<LoginResponse>) -> ()) {
        client.requestLogin(request: request, completion: completion)
    }
}

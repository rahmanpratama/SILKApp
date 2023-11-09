//
//  AuthClient.swift
//  SILKApp
//
//  Created by Rahman Pratama on 11/8/23.
//

import Foundation
import Alamofire
import Factory

class AuthClient {
    
    @Injected(AuthContainer.httpClient) private var httpClient
    
    func requestLogin(request: LoginRequest, completion: @escaping(ApiResult<LoginResponse>) -> ()) {
        let _ = httpClient.post(url: "https://reqres.in/api/login", param: request, responseType: LoginResponse.self, onComplete: completion)
    }
}

//
//  LoginRequest.swift
//  SILKApp
//
//  Created by Rahman Pratama on 11/10/23.
//

import Foundation

struct LoginRequest: Encodable {
    var email: String
    var password: String
}

struct LoginResponse: Decodable {
    let token: String
}

//
//  AuthContainer.swift
//  SILKApp
//
//  Created by Rahman Pratama on 11/8/23.
//

import Foundation
import Factory

class AuthContainer: SharedContainer {
    static let router = Factory(scope: .singleton) { AuthRouter() }
    static let authClient = Factory(scope: .singleton) { AuthClient() }
    static let authService = Factory(scope: .singleton) { AuthService() }
    static let apiErrorDtoParser = Factory(scope: .singleton, factory: { ApiErrorDtoParser() })
    static let httpClient = Factory(scope: .singleton, factory: { HttpClient() })
}

// MARK: View Models
extension AuthContainer {
    static let loginVm = Factory { LoginVm() }
}

//
//  HomeContainer.swift
//  SILKApp
//
//  Created by Rahman Pratama on 11/8/23.
//

import Foundation
import Factory

class HomeContainer {
    static let router = Factory(scope: .singleton) { HomeRouter() }
}

// MARK: View Models
extension AuthContainer {
    
}



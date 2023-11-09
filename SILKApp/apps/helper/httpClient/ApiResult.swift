//
//  ApiResult.swift
//  SILKApp
//
//  Created by Rahman Pratama on 11/10/23.
//

import Foundation


enum Result<Value> {
    case success(Value)
    case error(Error)
    case failure([ErrorResponse])
}

enum ResultStatusResp<Value> {
    case success(Value)
    case failure(String)
    case serverBussy
}

enum ResultResponse<Value> {
    case message(String)
    case status(Int)
    case error(Error)
    case data(Value)
}

struct CauseError : Error {
    
}

enum ApiResult<Value> {
    case success(Value)
    case error(ApiErrorDto)
}


struct ErrorResponse: Codable {
    var code: String?
    var text: String?
    var type: String?
}


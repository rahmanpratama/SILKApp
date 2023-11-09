//
//  ApiErrorDto.swift
//  SILKApp
//
//  Created by Rahman Pratama on 11/10/23.
//

import Foundation


let GeneralErrorCode = -1
struct ApiErrorDto : Codable {
    var status: Int
    var message: String?
    var error: String?
    var path: String?
    var timestamp: String?
    var details: [ErrorDetail]?
    
    static let connectionTimeout = ApiErrorDto(status: 1000, message: "ConnectionTimeout", error: nil, path: nil, timestamp: nil, details: nil)
    static let unhandledError = ApiErrorDto(status: -9999, message: "UnhandledError", error: nil, path: nil, timestamp: nil, details: nil)
    static let responseParseError = ApiErrorDto(status: 2000, message: "ResponseParseError", error: nil, path: nil, timestamp: nil, details: nil)
    func getAdditionalDataValue(code: String, key: String) -> String? {
        return self.details?.first(where: { detail in
            return code == detail.code
        })?.additionalData?.first(where: { additional in
            return additional.key == key
        })?.value
    }
}

struct ErrorDetail : Codable {
    var code: String?
    var objectName: String?
    var defaultMessage: String?
    //var rejectedValue: String?
    var additionalData: [ErrorAdditionalData]?
}

struct ErrorAdditionalData : Codable {
    var key: String?
    var value: String?
}

struct ApiEventData<T : Codable> : Codable {
    var status: ApiErrorDto
    var data: T
}

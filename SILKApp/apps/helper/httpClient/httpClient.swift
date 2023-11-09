//
//  httpClient.swift
//  SILKApp
//
//  Created by Rahman Pratama on 11/10/23.
//

import Alamofire
import Factory

struct ApiErrorDtoParser {
    func parse(_ data: Data?) -> ApiErrorDto {
        if let dataError = data {
            do {
                return try JSONDecoder().decode(ApiErrorDto.self, from: dataError)
            } catch {
                return .responseParseError
            }
        }
        
        return .unhandledError
    }
}

/// Base HTTP client. Use HttpClient.Builder().build() to create instance of this class
class HttpClient {
    @Injected(AuthContainer.apiErrorDtoParser) private var apiErrorDtoParser
    
    
    func get<T: Decodable>(url: String, responseType: T.Type, onComplete: @escaping (ApiResult<T>) -> (), encoding: ParameterEncoding = URLEncoding.queryString) -> DataRequest {
        
        return request(url: url, method: .get, param: nil, responseType: responseType, onComplete: onComplete, encoding: encoding)
    }

    
    func post<T: Decodable, U: Encodable>(url: String, param: U?, responseType: T.Type, onComplete: @escaping (ApiResult<T>) -> () ) -> DataRequest {
        let param = objectToDict(data: param)
        return request(url: url, method: .post, param: param, responseType: responseType, onComplete: onComplete)
    }
    
  
    
    func request<T: Decodable>(url: String, method: HTTPMethod, param: [String:Any]?, responseType: T.Type, onComplete: @escaping (ApiResult<T>) -> (), encoding: ParameterEncoding = JSONEncoding.default) -> DataRequest {
        
        let request = AF.request(url, method: method, parameters: param, encoding: encoding, headers: nil)
            .validate(statusCode: 200...300)
            .responseDecodable(of: responseType) { dataResponse in
                Log.debug(dataResponse)
                if let result = self.responseDecodeableProcessor(data: dataResponse) {
                    onComplete(result)
                }
            }
        return request
    }
    
    private func responseDecodeableProcessor<T: Decodable>(data: DataResponse<T, AFError>) -> ApiResult<T>? {

        switch data.result {
            case .success(let result): return .success(result)
            case .failure(let afError): do {
                if afError.isSessionTaskError {
                    return .error(.connectionTimeout)
                }
                
                return .error(apiErrorDtoParser.parse(data.data))
            }
        }
    }
    
    private func objectToDict<T: Encodable>(data: T) -> [String:Any]? {
        do {
            let json = try JSONEncoder().encode(data)
            let dictResult = try JSONSerialization.jsonObject(with: json, options: []) as? [String:Any]
            return dictResult
        } catch {
            return nil
        }
    }
}




class Log {
    static func print(_ msg: String) {
        #if DEBUG
            Swift.print(msg)
        #endif
    }
    
    static func debug(_ data: Any) {
        #if DEBUG
            debugPrint(data)
        #endif
    }
}

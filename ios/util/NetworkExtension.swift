//
//  NetworkExtension.swift
//  ios
//
//  Created by YeongWooKim on 12/31/23.
//

import Alamofire

extension Session {
    func baseRequest(_ urlString: String, method: HTTPMethod = .get, cookie: String? = nil,
                     body: Parameters? = nil) async -> DataRequest {
        var headers: HTTPHeaders = []
        if let cookie { headers.add(name: COOKIE_HEADER, value: cookie) }
        if body != nil { headers.add(name: CONTENT_TYPE_HEADER, value: CONTENT_TYPE_JSON) }
        return request("\(BASE_URL)\(urlString)", method: method, parameters: body,
                       encoding: body == nil ? URLEncoding.default : JSONEncoding.default,
                       headers: headers)
    }
}

extension DataRequest {
    func validateAndDecode<T>(_ type: T.Type = Empty.self) async -> Result<T, AFError> where T: Decodable {
        return await self.validate(statusCode: STATUS_CODE_SUCCESS)
            .serializingDecodable(T.self, decoder: JSONDecoder.shared)
            .result
    }
}

extension Result where Success: Decodable {
    func returnOrNil() async -> Success? {
        switch self {
        case .success(let success):
            return success
        case .failure(let error):
            debugPrint(error.localizedDescription)
            return nil
        }
    }
    
    func isSuccess() async -> Bool {
        switch self {
        case .success(_):
            return true
        case .failure(let error):
            debugPrint(error.localizedDescription)
            return false
        }
    }
}

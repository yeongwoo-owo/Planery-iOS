//
//  AuthRepository.swift
//  ios
//
//  Created by YeongWooKim on 12/31/23.
//

import Alamofire

class AuthRepository {
    static let shared = AuthRepository()
    private init() {}
    
    func generate() async -> String {
        return await AF.baseRequest("/auth/generate", method: .post)
            .validateAndDecode(CookieResponse.self)
            .returnOrNil()?.cookie ?? ""
    }
    
    func validate(cookie: String) async -> Bool {
        return await AF.baseRequest("/auth/validate", cookie: cookie)
            .validateAndDecode()
            .isSuccess()
    }
}

struct CookieResponse: Decodable {
    let cookie: String
}

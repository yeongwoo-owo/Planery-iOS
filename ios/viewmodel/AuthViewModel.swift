//
//  AuthViewModel.swift
//  ios
//
//  Created by YeongWooKim on 12/31/23.
//

import SwiftUI

class AuthViewModel: ObservableObject {
    private let authRepository = AuthRepository.shared
    
    @AppStorage(COOKIE_HEADER) private var cookie: String?
    @Published var isInitialized = false {
        didSet { debugPrint(isInitialized ? "로그인" : "로그아웃") }
    }
    
    init() {
        Task {
            let value = await self.setup()
            DispatchQueue.main.async {
                self.cookie = value
                self.isInitialized = true
            }
        }
    }
    
    private func setup() async -> String {
        guard let cookie = cookie else {
            debugPrint("쿠키 없음, 새로운 사용자 생성")
            return await generate()
        }
        
        if await validate(cookie: cookie) {
            debugPrint("쿠키 인증 성공")
            return cookie
        }
        
        debugPrint("쿠키 인증 실패, 새로운 사용자 생성")
        return await generate()
    }
    
    private func generate() async -> String {
        return await authRepository.generate()
    }
    
    private func validate(cookie: String) async -> Bool {
        return await authRepository.validate(cookie: cookie)
    }
    
    func logout() {
        Task {
            DispatchQueue.main.async {
                self.cookie = nil
                self.isInitialized = false
            }
        }
    }
}

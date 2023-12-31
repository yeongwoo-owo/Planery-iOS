//
//  iosApp.swift
//  ios
//
//  Created by YeongWooKim on 12/31/23.
//

import SwiftUI

@main
struct iosApp: App {
    @StateObject var authViewModel = AuthViewModel()
    
    var body: some Scene {
        WindowGroup {
            if authViewModel.isInitialized {
                ContentView()
                    .environmentObject(authViewModel)
            } else {
                SplashView()
            }
        }
    }
}

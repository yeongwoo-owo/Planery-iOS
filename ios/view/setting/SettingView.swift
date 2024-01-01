//
//  SettingView.swift
//  ios
//
//  Created by YeongWooKim on 1/1/24.
//

import SwiftUI

struct SettingView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    
    var body: some View {
        List {
            Section {
                Button(action: { authViewModel.logout() }) {
                    Text("로그아웃")
                }
            }
        }
        .tint(.primary)
    }
}

#Preview {
    SettingView()
        .environmentObject(AuthViewModel())
}

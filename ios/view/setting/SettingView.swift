//
//  SettingView.swift
//  ios
//
//  Created by YeongWooKim on 1/1/24.
//

import SwiftUI

struct SettingView: View {
    @EnvironmentObject var appViewModel: AuthViewModel
    
    var body: some View {
        List {
            Section {
                Button(action: { appViewModel.logout() }) {
                    Text("로그아웃")
                }
            }
        }
        .tint(.primary)
    }
}

#Preview {
    SettingView()
}

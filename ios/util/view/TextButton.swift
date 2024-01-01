//
//  TextButton.swift
//  ios
//
//  Created by YeongWooKim on 1/2/24.
//

import SwiftUI

struct TextButton: View {
    let name: String
    let action: () -> ()
    
    init(_ name: String, action: @escaping () -> Void) {
        self.name = name
        self.action = action
    }
    
    var body: some View {
        Button(action: action) {
            HStack {
                Spacer()
                Text(name)
                    .bold()
                    .foregroundStyle(.white)
                Spacer()
            }
            .padding()
            .background {
                HStack {
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundStyle(.blue)
                }
            }
        }
        .padding()
    }
}

#Preview {
    TextButton("Button", action: {})
}

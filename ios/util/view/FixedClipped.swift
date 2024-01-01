//  Ref: https://stackoverflow.com/questions/62746684/how-to-get-swiftui-text-to-clip-instead-of-truncate-with-dots
//  FixedClipped.swift
//  ios
//
//  Created by YeongWooKim on 1/1/24.
//

import SwiftUI

struct FixedClipped: ViewModifier {
    func body(content: Content) -> some View {
        ZStack(alignment: .leading) {
            content.hidden().layoutPriority(1)
            content.fixedSize(horizontal: true, vertical: false)
        }
        .clipped()
    }
}

extension View {
    func fixedClipped() -> some View {
        self.modifier(FixedClipped())
    }
}

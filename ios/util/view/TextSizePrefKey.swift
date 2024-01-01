//
//  TextSizePrefKey.swift
//  ios
//
//  Created by YeongWooKim on 1/1/24.
//

import SwiftUI

struct TextSizePrefKey: PreferenceKey {
    static var defaultValue: CGSize = .zero

    static func reduce(value: inout CGSize, nextValue: () -> CGSize) {
        value = nextValue()
    }
}

struct TextGeometry: View {
    var body: some View {
        GeometryReader { geometry in
            Color.clear
                .preference(key: TextSizePrefKey.self, value: geometry.size)
        }
    }
}

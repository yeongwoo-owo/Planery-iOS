//
//  CalendarDayBackgroundView.swift
//  ios
//
//  Created by YeongWooKim on 1/1/24.
//

import SwiftUI

struct CalendarDayBackgroundView: View {
    @Environment(\.colorScheme) private var theme
    let month: Date
    let day: Date
    
    var body: some View {
        dayBackground()
            .background {
                Rectangle()
                    .stroke(.gray.opacity(theme == .light ? 0.05 : 0.1))
            }
    }
    
    @ViewBuilder
    func dayBackground() -> some View {
        VStack {
            if day.isToday() {
                Color.gray.opacity(theme == .light ? 0.15 : 0.3)
            } else {
                Color.clear
            }
        }
    }
}

#Preview("Light") {
    CalendarView()
}

#Preview("Dark") {
    CalendarView()
        .preferredColorScheme(.dark)
}

//
//  CalendarWeekdayView.swift
//  ios
//
//  Created by YeongWooKim on 1/1/24.
//

import SwiftUI

struct CalendarWeekdayView: View {
    var body: some View {
        HStack(spacing: 0) {
            ForEach(Weekday.allCases, id: \.self) { weekday in
                weekdayView(weekday)
            }
        }
    }
    
    @ViewBuilder
    private func weekdayView(_ weekday: Weekday) -> some View {
        HStack(spacing: 0) {
            Spacer()
            Text(weekday.rawValue)
                .foregroundStyle(weekday.color)
                .font(.caption)
            Spacer()
        }
        .padding(.vertical, 5)
    }
}

#Preview("Light", traits: .sizeThatFitsLayout) {
    CalendarWeekdayView()
}

#Preview("Dark", traits: .sizeThatFitsLayout) {
    CalendarWeekdayView()
        .preferredColorScheme(.dark)
}

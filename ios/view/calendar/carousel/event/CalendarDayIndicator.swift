//
//  CalendarDayIndicator.swift
//  ios
//
//  Created by YeongWooKim on 1/1/24.
//

import SwiftUI

struct CalendarDayIndicator: View {
    let month: Date
    let date: Date
    
    var body: some View {
        Text(String(date.day))
            .font(.subheadline)
            .frame(maxWidth: .infinity)
            .foregroundStyle(date.weekday.color)
            .opacity(date.isSameMonth(with: month) ? 1 : 0.5)
            .padding(.vertical, 3)
    }
}

#Preview("Light") {
    CalendarView()
}

#Preview("Dark") {
    CalendarView()
        .preferredColorScheme(.dark)
}

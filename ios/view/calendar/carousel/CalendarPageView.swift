//
//  CalendarPageView.swift
//  ios
//
//  Created by YeongWooKim on 1/1/24.
//

import SwiftUI

struct CalendarPageView: View {
    let month: Date
    
    var body: some View {
        VStack(spacing: 0) {
            CalendarWeekdayView()
            ColoredDivider()
                .foregroundStyle(.gray)
            CalendarMonthView(month: month)
        }
        .background {
            RoundedRectangle(cornerRadius: 20)
                .strokeBorder(.gray)
        }
    }
}

#Preview {
    CalendarView()
}

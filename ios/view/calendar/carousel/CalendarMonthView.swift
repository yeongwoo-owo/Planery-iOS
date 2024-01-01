//
//  CalendarMonthView.swift
//  ios
//
//  Created by YeongWooKim on 1/1/24.
//

import SwiftUI

struct CalendarMonthView: View {
    let month: Date
    
    var body: some View {
        VStack(spacing: 0) {
            ForEach(0..<6, id: \.self) { index in
                CalendarWeekView(month: month, 
                                 startOfWeek: month.firstDayInCalendar.interval(week: index))
            }
        }
        .padding(5)
    }
}

#Preview("Light") {
    CalendarView()
}

#Preview("Dark") {
    CalendarView()
        .preferredColorScheme(.dark)
}

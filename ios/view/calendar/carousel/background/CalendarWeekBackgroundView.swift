//
//  CalendarWeekBackgroundView.swift
//  ios
//
//  Created by YeongWooKim on 1/1/24.
//

import SwiftUI

struct CalendarWeekBackgroundView: View {
    let month: Date
    let startOfWeek: Date
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(0..<7, id: \.self) { index in
                CalendarDayBackgroundView(month: month, 
                                          day: startOfWeek.interval(day: index))
            }
        }
    }
}

#Preview {
    CalendarView()
}

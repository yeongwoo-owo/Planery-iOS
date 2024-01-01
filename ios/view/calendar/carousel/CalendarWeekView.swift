//
//  CalendarWeekView.swift
//  ios
//
//  Created by YeongWooKim on 1/1/24.
//

import SwiftUI

struct CalendarWeekView: View {
    let month: Date
    let startOfWeek: Date
    
    var body: some View {
        ZStack {
            CalendarWeekBackgroundView(month: month, startOfWeek: startOfWeek)
            CalendarWeekEventView(month: month, startOfWeek: startOfWeek)
            CalendarWeekGestureView(startOfWeek: startOfWeek)
        }
    }
}

#Preview {
    CalendarView()
        .environmentObject(CalendarViewModel())
}

//
//  CalendarWeekEventView.swift
//  ios
//
//  Created by YeongWooKim on 1/1/24.
//

import SwiftUI

struct CalendarWeekEventView: View {
    @EnvironmentObject private var viewModel: CalendarViewModel
    let month: Date
    let startOfWeek: Date
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                ForEach(0..<7, id: \.self) { index in
                    CalendarDayIndicator(month: month, date: startOfWeek.interval(day: index))
                }
            }
            
            CalendarWeekEventIndicatorContainer(month: month,
                                                startOfWeek: startOfWeek)
            
            ForEach(0..<7, id: \.self) { index in
                HStack {
                    Spacer(minLength: 0)
                }
            }
        }
    }
}

#Preview {
    CalendarView()
        .environmentObject(CalendarViewModel())
}

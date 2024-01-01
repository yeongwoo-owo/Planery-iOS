//
//  CalendarWeekGestureView.swift
//  ios
//
//  Created by YeongWooKim on 1/1/24.
//

import SwiftUI

struct CalendarWeekGestureView: View {
    let startOfWeek: Date
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(0..<7, id: \.self) { index in
                Color.clear
                    .contentShape(Rectangle())
                    .onTapGesture {
                        print(startOfWeek.interval(day: index))
                    }
            }
        }
    }
}

#Preview {
    CalendarWeekGestureView(startOfWeek: .now)
}

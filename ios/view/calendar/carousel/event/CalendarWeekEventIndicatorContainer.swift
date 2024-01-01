//
//  CalendarWeekEventIndicatorContainer.swift
//  ios
//
//  Created by YeongWooKim on 1/1/24.
//

import SwiftUI

struct CalendarWeekEventIndicatorContainer: View {
    @EnvironmentObject private var viewModel: CalendarViewModel
    let month: Date
    let startOfWeek: Date
    
    @State private var height: CGFloat = .zero
    private var padding: CGFloat { get { height / 5 } }
    
    var body: some View {
        GeometryReader { proxy in
            let widthUnit = proxy.size.width / 7
            let maxEvent = Int(proxy.size.height / max(1, (height + padding)))
            
            ForEach(viewModel.getEventWithHeight(from: startOfWeek,
                                                 to: startOfWeek.nextWeek)) {
                let event = $0.event
                let start = max(event.duration.start, startOfWeek)
                let end = min(event.duration.end, startOfWeek.nextWeek)
                
                if $0.height < maxEvent {
                    let width = CGFloat(max(1, start.difference(to: end))) * widthUnit
                    let x = CGFloat(startOfWeek.difference(to: start)) * widthUnit
                    let y = CGFloat($0.height) * (height + padding)
                    
                    EventIndicator(month: month, event: event, padding: padding, height: $height)
                        .frame(width: width, height: height)
                        .offset(x: x, y: y)
                }
            }
        }
    }
}

#Preview("Light") {
    CalendarWeekEventView(month: Date(year: 2023, month: 12),
                          startOfWeek: Date(year: 2023, month: 12, day: 31))
    .environmentObject(CalendarViewModel(events: testEvents))
}

#Preview("Dark") {
    CalendarWeekEventView(month: Date(year: 2023, month: 12),
                          startOfWeek: Date(year: 2023, month: 12, day: 31))
    .preferredColorScheme(.dark)
    .environmentObject(CalendarViewModel(events: testEvents))
}

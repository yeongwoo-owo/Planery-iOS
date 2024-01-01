//
//  EventIndicator.swift
//  ios
//
//  Created by YeongWooKim on 1/1/24.
//

import SwiftUI

struct EventIndicator: View {
    let month: Date
    let event: Event
    let padding: CGFloat
    private var isDone: Bool { get { event.type == .todo(isDone: true) } }
    
    @Binding var height: CGFloat
    
    var body: some View {
        ZStack {
            calendarIndicator()
            eventIndicator()
            
            if isDone == true {
                eventDoneLine()
            }
        }
        .background {
            if event.type == .todo() {
                todoBackground()
            } else {
                scheduleBackground()
            }
        }
        .padding(padding)
    }
    
    @ViewBuilder
    private func calendarIndicator() -> some View {
        HStack(spacing: 0) {
            RoundedRectangle(cornerRadius: 10)
                .foregroundStyle(event.calendar.color)
                .opacity(isDone ? 0.5 : 1)
                .frame(width: 3)
            Spacer(minLength: 0)
        }
        .padding(.leading, 2)
    }
    
    @ViewBuilder
    private func eventIndicator() -> some View {
        HStack(spacing: 0) {
            Spacer(minLength: 5)
            Text(event.name)
                .font(.caption)
                .foregroundStyle(isDone ? .gray : .primary)
                .fixedClipped()
                .padding(1)
                .background(TextGeometry())
                .onPreferenceChange(TextSizePrefKey.self) {
                    if height != $0.height {
                        height = $0.height
                    }
                }
            Spacer(minLength: 5)
        }
    }
    
    @ViewBuilder
    private func eventDoneLine() -> some View {
        ColoredDivider()
            .padding(.horizontal, 8)
            .foregroundStyle(.gray)
    }
    
    @ViewBuilder
    private func todoBackground() -> some View {
        RoundedRectangle(cornerRadius: 3)
            .foregroundStyle(event.calendar.color)
            .opacity(isDone ? 0.1 : 0.3)
    }
    
    @ViewBuilder
    private func scheduleBackground() -> some View {
        RoundedRectangle(cornerRadius: 3)
            .foregroundStyle(.gray)
            .opacity(0.1)
    }
}

#Preview("Light", traits: .fixedLayout(width: 100, height: 20)) {
    EventIndicator(month: .now, event: testEvents.first!, padding: 1, height: .constant(15))
}

#Preview("Dark", traits: .fixedLayout(width: 100, height: 20)) {
    EventIndicator(month: .now, event: testEvents.first!, padding: 1, height: .constant(15))
        .preferredColorScheme(.dark)
}

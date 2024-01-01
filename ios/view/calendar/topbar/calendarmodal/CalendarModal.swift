//
//  CalendarModal.swift
//  ios
//
//  Created by YeongWooKim on 1/1/24.
//

import SwiftUI

struct CalendarModal: View {
    @Environment(\.colorScheme) private var theme
    @StateObject var viewModel = CalendarModalViewModel()
    @State private var height: CGFloat = 0
    
    var body: some View {
        NavigationView {
            VStack {
                Section {
                    ForEach(viewModel.calendars) { calendar in
                        NavigationLink(destination: {
                            CalendarUpdateView(calendar)
                                .environmentObject(viewModel)
                        }) {
                            calendarRow(calendar)
                        }
                        .tint(.primary)
                    }
                }
                
                Spacer()
            }
            .padding()
            .navigationTitle("캘린더")
        }
    }
    
    @ViewBuilder
    private func calendarRow(_ calendar: Calendar) -> some View {
        HStack {
            RoundedRectangle(cornerRadius: 5)
                .frame(width: 10)
            
                .padding(.vertical, 5)
                .foregroundStyle(calendar.color)
            
            Text(calendar.name)
                .font(.title3)
                .padding(.leading, 5)
                .padding(.vertical, 10)
                .lineLimit(1)
                .background(TextGeometry())
                .onPreferenceChange(TextSizePrefKey.self) { value in
                    height = value.height
                }
            
            Spacer()
            
            Button(action: {
                viewModel.isHidden(calendar: calendar)
                ? viewModel.show(calendar: calendar)
                : viewModel.hide(calendar: calendar)
            }) {
                Image(systemName: viewModel.isHidden(calendar: calendar) ? "circle" : "checkmark.circle")
                    .imageScale(.large)
            }
        }
        .frame(height: height)
        .padding(.horizontal)
        .background {
            RoundedRectangle(cornerRadius: 10)
                .foregroundStyle(.primary)
                .opacity(theme == .light ? 0.1 : 0.2)
        }
        .opacity(viewModel.isHidden(calendar: calendar) ? 0.5 : 1)
    }
}

#Preview("Light") {
    CalendarModal(viewModel: CalendarModalViewModel(calendars: testCalendars))
}

#Preview("Dark") {
    CalendarModal(viewModel: CalendarModalViewModel(calendars: testCalendars))
        .preferredColorScheme(.dark)
}

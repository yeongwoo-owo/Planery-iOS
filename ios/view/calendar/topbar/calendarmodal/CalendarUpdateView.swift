//
//  CalendarUpdateView.swift
//  ios
//
//  Created by YeongWooKim on 1/1/24.
//

import SwiftUI

struct CalendarUpdateView: View {
    @EnvironmentObject var viewModel: CalendarModalViewModel
    @Environment(\.dismiss) var dismiss
    
    let calendar: Calendar
    @State var name: String
    @State var color: Color
    
    init(_ calendar: Calendar) {
        self.calendar = calendar
        self._name = State(initialValue: calendar.name)
        self._color = State(initialValue: calendar.color)
    }
    
    var body: some View {
        VStack {
            CalendarUpdateTitleView(name: $name, color: $color)
            CalendarUpdateColorView(color: $color)
            Spacer()
            updateButton()
        }
        .navigationBarTitleDisplayMode(.inline)
    }
    
    
    
    @ViewBuilder
    private func updateButton() -> some View {
        TextButton("변경") {
            viewModel.update(calendar: calendar, name: name, color: color)
            dismiss()
        }
        .disabled(calendar.name == name && calendar.color == color)
    }
}

#Preview {
    CalendarUpdateView(testCalendars[0])
}

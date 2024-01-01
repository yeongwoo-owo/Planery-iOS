//
//  CalendarTopBarView.swift
//  ios
//
//  Created by YeongWooKim on 1/1/24.
//

import SwiftUI

struct CalendarTopBarView: View {
    @EnvironmentObject private var viewModel: CalendarViewModel
    
    @State var isCalendarModalOn = false
    @State var isSearchModalOn = false
    
    var body: some View {
        HStack {
            monthText()
            Spacer()
            buttons()
        }
        .padding(.horizontal)
    }
    
    @ViewBuilder
    private func monthText() -> some View {
        Text(viewModel.month.formatted("yyyy. M."))
            .font(.title)
            .bold()
    }
    
    @ViewBuilder
    private func buttons() -> some View {
        HStack(spacing: 20) {
            Button(action: { isCalendarModalOn = true }) {
                Image(systemName: "calendar")
            }
            .sheet(isPresented: $isCalendarModalOn, onDismiss: {
                viewModel.fetch()
            }) {
                CalendarModal()
            }
            
            Button(action: { isSearchModalOn = true }) {
                Image(systemName: "magnifyingglass")
            }
            .sheet(isPresented: $isSearchModalOn) {
                SearchModal()
            }
        }
        .imageScale(.large)
        .tint(.primary)
    }
}

#Preview("Light", traits: .sizeThatFitsLayout) {
    CalendarTopBarView()
        .environmentObject(CalendarViewModel())
}

#Preview("Dark", traits: .sizeThatFitsLayout) {
    CalendarTopBarView()
        .environmentObject(CalendarViewModel())
        .previewLayout(.sizeThatFits)
        .preferredColorScheme(.dark)
}

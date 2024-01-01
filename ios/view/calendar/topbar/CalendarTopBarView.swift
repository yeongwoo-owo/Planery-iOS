//
//  CalendarTopBarView.swift
//  ios
//
//  Created by YeongWooKim on 1/1/24.
//

import SwiftUI

struct CalendarTopBarView: View {
    @EnvironmentObject private var viewModel: CalendarViewModel
    
    var body: some View {
        HStack {
            monthText()
            Spacer()
        }
        .padding(.horizontal)
    }
    
    @ViewBuilder
    private func monthText() -> some View {
        Text(viewModel.month.formatted("yyyy. M."))
            .font(.title)
            .bold()
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

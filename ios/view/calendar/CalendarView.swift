//
//  CalendarView.swift
//  ios
//
//  Created by YeongWooKim on 1/1/24.
//

import SwiftUI

struct CalendarView: View {
    @StateObject private var viewModel = CalendarViewModel()
    
    var body: some View {
        VStack(spacing: 0) {
            CalendarTopBarView()
            CalendarCarouselView()
        }
        .environmentObject(viewModel)
    }
}

#Preview("Light") {
    CalendarView()
}

#Preview("Dark") {
    CalendarView()
        .preferredColorScheme(.dark)
}

//
//  CalendarCarouselView.swift
//  ios
//
//  Created by YeongWooKim on 1/1/24.
//

import SwiftUI

struct CalendarCarouselView: View {
    @EnvironmentObject private var viewModel: CalendarViewModel
    
    var body: some View {
        TabView(selection: $viewModel.page) {
            carouselView()
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
        .onChange(of: viewModel.page) {
            viewModel.changeMonth()
        }
    }
    
    @ViewBuilder
    private func carouselView() -> some View {
        ForEach(-1...1, id: \.self) { index in
            CalendarPageView(month: viewModel.month.interval(month: index))
                .tag(index)
                .padding(.vertical)
                .padding(.horizontal, 5)
        }
    }
}

#Preview {
    CalendarView()
}

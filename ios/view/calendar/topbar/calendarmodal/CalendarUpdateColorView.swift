//
//  CalendarUpdateColorView.swift
//  ios
//
//  Created by YeongWooKim on 1/2/24.
//

import SwiftUI

struct CalendarUpdateColorView: View {
    @Binding var color: Color
    
    var body: some View {
        updateColor()
    }
    
    @ViewBuilder
    private func updateColor() -> some View {
        VStack {
            VStack {
                let count = Color.colorSet.count
                HStack {
                    ForEach(Color.colorSet[0 ..< count / 2], id: \.self) { color in
                        Circle()
                            .foregroundStyle(color)
                            .background {
                                Circle()
                                    .stroke(.primary)
                            }
                            .padding(10)
                            .onTapGesture {
                                self.color = color
                            }
                    }
                }
                HStack {
                    ForEach(Color.colorSet[count / 2 ..< count], id: \.self) { color in
                        Circle()
                            .foregroundStyle(color)
                            .background {
                                Circle()
                                    .stroke(.primary)
                            }
                            .padding(10)
                            .onTapGesture {
                                self.color = color
                            }
                    }
                }
                
                ColoredDivider()
                
                ColorPicker("CustomColor", selection: $color)
                    .padding(.top)
            }
            .padding()
            .background {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundStyle(.primary)
                    .opacity(0.2)
            }
        }
        .padding()
    }
}

#Preview {
    CalendarUpdateColorView(color: .constant(.red))
}

//
//  CalendarUpdateTitleView.swift
//  ios
//
//  Created by YeongWooKim on 1/1/24.
//

import SwiftUI

struct CalendarUpdateTitleView: View {
    @Binding var name: String
    @Binding var color: Color
    
//    @State var height: CGFloat = 50
    
    var body: some View {
        HStack {
            RoundedRectangle(cornerRadius: 5)
                .frame(width: 10)
                .foregroundStyle(color)
            
            VStack {
                Spacer(minLength: 0)
                
                HStack {
                    TextField("", text: $name)
                        .font(.title2)
                        .lineLimit(1)
                    
                    if name.isEmpty {
                        Button(action: { name = "" }) {
                            Image(systemName: "x.circle.fill")
                                .imageScale(.small)
                                .tint(.primary)
                                .opacity(0.5)
                                .padding(.horizontal, 5)
                        }
                    }
                }
                
                Spacer(minLength: 0)
                
                ColoredDivider()
                    .foregroundStyle(.gray)
            }
            
            Spacer()
        }
        .padding(.horizontal)
        .frame(height: 50)
    }
}

#Preview {
    CalendarUpdateTitleView(name: .constant("캘린더"), color: .constant(.red))
}

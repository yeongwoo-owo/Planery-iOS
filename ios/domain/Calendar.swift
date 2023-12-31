//
//  Calendar.swift
//  ios
//
//  Created by YeongWooKim on 12/31/23.
//

import SwiftUI

struct Calendar: Codable, Identifiable {
    let id: Int
    let name: String
    let colorCode: String
    
    var color: Color {
        get { Color(hex: colorCode) }
    }
    
    init(id: Int, name: String, colorCode: String) {
        self.id = id
        self.name = name
        self.colorCode = colorCode
    }
    
    init(id: Int, name: String, color: Color) {
        self.id = id
        self.name = name
        self.colorCode = color.toHex()
    }
}

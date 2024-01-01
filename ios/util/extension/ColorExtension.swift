//
//  ColorExtension.swift
//  ios
//
//  Created by YeongWooKim on 12/31/23.
//

import SwiftUI

extension Color {
    init(hex: String, alpha: CGFloat = 1.0) {
        var hexFormatted: String = hex.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).uppercased()
        
        if hexFormatted.hasPrefix("#") {
            hexFormatted = String(hexFormatted.dropFirst())
        }
        
        assert(hexFormatted.count == 6, "Invalid hex code used.")
        
        var rgbValue: UInt64 = 0
        Scanner(string: hexFormatted).scanHexInt64(&rgbValue)
        
        self.init(uiColor: UIColor(red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
                                 green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
                                 blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
                                 alpha: alpha))
    }
    
    func toHex() -> String {
        let components = UIColor(self).cgColor.components!
        let r = lroundf(Float(components[0]) * 255)
        let g = lroundf(Float(components[1]) * 255)
        let b = lroundf(Float(components[2]) * 255)
        return String(format: "#%02lX%02lX%02lX", r, g, b)
    }
}

extension ColorScheme {
    func foregroundColor() -> Color {
        self == .light ? .black : .white
    }
    
    func backgroundColor() -> Color {
        self == .light ? .white : .black
    }
}

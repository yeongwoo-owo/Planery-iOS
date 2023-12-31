//
//  DateExtension.swift
//  ios
//
//  Created by YeongWooKim on 12/31/23.
//

import Foundation

extension Date {
    init(string: String) {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        formatter.locale = Locale.current
        let date = formatter.date(from: string)!
        self.init(timeIntervalSince1970: date.timeIntervalSince1970)
    }
    
    func toString() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        formatter.locale = Locale.current
        return formatter.string(from: self)
    }
    
    init(year: Int, month: Int = 1, day: Int = 1, hour: Int = 0, minute: Int = 0, second: Int = 0) {
        let yearString = String(format: "%04d", year)
        let monthString = String(format: "%02d", month)
        let dayString = String(format: "%02d", day)
        let hourString = String(format: "%02d", hour)
        let minuteString = String(format: "%02d", minute)
        let secondString = String(format: "%02d", second)
        self.init(string: "\(yearString)-\(monthString)-\(dayString)T\(hourString):\(minuteString):\(secondString)")
    }
}

extension DateFormatter {
    private static let FORMAT = "yyyy-MM-dd'T'HH:mm:ss"
    static let shared = setup()
    
    private static func setup() -> DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        return formatter
    }
}

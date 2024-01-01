//
//  DateExtension.swift
//  ios
//
//  Created by YeongWooKim on 12/31/23.
//

import SwiftUI

extension Date {
    init(string: String) {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        formatter.locale = Locale.current
        let date = formatter.date(from: string)!
        self.init(timeIntervalSince1970: date.timeIntervalSince1970)
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
    
    func toString() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        formatter.locale = Locale.current
        return formatter.string(from: self)
    }
    
    func formatted(_ format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: self)
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

extension Date {
    var components: DateComponents { get { Foundation.Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second, .weekday], from: self) } }
    var year: Int { get { components.year! } }
    var month: Int { get { components.month! } }
    var day: Int { get { components.day! } }
    var hour: Int { get { components.hour! } }
    var minute: Int { get { components.minute! } }
    var second: Int { get { components.second! } }
    var _weekday: Int { get { components.weekday! } }
    var weekday: Weekday { get { Weekday.allCases[_weekday - 1] } }
    
    func interval(year: Int = 0, month: Int = 0, week: Int = 0, day: Int = 0) -> Date {
        return Foundation.Calendar.current.date(byAdding: DateComponents(year: year, month: month, day: week * 7 + day), to: self)!
    }
    var beforeMonth: Date { get { interval(month: -1) } }
    var nextMonth: Date { get { interval(month: 1) } }
    var beforeWeek: Date { get { interval(day: -7) } }
    var nextWeek: Date { get { interval(day: 7) } }
    var yesterday: Date { get { interval(day: -1) } }
    var tomorrow: Date { get { interval(day: 1) } }
    
    var startOfDay: Date { get { Date(year: year, month: month, day: day) } }
    var firstDayInWeek: Date { get { startOfDay.interval(day: 1 - _weekday) } }
    var firstDayInMonth: Date { get { Date(year: year, month: month) } }
    var firstDayInCalendar: Date { get { firstDayInMonth.firstDayInWeek } }
    
    func isSameYear(with day: Date) -> Bool {
        return year == day.year
    }
    func isSameMonth(with day: Date) -> Bool {
        return isSameYear(with: day) && month == day.month
    }
    func isSameDay(with day: Date) -> Bool {
        return isSameMonth(with: day) && self.day == day.day
    }
    func isToday() -> Bool {
        return isSameDay(with: .now)
    }
    
    func difference(to end: Date) -> Int {
        return Foundation.Calendar.current.dateComponents([.day], from: self, to: end).day!
    }
}

enum Weekday: String, CaseIterable {
    case sunday = "일"
    case monday = "월"
    case tuesday = "화"
    case wednesday = "수"
    case thursday = "목"
    case friday = "금"
    case saturday = "토"
    
    var color: Color {
        get {
            switch self {
            case .sunday:
                return .red
            case .saturday:
                return .blue
            default:
                return .primary
            }
        }
    }
}

//
//  CalendarModalViewModel.swift
//  ios
//
//  Created by YeongWooKim on 1/1/24.
//

import SwiftUI

class CalendarModalViewModel: ObservableObject {
    private let calendarRepository = CalendarRepository.shared
    private var cookie = UserDefaults.standard.string(forKey: COOKIE_HEADER) ?? ""
    
    @Published var calendars: [Calendar] = []
    
    @AppStorage("HiddenCalendar") private var _hiddenCalendar = ""
    var hiddenCalendars: [Int] {
        get {
            return _hiddenCalendar.split(separator: ",").map { Int($0)! }
        }
        set {
            debugPrint("Hidden Calendar: \(newValue)")
            _hiddenCalendar = newValue.map { String($0) }.joined(separator: ",")
            DispatchQueue.main.async {
                self.objectWillChange.send()
            }
        }
    }
    
    init() {
        fetch()
    }
    
    init(calendars: [Calendar]) {
        self.calendars = calendars
    }
    
    func isHidden(calendar: Calendar) -> Bool {
        hiddenCalendars.contains(calendar.id)
    }
    
    func hide(calendar: Calendar) {
        hiddenCalendars.append(calendar.id)
    }
    
    func show(calendar: Calendar) {
        hiddenCalendars.removeAll { $0 == calendar.id }
    }
    
    func fetch() {
        Task {
            let calendars = await calendarRepository.find(cookie: cookie)
            debugPrint("Fetch \(calendars.count) calendars")
            DispatchQueue.main.async {
                self.calendars = calendars
            }
        }
    }
    
    func update(calendar: Calendar, name: String, color: Color) {
        Task {
            guard let calendar = await calendarRepository.update(cookie: cookie, calendar: calendar, name: name, color: color) else {
                debugPrint("캘린더 업데이트 실패")
                return
            }
            guard let index = calendars.firstIndex(where: { $0.id == calendar.id }) else {
                debugPrint("캘린더 없음")
                return
            }
            DispatchQueue.main.async {
                self.calendars[index] = calendar
                print(self.calendars)
            }
        }
    }
}

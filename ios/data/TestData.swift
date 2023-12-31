//
//  TestData.swift
//  ios
//
//  Created by YeongWooKim on 12/31/23.
//

import Foundation

let testCalendars = [
    Calendar(id: 1, name: "캘린더1", color: .red),
    Calendar(id: 2, name: "캘린더2", color: .blue),
]

let testEvents = [
    Event(id: 1, calendar: testCalendars[0], name: "이벤트1", 
          duration: Duration(start: Date(year: 2023, month: 12, day: 24), end: Date(year: 2023, month: 12, day: 26)), type: .schedule),
    Event(id: 2, calendar: testCalendars[0], name: "이벤트2",
          duration: Duration(start: Date(year: 2023, month: 12, day: 26), end: Date(year: 2023, month: 12, day: 28)), type: .todo(isDone: false)),
    Event(id: 3, calendar: testCalendars[0], name: "이벤트3",
          duration: Duration(start: Date(year: 2023, month: 12, day: 27), end: Date(year: 2024, month: 1, day: 1)), type: .todo(isDone: true)),
    Event(id: 4, calendar: testCalendars[1], name: "이벤트4",
          duration: Duration(start: Date(year: 2023, month: 12, day: 30), end: Date(year: 2023, month: 12, day: 31)), type: .schedule),
    Event(id: 5, calendar: testCalendars[1], name: "이벤트5",
          duration: Duration(start: Date(year: 2024, month: 1, day: 1), end: Date(year: 2024, month: 1, day: 5)), type: .todo(isDone: false)),
    Event(id: 6, calendar: testCalendars[1], name: "이벤트6",
          duration: Duration(start: Date(year: 2024, month: 1, day: 2), end: Date(year: 2024, month: 1, day: 3)), type: .todo(isDone: true)),
]

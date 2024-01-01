//
//  CalendarViewModel.swift
//  ios
//
//  Created by YeongWooKim on 1/1/24.
//

import Foundation

class CalendarViewModel: ObservableObject {
    private var cookie = UserDefaults.standard.string(forKey: COOKIE_HEADER) ?? ""
    private let eventRepository = EventRepository.shared
    
    var month: Date = Date(year: Date.now.year, month: Date.now.month)
    @Published var events: [Event] = []
    @Published var page = 0
    
    init() {
        
        Task {
            let events = await eventRepository.find(cookie: cookie)
            DispatchQueue.main.async {
                self.events = events
            }
        }
    }
    
    init(events: [Event]) {
        self.events = events
    }
    
    func changeMonth() {
        if page == 0 { return }
        month = month.interval(month: page)
        let interval = DispatchTimeInterval.microseconds(300)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + interval) {
            self.page = 0
        }
    }
    
    func getEventWithHeight(from: Date, to: Date) -> [HeightMappedEvent] {
        let matchEvents = events
            .filter { !($0.duration.end <= from || $0.duration.start >= to) }
        return mappingHeight(matchEvents, from: from, to: to)
    }
    
    private func mappingHeight(_ events: [Event], from: Date, to: Date) -> [HeightMappedEvent] {
        var heightMap: [Int:Set<Int>] = [:]
        var result = [HeightMappedEvent]()
        
        for event in events {
            let startIndex = from.difference(to: max(event.duration.start, from))
            let endIndex = from.difference(to: min(event.duration.end, to))
            let range = Set(startIndex..<endIndex)
            
            let height = findHeight(range, map: heightMap)
            result.append(HeightMappedEvent(event: event, height: height))
            heightMap[height] = (heightMap[height] ?? Set()).union(range)
        }
        
        return result
    }
    
    private func findHeight(_ a: Set<Int>, map: [Int:Set<Int>]) -> Int {
        var height = 0
        while hasConflict(a, with: map[height] ?? Set()) { height += 1 }
        return height
    }
    
    private func hasConflict(_ a: Set<Int>, with b: Set<Int>) -> Bool {
        return !a.intersection(b).isEmpty
    }
    
    func numberOfEvent(at day: Date) -> Int {
        return events.filter { $0.duration.start <= day && $0.duration.end > day }.count
    }
}

struct HeightMappedEvent: Identifiable {
    var id: Int { get { event.id } }
    let event: Event
    let height: Int
}


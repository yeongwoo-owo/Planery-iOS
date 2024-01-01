//
//  Event.swift
//  ios
//
//  Created by YeongWooKim on 12/31/23.
//

import Foundation

struct Event: Codable, Identifiable {
    let id: Int
    let calendar: Calendar
    let name: String
    let duration: Duration
    let type: EventType
}

struct Duration: Codable {
    let start: Date
    let end: Date
}

enum EventType: Codable, Equatable {
    case schedule, todo(isDone: Bool = false)
    
    var description: String {
        get {
            switch self {
            case .schedule:
                return "SCHEDULE"
            case .todo:
                return "TODO"
            }
        }
    }
}

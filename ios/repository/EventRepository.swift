//
// Created by YeongWooKim on 12/31/23.
//

import Alamofire

class EventRepository {
    static let shared = EventRepository()
    private init() {}
    
    func create(cookie: String, type: EventType, calendar: Calendar, name: String, duration: Duration) async -> Event? {
        let body: Parameters = ["type": type.description,
                                "calendarId": calendar.id,
                                "name": name,
                                "duration": ["start": duration.start.toString(),
                                             "end": duration.end.toString()]]
        
        return await AF.baseRequest("/events", method: .post, cookie: cookie, body: body)
            .validateAndDecode(Event.self)
            .returnOrNil()
    }
    
    func find(cookie: String) async -> [Event] {
        return await AF.baseRequest("/events", cookie: cookie)
            .validateAndDecode(EventListResponse.self)
            .returnOrNil()?.events ?? []
    }
    
    func update(cookie: String, event: Event, name: String, duration: Duration) async -> Event? {
        let body: Parameters = ["name": name,
                                "duration": ["start": duration.start.toString(),
                                             "end": duration.end.toString()]]
        
        return await AF.baseRequest("/events/\(event.id)", method: .put, cookie: cookie, body: body)
            .validateAndDecode(Event.self)
            .returnOrNil()
    }
    
    func updateCalendar(cookie: String, event: Event, calendar: Calendar) async -> Event? {
        let body: Parameters = ["calendarId": calendar.id]
        return await AF.baseRequest("/events/\(event.id)/calendar", method: .patch, cookie: cookie, body: body)
            .validateAndDecode(Event.self)
            .returnOrNil()
    }
    
    func updateEventType(cookie: String, event: Event, type: EventType) async -> Event? {
        let body: Parameters = ["type": type.description]
        return await AF.baseRequest("/events/\(event.id)/type", method: .patch, cookie: cookie, body: body)
            .validateAndDecode(Event.self)
            .returnOrNil()
    }
    
    func delete(cookie: String, event: Event) async -> Event? {
        return await AF.baseRequest("/events/\(event.id)", method: .delete, cookie: cookie)
            .validateAndDecode()
            .isSuccess() ? event : nil
    }
}

struct EventListResponse: Decodable {
    let events: [Event]
}

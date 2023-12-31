//
// Created by YeongWooKim on 12/31/23.
//

import SwiftUI
import Alamofire

class CalendarRepository {
    static let shared = CalendarRepository()
    private init() {}
    
    func create(cookie: String, name: String, color: Color) async -> Calendar? {
        let body: Parameters = ["name": name, "colorCode": color.toHex()]
        return await AF.baseRequest("/calendars", method: .post, body: body)
            .validateAndDecode(Calendar.self)
            .returnOrNil()
    }
    
    func find(cookie: String) async -> [Calendar] {
        return await AF.baseRequest("/calendars", cookie: cookie)
            .validateAndDecode(CalendarListResponse.self)
            .returnOrNil()?.calendars ?? []
    }
    
    func update(cookie: String, calendar: Calendar, name: String, color: Color) async -> Calendar? {
        let body: Parameters = ["name": name, "colorCode": color.toHex()]
        return await AF.baseRequest("/calendars/\(calendar.id)", method: .put, body: body)
            .validateAndDecode(Calendar.self)
            .returnOrNil()
    }
    
    func delete(cookie: String, calendar: Calendar) async -> Calendar? {
        return await AF.baseRequest("/calendars/\(calendar.id)", method: .delete)
            .validateAndDecode()
            .isSuccess() ? calendar : nil
    }
}

struct CalendarListResponse: Decodable {
    let calendars: [Calendar]
}

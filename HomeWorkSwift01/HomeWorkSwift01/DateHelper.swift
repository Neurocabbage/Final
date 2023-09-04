//
//  DateHelper.swift
//  HomeWorkSwift01
//
//  Created by Admin on 04.09.2023.
//  Copyright © 2023 Fedot. All rights reserved.
//

import Foundation

final class DateHelper {
    static func drawDate(date: Date?) -> String {
        if date == nil { return "" }
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = .medium
        dateFormatter.dateStyle = .medium
        dateFormatter.timeZone = .current
        dateFormatter.locale = Locale(identifier: "ru_RU")
        return dateFormatter.string(from: date!)
    }
}

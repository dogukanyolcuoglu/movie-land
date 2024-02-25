//
//  Date+Extension.swift
//  movie-land
//
//  Created by Dogukan Yolcuoglu on 23.02.2024.
//

import Foundation
import UIKit

enum DateFormat: String {
    case dateMonthAndDay = "MMMM dd"
    case dateMonthDayYear = "MMMM dd, yyyy"
    case onlyTime = "HH:mm"
    case dateDayMonthYear = "dd.MM.yyyy"
    case dateFull = "yyyy-MM-dd'T'HH:mm:ssZ"
    case dateYearMonthDayNumber = "yyyy-MM-dd"
    case year = "yyyy"
}

extension Date {
    func dateString(_ format: DateFormat) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "tr_TR")
        dateFormatter.dateFormat = format.rawValue
        return dateFormatter.string(from: self)
    }
}

extension String {
    func getDateFromUTC(format: DateFormat) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "tr_TR")
        dateFormatter.dateFormat = format.rawValue
        return dateFormatter.date(from: self) ?? Date()
    }
}

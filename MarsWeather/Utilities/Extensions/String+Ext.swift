//
//  String+Ext.swift
//  MarsWeather
//
//  Created by Will Paceley on 2023-05-05.
//

import Foundation

extension String {
    func formatDate(format: DateFormat) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        guard let date = dateFormatter.date(from: self) else {
            dateFormatter.dateFormat = "MMMM d, yyyy"
            return dateFormatter.string(from: Date())
        }
        
        dateFormatter.dateFormat = format.rawValue
        return dateFormatter.string(from: date)
    }
    
    func toDate() -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        if let date = dateFormatter.date(from: self) {
            return date
        } else {
            print("A problem occurred converting \(self) to a Date type. Returning today's date.")
            return nil
        }
    }
}

enum DateFormat: String {
    case full = "MMMM d, yyyy"
    case abbreviated = "MMM d, yyyy"
}

//
//  Data+Extention.swift
//  Kunal Gupta
//
//  Created by Kunal Gupta on 18/06/19.
//  //  Copyright © 2018 Kunal Gupta All rights reserved.
//

import Foundation

extension Date {
    
    public func getMonthName() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM"
        let strMonth = dateFormatter.string(from: self)
        return strMonth
    }
    
//    func string(format: DateFormat) -> String {
//        let formatter = DateFormatter()
//        formatter.dateFormat = format.rawValue
//        return formatter.string(from: self)
//    }
    
    func startOfMonth() -> Date {
        return Calendar.current.date(from: Calendar.current.dateComponents([.year, .month], from: Calendar.current.startOfDay(for: self)))!
    }
    
    func startOfYear() -> Date {
        return Calendar.current.date(from: Calendar.current.dateComponents([.year], from: Calendar.current.startOfDay(for: self)))!
    }
    
    func startDateBy(month: Int) -> Date {
        return Calendar.current.date(byAdding: DateComponents(month: month), to: self.startOfMonth())!
    }
    
    func calculation(day: Int, month: Int, year: Int) -> Date {
        return Calendar.current.date(byAdding: DateComponents(year: year, month: month, day: day), to: self)!
    }
    
    func endDateBy(month: Int, year: Int = 0) -> Date {
        return Calendar.current.date(byAdding: DateComponents(year: year, month: month+1, day: -1), to: self.startOfMonth())!
    }
    
    func startOfQuarter() -> Date {
        let startOfMonth = Calendar.current.date(from: Calendar.current.dateComponents([.year, .month], from: Calendar.current.startOfDay(for: self)))!

        var components = Calendar.current.dateComponents([.month, .day, .year], from: startOfMonth)

        let newMonth: Int
        switch components.month! {
        case 1,2,3: newMonth = 1
        case 4,5,6: newMonth = 4
        case 7,8,9: newMonth = 7
        case 10,11,12: newMonth = 10
        default: newMonth = 1
        }
        components.month = newMonth
        return Calendar.current.date(from: components)!
    }
    
    func thDate() -> String {
        
        let calendar = Calendar.current
        let anchorComponents = calendar.dateComponents([.day, .month, .year], from: self)
        let dateFormate = DateFormatter()
        dateFormate.dateFormat = "EEEE, MMMM "
        let newDate = dateFormate.string(from: self)
        var day  = "\(anchorComponents.day!)"
        switch (day) {
        case "1" , "21" , "31":
            day.append("st")
        case "2" , "22":
            day.append("nd")
        case "3" ,"23":
            day.append("rd")
        default:
            day.append("th")
        }
        dateFormate.dateFormat = "yyyy"
        let year = dateFormate.string(from: self)
        return newDate + day + " \(year)"
    }
}

extension String {
    
//    public func date(format: DateFormat) -> Date? {
//        let formatter = DateFormatter()
//        formatter.timeZone = TimeZone.autoupdatingCurrent
//        formatter.locale = Locale.current
//        formatter.dateFormat = format.rawValue
//        return formatter.date(from: self)
//    }
//    
//    func changeFormat(_ from: DateFormat, _ to: DateFormat) -> String {
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = from.rawValue
//        let date = dateFormatter.date(from: self)
//        dateFormatter.dateFormat = to.rawValue
//        return dateFormatter.string(from: date!)
//    }
}

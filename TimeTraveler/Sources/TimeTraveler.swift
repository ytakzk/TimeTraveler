//
//  TimeTraveler.swift
//  TimeTraveler
//
//  Created by Yuta Akizuki on 2016/03/25.
//  Copyright © 2016年 ytakzk. All rights reserved.
//

import Foundation

enum MomentUnit {
    
    case Year
    case Month
    case Week
    case Day
    case Hour
    case Minute
    case Second
}

extension NSDate {
    
    private var calendar: NSCalendar {
        
        get {
            
            return NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)!
        }
    }
    
    private var intervalOfOneDay: NSTimeInterval {
        
        get { return NSTimeInterval(60 * 60 * 24) }
    }
    
    var startOfDay: NSDate {
        
        get {
            
            return calendar.startOfDayForDate(self)
        }
    }
    
    var tomorrow: NSDate {
        
        get {
            
            return self.dateByAddingTimeInterval(intervalOfOneDay)
        }
    }
    
    var yesterday: NSDate {
        
        get {
            
            return self.dateByAddingTimeInterval(intervalOfOneDay * -1)
        }
    }
    
    var month: Int {
        
        get {
            
            let components = calendar.components(.Month, fromDate: self)
            return components.month
        }
    }
    
    var day: Int {
        
        get {
            
            let components = calendar.components(.Day, fromDate: self)
            return components.day
        }
    }
    
    var hour: Int {
        
        get {
            
            let components = calendar.components(.Hour, fromDate: self)
            return components.hour
        }
    }
    
    var minute: Int {
        
        get {
            
            let components = calendar.components(.Minute, fromDate: self)
            return components.minute
        }
    }
    
    var second: Int {
        
        get {
            
            let components = calendar.components(.Second, fromDate: self)
            return components.second
        }
    }

    
    var weekday: Int {
        
        get {
            
            let components = calendar.components(.Weekday, fromDate: self)
            return components.weekday
        }
    }
    
    var isSaturday: Bool {
        
        get {
            
            return weekday == 7
        }
    }
    
    var isSunday: Bool {
        
        get {
            
            return weekday == 1
        }
    }
    
    var isMidnight: Bool {
        
        get {
            
            let components = calendar.components([.Hour, .Minute], fromDate: self)
            
            if components.hour == 0 && components.minute == 0 {
                
                return true
            }
            
            return false
        }
    }
    
    
    func addDays(days: Int) -> NSDate {
        
        return self.dateByAddingTimeInterval(intervalOfOneDay * NSTimeInterval(days))
    }
    
    func isSameYearWith(date: NSDate) -> Bool {
        
        return calendar.components([.Year, .Month, .Day], fromDate: self).year ==  calendar.components([.Year, .Month, .Day], fromDate: date).year
    }
    
    func isSameMonthWith(date: NSDate) -> Bool {
        
        return calendar.components([.Year, .Month, .Day], fromDate: self).month ==  calendar.components([.Year, .Month, .Day], fromDate: date).month
    }
    
    func isSameDayWith(date: NSDate) -> Bool {
        
        return calendar.components([.Year, .Month, .Day], fromDate: self).day ==  calendar.components([.Year, .Month, .Day], fromDate: date).day
    }
}

func ==<T: NSDate>(lhs: T, rhs: T) -> Bool {
    
    return lhs.compare(rhs) == NSComparisonResult.OrderedSame
}

func <<T: NSDate>(lhs: T, rhs: T) -> Bool {
    
    return lhs.compare(rhs) == NSComparisonResult.OrderedAscending
}

func <=<T: NSDate>(lhs: T, rhs: T) -> Bool {
    
    return lhs.compare(rhs) != NSComparisonResult.OrderedDescending
}

func ><T: NSDate>(lhs: T, rhs: T) -> Bool {
    
    return lhs.compare(rhs) == NSComparisonResult.OrderedDescending
}

func >=<T: NSDate>(lhs: T, rhs: T) -> Bool {
    
    return lhs.compare(rhs) != NSComparisonResult.OrderedAscending
}
//
//  TimeTravelerTests.swift
//  TimeTravelerTests
//
//  Created by Okuda Shuhei on 2016/04/02.
//  Copyright © 2016年 ytakzk. All rights reserved.
//

import XCTest
import Foundation


class TimeTravelerTests: XCTestCase {
    
    var today : NSDate = NSDate()
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testStartOfDay() {
        
        let calendar = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)
        
        let comps : NSDateComponents = calendar!.components([.Year, .Month, .Day], fromDate: today)
        let zero = calendar!.dateFromComponents(comps)
        
        XCTAssertEqual(today.startOfDay,zero)
    }
    
    func testTomorrow() {
        let tommorow = today.dateByAddingTimeInterval(60 * 60 * 24)
        XCTAssertEqual(tommorow, today.tomorrow)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    
}

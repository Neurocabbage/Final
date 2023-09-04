//
//  HomeWorkSwift01Tests.swift
//  HomeWorkSwift01Tests
//
//  Created by Fedot on 8/12/23.
//  Copyright © 2023 Fedot. All rights reserved.
//

import XCTest
@testable import HomeWorkSwift01

final class DateHelperTests: XCTestCase {
    //rivate var helper: DateHelper!
    
    override func setUpWithError() throws {
        try? super.setUpWithError()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        try? super.tearDownWithError()
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testDrawDate() throws {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        dateFormatter.timeZone = .current
        dateFormatter.locale = .current
        let date = dateFormatter.date(from: "2023-09-05 01:02:03")
        let dateString = DateHelper.drawDate(date: date)
        XCTAssertEqual(dateString, "5 sep. 2023 г., 01:02:03", "Некорректный формат даты")
    }

}

//
//  AppBuilderTests.swift
//  StudentsTests
//
//  Created by Bruce McTigue on 8/27/19.
//  Copyright © 2019 tiguer. All rights reserved.
//

import XCTest
@testable import Students
@testable import Tiguer

class AppBuilderTests: XCTestCase {
    
    var buildersCount = 0
    
    func testAppBuilder() {
        let window = UIWindow(frame: UIScreen.main.bounds)
        let builder = App.Builder(with: window)
        builder.run()
        XCTAssert(builder.getWindow() != nil)
    }
}

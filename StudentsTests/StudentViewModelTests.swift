//
//  StudentViewModelTests.swift
//  StudentsTests
//
//  Created by Bruce McTigue on 8/29/19.
//  Copyright © 2019 tiguer. All rights reserved.
//

import XCTest
@testable import Students
@testable import Tiguer

class StudentViewModelTests: XCTestCase {
    
    let id = "1"
    let firstName = "Bruce"
    let lastName = "Lee"

    func testViewModel() {
        let viewModel = Students.ViewModel(studentId: id, firstName: firstName, lastName: lastName)
        XCTAssertTrue(viewModel.fullName == "\(firstName) \(lastName)")
        XCTAssertTrue(viewModel.selectionId == id)
        let viewModelCopy = viewModel
        XCTAssertTrue(viewModel == viewModelCopy)
        let viewModel2 = Students.ViewModel(studentId: id, firstName: firstName, lastName: "Banner")
        XCTAssertTrue(viewModel2 < viewModel)
    }

}

//
//  StudentsUnboxDataAdapterTests.swift
//  StudentsTests
//
//  Created by Bruce McTigue on 8/27/19.
//  Copyright © 2019 tiguer. All rights reserved.
//

import XCTest
import Promis
@testable import Students

class StudentsUnboxDataAdapterTests: XCTestCase {
    
    let assetName = "studentsJson"
    var items: [Student] = [Student]()
    lazy var sut = Students.UnboxDataAdapter<Student>()
    
    override func setUp() {
        items = [Student]()
    }
    
    func testAdapter() {
        let expectation = self.expectation(description: "adapter")
        if let asset = NSDataAsset(name: assetName, bundle: Bundle.main) {
            sut.itemsFromData(asset.data).finally(queue: .main) { future in
                switch future.state {
                case .result(let adapterResult):
                    switch adapterResult {
                    case .success(let items):
                        self.items = items
                    }
                case .error(let error):
                    print(error)
                    XCTFail()
                case .cancelled:
                    XCTFail()
                case .unresolved:
                    XCTFail()
                }
                expectation.fulfill()
            }
        }
        waitForExpectations(timeout: 3.0, handler: nil)
        XCTAssert(items.count > 0)
    }
}

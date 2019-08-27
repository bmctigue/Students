//
//  StudentsInteractorTests.swift
//  StudentsTests
//
//  Created by Bruce McTigue on 8/27/19.
//  Copyright © 2019 tiguer. All rights reserved.
//

import XCTest
@testable import Students
@testable import Tiguer

class StudentsInteractorTests: XCTestCase {
    
    typealias ViewModel = Students.ViewModel
    
    private lazy var store = LocalStore(Students.Builder.studentsAssetName)
    private lazy var dataAdapter = Students.UnboxDataAdapter<Student>()
    private lazy var service = Tiguer.Service<Student, Students.UnboxDataAdapter>(store, dataAdapter: dataAdapter, cacheKey: Students.Builder.cacheKey)
    var viewModels = [ViewModel]()
    
    func testFetchItemsForAllStudents() {
        let presenter = Students.Presenter<Student, Students.ViewModel>([], main: SyncQueue.global, background: SyncQueue.background)
        let sut = Tiguer.Interactor<Student, Students.Presenter, Tiguer.Service>(presenter, service: service)
        let request = Request()
        let url = URL(string: "https://www.google.com")!
        sut.fetchItems(request, url: url)
        let dynamicModels = presenter.getDynamicModels()
        XCTAssert(dynamicModels.value.count == 5)
    }
}

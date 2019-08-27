//
//  StudentsBuilder.swift
//  Students
//
//  Created by Bruce McTigue on 8/27/19.
//  Copyright © 2019 tiguer. All rights reserved.
//

import UIKit
import Tiguer

enum Students {
    final class Builder: VCBuilder {
        
        static let studentsAssetName = "studentsJson"
        static let cacheKey = "students"
    
        private var title: String
        private var store: StoreProtocol
        private lazy var dataAdapter = Students.UnboxDataAdapter<Student>()
        private lazy var service = Students.Service<Student, UnboxDataAdapter>(store, dataAdapter: dataAdapter, cacheKey: Students.Builder.cacheKey)
        
        init(with title: String, store: StoreProtocol) {
            self.title = title
            self.store = store
        }
        
        func run(completionHandler: (UIViewController) -> Void) {
            let navigationController = UINavigationController()
            completionHandler(navigationController)
        }
    }
}

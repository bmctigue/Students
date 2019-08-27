//
//  AppBuilder.swift
//  Students
//
//  Created by Bruce McTigue on 8/27/19.
//  Copyright © 2019 tiguer. All rights reserved.
//

import UIKit
import Tiguer

enum App {
    final class Builder: BaseBuilder {
        
        static let studentsTitle = "Students"
        
        private var window: UIWindow?
        private var builder: VCBuilder
        
        init(with window: UIWindow?) {
            self.window = window
            let store = LocalStore("studentsJson")
            self.builder = Students.StudentsBuilder(with: App.Builder.studentsTitle , store: store)
        }
        
        func getWindow() -> UIWindow? {
            return self.window
        }
        
        func run() {
            builder.run { [weak self] viewController in
                self?.window?.rootViewController = viewController
                self?.window?.makeKeyAndVisible()
            }
        }
    }
}

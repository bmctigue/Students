//
//  StudentViewModel.swift
//  Students
//
//  Created by Bruce McTigue on 8/27/19.
//  Copyright © 2019 tiguer. All rights reserved.
//

import UIKit
import Tiguer

extension Students {
    struct ViewModel: Comparable {
        
        let studentId: String
        let firstName: String
        let lastName: String
        var fullName: String {
            return "\(firstName) \(lastName)"
        }
        
        var selectionId: String {
            return studentId
        }
        
        init(studentId: String, firstName: String, lastName: String) {
            self.studentId = studentId
            self.firstName = firstName
            self.lastName = lastName
        }
        
        static func == (lhs: Students.ViewModel, rhs: Students.ViewModel) -> Bool {
            return lhs.studentId == rhs.studentId
        }
        
        static func < (lhs: Students.ViewModel, rhs: Students.ViewModel) -> Bool {
            return lhs.lastName < rhs.lastName
        }
    }
}

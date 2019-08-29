//
//  StudentsPresenter.swift
//  Students
//
//  Created by Bruce McTigue on 8/27/19.
//  Copyright © 2019 tiguer. All rights reserved.
//

import UIKit
import Tiguer

extension Students {
    final class Presenter<Model, ViewModel>: Tiguer.Presenter<Model, ViewModel> {
        
        private lazy var favoritesManager = Students.SelectionManager<Student>()
        
        override var baseViewModels: [ViewModel] {
            var resultModels = [ViewModel]()
            for studentModel in models {
                let model = studentModel as! Student
                let displayedModel = Students.ViewModel(studentId: model.id, firstName: model.firstName, lastName: model.lastName) as! ViewModel
                resultModels.append(displayedModel)
            }
            return resultModels
        }
    }
}

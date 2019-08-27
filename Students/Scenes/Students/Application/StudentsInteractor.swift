//
//  StudentsInteractor.swift
//  Students
//
//  Created by Bruce McTigue on 8/27/19.
//  Copyright © 2019 tiguer. All rights reserved.
//

import Foundation
import Tiguer

extension Students {
    final class Interactor<Model, Presenter: PresenterProtocol, Service: ServiceProtocol>: Tiguer.Interactor<Model, Presenter, Service> {}
}

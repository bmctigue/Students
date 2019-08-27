//
//  StudentsService.swift
//  Students
//
//  Created by Bruce McTigue on 8/27/19.
//  Copyright © 2019 tiguer. All rights reserved.
//

import Foundation
import Tiguer

extension Students {
    final class Service<Model: Codable, Adapter: DataAdapterProtocol>: Tiguer.Service<Model, Adapter> {}
}

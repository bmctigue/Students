//
//  Student.swift
//  Students
//
//  Created by Bruce McTigue on 8/27/19.
//  Copyright © 2019 tiguer. All rights reserved.
//

import Foundation
import Unbox

struct Student: Codable {
    var id: String
    var firstName: String
    var lastName: String
}

extension Student: Unboxable {
    init(unboxer: Unboxer) throws {
        self.id = try unboxer.unbox(key: "id")
        self.firstName = try unboxer.unbox(key: "first_name")
        self.lastName = try unboxer.unbox(key: "last_name")
    }
}

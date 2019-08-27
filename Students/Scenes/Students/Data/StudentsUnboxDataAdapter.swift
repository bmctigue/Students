//
//  StudentsUnboxDataAdapter.swift
//  Students
//
//  Created by Bruce McTigue on 8/27/19.
//  Copyright © 2019 tiguer. All rights reserved.
//

import Foundation
import Promis
import Unbox
import Tiguer

extension Students {
    class UnboxDataAdapter<Model>: Tiguer.DataAdapter<Model> {
        
        override func itemsFromData(_ data: Data) -> Future<DataAdapterResult.Result<Model>> {
            let promise = Promise<DataAdapterResult.Result<Model>>()
            do {
                let students: [Student] = try unbox(data: data)
                let models = students.map { $0 as! Model }
                promise.setResult(DataAdapterResult.Result.success(models))
            } catch {
                promise.setError(DataAdapterError.conversionFailed)
            }
            return promise.future
        }
    }
}

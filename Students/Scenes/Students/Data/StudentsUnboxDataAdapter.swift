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
    class UnboxDataAdapter<Model:Unboxable>: Tiguer.DataAdapter<Model> {
        
        override func itemsFromData(_ data: Data) -> Future<DataAdapterResult.Result<Model>> {
            let promise = Promise<DataAdapterResult.Result<Model>>()
            do {
                let models: [Model] = try unbox(data: data)
                promise.setResult(DataAdapterResult.Result.success(models))
            } catch {
                promise.setError(DataAdapterError.conversionFailed)
            }
            return promise.future
        }
    }
}

//
//  StudentsTableViewController+DataSource.swift
//  Students
//
//  Created by Bruce McTigue on 8/28/19.
//  Copyright © 2019 tiguer. All rights reserved.
//

import UIKit
import Tiguer

extension StudentsTableViewController {
    func addDataSource() {
        self.tableViewDatasource = TableViewDataSource(models: viewModels, reuseIdentifier: StudentsTableViewController.cellName) { (model: ViewModel, cell: UITableViewCell) in
            let cell = cell as! StudentTableViewCell
            cell.firstNameLabel.text = model.firstName
            cell.lastNameLabel.text = model.lastName
            cell.fullNameLabel.text = model.fullName
        }
        self.tableView.dataSource = tableViewDatasource
    }
}

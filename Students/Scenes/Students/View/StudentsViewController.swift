//
//  ViewController.swift
//  Students
//
//  Created by Bruce McTigue on 8/28/19.
//  Copyright © 2019 tiguer. All rights reserved.
//

import UIKit

final class StudentsViewController: UIViewController {

    var tableViewController: StudentsTableViewController
    
    init(with tableViewController: StudentsTableViewController) {
        self.tableViewController = tableViewController
        super.init(nibName: nil, bundle: nil)
        self.title = "Students"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.lightGray
        add(tableViewController)
    }
    
    required init?(coder aDecoder: NSCoder) {
        return nil
    }
}

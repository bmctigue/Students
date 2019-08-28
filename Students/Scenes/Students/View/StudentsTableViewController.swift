//
//  StudentsViewController.swift
//  Students
//
//  Created by Bruce McTigue on 8/28/19.
//  Copyright © 2019 tiguer. All rights reserved.
//

import UIKit
import Tiguer

final class StudentsTableViewController: UIViewController {
    typealias ViewModel = Students.ViewModel
    
    private static let rowHeight: CGFloat = 50.0
    static let cellName = "StudentCell"
    static let cellNibName = "StudentTableViewCell"
    
    @IBOutlet weak var tableView: UITableView!
    
    var viewModels = [ViewModel]()
    var tableViewDatasource: TableViewDataSource<ViewModel>?
    private lazy var loadingViewController = LoadingViewController()
    private lazy var refreshControl = UIRefreshControl()
    
    private let interactor: InteractorProtocol
    let presenter: Students.Presenter<Student, ViewModel>
    
    init(with interactor: InteractorProtocol, presenter: Students.Presenter<Student, ViewModel>) {
        self.interactor = interactor
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.estimatedRowHeight = StudentsTableViewController.rowHeight
        self.tableView.register(UINib(nibName: StudentsTableViewController.cellNibName, bundle: nil), forCellReuseIdentifier: StudentsTableViewController.cellName)
        self.addDataSource()
        
        refreshControl.addTarget(self, action: #selector(refreshTableView), for: UIControl.Event.valueChanged)
        tableView.refreshControl = refreshControl
        
        let dynamicModels = presenter.getDynamicModels()
        dynamicModels.addObserver(self) { [weak self] in
            self?.updateTableView(dynamicModels.value)
            self?.refreshControl.endRefreshing()
            self?.loadingViewController.remove()
        }
        
        add(loadingViewController)
        let request = Request()
        fetchItems(request: request)
    }
    
    @objc func refreshTableView() {
        let params = [Tiguer.Constants.forceKey: "true"]
        let request = Request(params)
        fetchItems(request: request)
    }
    
    func fetchItems(request: Request) {
        let url = URL(string: "https://www.google.com")
        interactor.fetchItems(request, url: url)
    }
    
    func updateTableView(_ models: [ViewModel]) {
        self.tableViewDatasource?.models = models
        self.tableView.reloadData {
            self.tableView.scroll(to: .top, animated: true)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        return nil
    }
}

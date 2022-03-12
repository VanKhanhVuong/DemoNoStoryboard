//
//  HomeViewController.swift
//  DemoNoStoryboard
//
//  Created by admin on 10/03/2022.
//

import UIKit

class HomeViewController: UIViewController {
    
    private let todoTableView = UITableView()
    private let subview = UIView()
    private let inputTextField =  UITextField()
    private let addTaskButton = UIButton()
    
    var homeViewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        homeViewModel.delegate = self
        view.backgroundColor = .white
        [todoTableView, subview, inputTextField, addTaskButton].forEach { (item) in
            item.translatesAutoresizingMaskIntoConstraints = false
        }

        let layoutGuide = view.layoutMarginsGuide
        [todoTableView, subview].forEach { (item) in
            view.addSubview(item)
        }
        
        //              -- TABLEVIEW --
        todoTableView.delegate = self
        todoTableView.dataSource = self
        
        todoTableView.topIsEqualTo(with: layoutGuide.topAnchor, constant: 0)
        todoTableView.leadingIsEqualTo(with: layoutGuide.leadingAnchor, constant: 0)
        todoTableView.trallingIsEqualTo(with: layoutGuide.trailingAnchor, constant: 0)
        todoTableView.register(cellType: TaskTableViewCell.self)
        
        //              -- SUBVIEW --
        subview.layer.cornerRadius = 10
        subview.layer.borderWidth = 1
        subview.layer.borderColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        
        subview.heightEqualTo(equalTo: nil, constant: 60)
        subview.topIsEqualTo(with: todoTableView.bottomAnchor, constant: 0)
        subview.trallingIsEqualTo(with: layoutGuide.trailingAnchor, constant: 0)
        subview.leadingIsEqualTo(with: layoutGuide.leadingAnchor, constant: 0)
        subview.bottomIsEqualTo(with: layoutGuide.bottomAnchor, constant: 0)
        
        
        [inputTextField, addTaskButton].forEach { (item) in
            subview.addSubview(item)
        }
        
        //              -- TEXTFIELD --
        inputTextField.backgroundColor = .white
        inputTextField.placeholder = "Input todo..."
        inputTextField.customCornerRadius(corner: .topLeftbottomLeft, degree: 10.0)
    
        inputTextField.heightEqualTo(equalTo: nil, constant: 60)
        inputTextField.bottomIsEqualTo(with: subview.bottomAnchor, constant: 0)
        inputTextField.leadingIsEqualTo(with: subview.leadingAnchor, constant: 5)
        
        //              -- BUTTON --
        addTaskButton.setTitle("Add", for: .normal)
        addTaskButton.setTitleColor(.white, for: .normal)
        addTaskButton.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        addTaskButton.customCornerRadius(corner: .topRightBottomRight, degree: 10.0)
        
        addTaskButton.leadingIsEqualTo(with: inputTextField.trailingAnchor, constant: 0)
        addTaskButton.trallingIsEqualTo(with: subview.trailingAnchor, constant: 0)
        addTaskButton.bottomIsEqualTo(with: subview.bottomAnchor, constant: 0)
        addTaskButton.widthEqualTo(equalTo: nil, constant: 50)
        addTaskButton.heightEqualTo(equalTo: inputTextField.heightAnchor, constant: nil)
        addTaskButton.centerYAnchor.constraint(equalTo: inputTextField.centerYAnchor).isActive = true
        addTaskButton.addTarget(self, action: #selector(actionAddTask), for: .touchUpInside)
    }
    
    @objc func actionAddTask() {
        guard let text = inputTextField.text else { return }
        homeViewModel.addTask(task: text)
    }
}

extension HomeViewController: HomeViewModelEvents {
    func gotData(isData: Bool) {
        DispatchQueue.main.async {
            self.inputTextField.text?.removeAll()
            self.todoTableView.reloadData()
        }
    }
}
extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return homeViewModel.listTask.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let itemCell = tableView.dequeueReusableCell(with: TaskTableViewCell.self, for: indexPath)
        let item = homeViewModel.listTask[indexPath.row]
        itemCell.configCell(item: item)
        return itemCell
    }
}

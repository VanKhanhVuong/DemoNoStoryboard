//
//  HomeViewModel.swift
//  DemoNoStoryboard
//
//  Created by admin on 10/03/2022.
//

import Foundation

protocol HomeViewModelEvents: AnyObject {
    func gotData(isData: Bool)
}

class HomeViewModel {
    weak var delegate: HomeViewModelEvents?
    
    var listTask: [Task] = []
    
    func addTask(task: String) {
        listTask.append(Task(title: task))
        delegate?.gotData(isData: true)
    }
}

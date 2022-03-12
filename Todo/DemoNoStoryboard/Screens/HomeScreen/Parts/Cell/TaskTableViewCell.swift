//
//  TaskTableViewCell.swift
//  DemoNoStoryboard
//
//  Created by admin on 12/03/2022.
//

import UIKit

class TaskTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleTaskLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configCell(item: Task) {
        titleTaskLabel.text = item.title
    }
}

//
//  UITableView+register+dequeueReusableCell.swift
//  DemoNoStoryboard
//
//  Created by admin on 10/03/2022.
//

import UIKit

extension UITableView {
    func register<T: UITableViewCell>(cellType: T.Type, bundle: Bundle? = nil) {
        let className = cellType.className
        let nib = UINib(nibName: className, bundle: bundle)
        register(nib, forCellReuseIdentifier: className)
    }
    
    func dequeueReusableCell<T: UITableViewCell>(with type: T.Type, for indexPath: IndexPath) -> T {
        print(type.className)
        return self.dequeueReusableCell(withIdentifier: type.className, for: indexPath) as! T
    }
}

//
//  UIButton+Extention.swift
//  DemoNoStoryboard
//
//  Created by admin on 10/03/2022.
//

import UIKit

enum Corner {
    case topLeftbottomLeft
    case topRightBottomRight
    case defaultShow
}
extension UIView {
    func customCornerRadius(corner: Corner, degree: CGFloat) {
        self.clipsToBounds = true
        self.layer.cornerRadius = degree
        switch corner {
        case .topLeftbottomLeft:
            self.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMinXMinYCorner]
        case .topRightBottomRight:
            self.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
        case .defaultShow:
            break
        }
    }
}



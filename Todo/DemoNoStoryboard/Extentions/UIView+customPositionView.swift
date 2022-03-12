//
//  UIView+customPositionView.swift
//  DemoNoStoryboard
//
//  Created by admin on 10/03/2022.
//

import UIKit

extension UIView {
    func topIsEqualTo(with: NSLayoutAnchor<NSLayoutYAxisAnchor>, constant: CGFloat?) {
        if constant != 0 {
            self.topAnchor.constraint(equalTo: with, constant: constant ?? 0).isActive = true
        } else {
            self.topAnchor.constraint(equalTo: with, constant: 0).isActive = true
        }
    }
    
    func bottomIsEqualTo(with: NSLayoutAnchor<NSLayoutYAxisAnchor>, constant: CGFloat?) {
        if constant != 0 {
            self.bottomAnchor.constraint(equalTo: with, constant: constant ?? 0).isActive = true
        } else {
            self.bottomAnchor.constraint(equalTo: with, constant: 0).isActive = true
        }
    }
    
    func leadingIsEqualTo(with: NSLayoutAnchor<NSLayoutXAxisAnchor>, constant: CGFloat?) {
        if constant != 0 {
            self.leadingAnchor.constraint(equalTo: with, constant: constant ?? 0).isActive = true
        } else {
            self.leadingAnchor.constraint(equalTo: with, constant: 0).isActive = true
        }
    }
    
    func trallingIsEqualTo(with: NSLayoutAnchor<NSLayoutXAxisAnchor>, constant: CGFloat?) {
        if constant != 0 {
            self.trailingAnchor.constraint(equalTo: with, constant: constant ?? 0).isActive = true
        } else {
            self.trailingAnchor.constraint(equalTo: with, constant: 0).isActive = true
        }
    }
    
    func heightEqualTo(equalTo: NSLayoutAnchor<NSLayoutDimension>?, constant: CGFloat?) {
        if equalTo != nil && constant == nil {
            guard let layoutAnchor = equalTo else { return }
            self.heightAnchor.constraint(equalTo: layoutAnchor ).isActive = true
        } else {
            self.heightAnchor.constraint(equalToConstant: constant ?? 0).isActive = true
        }
    }
    
    func widthEqualTo(equalTo: NSLayoutAnchor<NSLayoutDimension>?, constant: CGFloat?) {
        if equalTo != nil && constant == nil {
            guard let layoutAnchor = equalTo else { return }
            self.widthAnchor.constraint(equalTo: layoutAnchor ).isActive = true
        } else {
            self.widthAnchor.constraint(equalToConstant: constant ?? 0).isActive = true
        }
    }
}

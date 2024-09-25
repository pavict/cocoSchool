//
//  Extensions.swift
//  cocoSchool
//
//  Created by Toni Pavic on 17.04.2023..
//

import Foundation
import UIKit

extension UIButton {
    func addShadowToBackground(color: UIColor = .black,
                               opacity: Float = 0.5,
                               radius: CGFloat = 0.0,
                               offset: CGSize = CGSize(width: 10, height: 10)) {
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOpacity = opacity
        self.layer.shadowRadius = radius
        self.layer.shadowOffset = offset
        self.layer.masksToBounds = false
    }
}

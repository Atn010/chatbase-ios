//
//  UIView+Corner.swift
//  chatbase
//
//  Created by Antonius George S on 09/12/20.
//

import UIKit

extension UIView {
   func roundCorners(corners: CACornerMask, radius: CGFloat) {
        self.layer.maskedCorners = corners
        self.layer.cornerRadius = radius
    }
}

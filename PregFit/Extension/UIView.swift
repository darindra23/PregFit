//
//  UIView.swift
//  PregFit
//
//  Created by Rizqi Ahmad Kurniawan on 16/06/21.
//

import UIKit

extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        get { return cornerRadius }
        set {
            self.layer.cornerRadius = newValue
        }
    }
}

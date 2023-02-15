//
//  CornerRadius.swift
//  Yummie
//
//  Created by Maheen on 14/02/2023.
//

import UIKit

extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        get { return self.cornerRadius }
        set {
            self.layer.cornerRadius = newValue
        }
    }
}

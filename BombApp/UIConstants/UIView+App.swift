//
//  UIView+App.swift
//  BombApp
//
//  Created by Evgenii Mazrukho on 08.08.2023.
//

import UIKit

extension UIView {
    
     func addShadowOnView() {
        
        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 5)
        layer.shadowOpacity = 0.7
        layer.shadowRadius = 1
    }
}

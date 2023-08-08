//
//  UILabel+App.swift
//  BombApp
//
//  Created by Evgenii Mazrukho on 07.08.2023.
//

import UIKit

extension UILabel {
    
    convenience init(text: String, font: UIFont?, color: UIColor) {
        self.init()
        self.text = text
        self.font = font
        textColor = color
        numberOfLines = 3
        textAlignment = .center
        adjustsFontSizeToFitWidth = true
        translatesAutoresizingMaskIntoConstraints = false
    }
}

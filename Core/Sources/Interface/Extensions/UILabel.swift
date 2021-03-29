//
//  UILabel.swift
//  
//
//  Created by Toby O'Connell on 28/03/2021.
//

import UIKit

extension UILabel {
    func styleAsDyanmicText(_ style: UIFont.TextStyle) {
        font = .preferredFont(forTextStyle: style)
        numberOfLines = 0
        adjustsFontForContentSizeCategory = true
    }
}

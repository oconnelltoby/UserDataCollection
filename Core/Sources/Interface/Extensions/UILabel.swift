//
//  UILabel.swift
//  
//
//  Created by Toby O'Connell on 28/03/2021.
//

import UIKit

extension UILabel {
    
    @discardableResult
    public func styleAsDyanmicText(_ style: UIFont.TextStyle) -> Self {
        font = .preferredFont(forTextStyle: style)
        numberOfLines = 0
        adjustsFontForContentSizeCategory = true
        return self
    }
    
    @discardableResult
    public func addText(_ text: String) -> Self {
        self.text = text
        return self
    }
    @discardableResult
    public func centralize() -> Self {
        textAlignment = .center
        return self
    }
}

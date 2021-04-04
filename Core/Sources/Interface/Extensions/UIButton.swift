//
//  UIButton.swift
//  
//
//  Created by Toby O'Connell on 28/03/2021.
//

import UIKit

extension UIButton {
    @discardableResult
    public func styleAsPrimary() -> Self {
        layer.cornerRadius = .buttonCornerRadius
        titleLabel?.styleAsDyanmicText(.headline).centralize()
        setTitleColor(.init(.primaryText), for: .normal)
                
        let gradientView = GradientView()
        insertSubview(gradientView, at: 0)
        clipsToBounds = true
        
        NSLayoutConstraint.activate([
            heightAnchor.constraint(greaterThanOrEqualToConstant: .buttonMinimumHeight),
            heightAnchor.constraint(greaterThanOrEqualTo: titleLabel!.heightAnchor, constant: .halfSpacing * 2),
            widthAnchor.constraint(greaterThanOrEqualTo: titleLabel!.widthAnchor, constant: .standardSpacing * 2),
        ])

        constrain(gradientView, to: self)
        
        return self
    }
    
    @discardableResult
    public func addAction(_ action: @escaping () -> Void) -> Self {
        addAction(.init(handler: { _ in action() }), for: .touchUpInside)
        return self
    }
    
    @discardableResult
    public func addTitle(_ title: String) -> Self {
        setTitle(title, for: .normal)
        return self
    }
}

//
//  UIStackView.swift
//  
//
//  Created by Toby O'Connell on 29/03/2021.
//

import UIKit

public protocol StackContentProvider {
    var content: [UIStackView.Content] { get }
}

extension Array: StackContentProvider where Element: StackContentProvider {
    public var content: [UIStackView.Content] {
        flatMap { $0.content }
    }
}

extension UIView: StackContentProvider {
    public var content: [UIStackView.Content] {
        [.init(view: self)]
    }
    
    func asStackContent(bottomSpacing: CGFloat) -> UIStackView.Content {
        .init(view: self, bottomSpacing: bottomSpacing)
    }
}

extension UIStackView.Content: StackContentProvider {
    public var content: [UIStackView.Content] {
        return [self]
    }
}

public extension UIStackView {
    struct Content {
        var view: UIView
        var bottomSpacing: CGFloat? = nil
    }
    
    @discardableResult
    func addContent(from contentProvider: StackContentProvider) -> Self {
        contentProvider.content.forEach { content in
            addArrangedSubview(content.view)
            if let bottomSpacing = content.bottomSpacing {
                setCustomSpacing(bottomSpacing, after: content.view)
            }
        }
        return self
    }
    
    @discardableResult
    func styleAsStandard() -> Self {
        axis = .vertical
        spacing = .standardSpacing
        alignment = .fill
        return self
    }
}

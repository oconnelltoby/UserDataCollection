//
// Copyright © 2021 Toby O'Connell. All rights reserved.
//

import UIKit

public protocol StackContentProvider {
    var content: [UIStackView.Content] { get }
}

extension Array: StackContentProvider where Element: StackContentProvider {
    public var content: [UIStackView.Content] {
        flatMap(\.content)
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
        [self]
    }
}

public extension UIStackView {
    struct Content {
        var view: UIView
        var bottomSpacing: CGFloat?
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
    func styleAsStandard(spacing: CGFloat = .standardSpacing) -> Self {
        axis = .vertical
        self.spacing = spacing
        alignment = .fill
        return self
    }

    func styleAsRow() -> Self {
        axis = .horizontal
        alignment = .center
        spacing = .standardSpacing
        return self
    }
}

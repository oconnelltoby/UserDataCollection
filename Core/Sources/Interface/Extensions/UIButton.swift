//
// Copyright © 2021 Toby O'Connell. All rights reserved.
//

import UIKit

public extension UIButton {
    @discardableResult
    func styleAsPrimary() -> Self {
        style(with: GradientView())
    }

    @discardableResult
    func styleAsSecondary() -> Self {
        style(with: BorderGradientView(cornerRadius: .buttonCornerRadius))
    }

    @discardableResult
    private func style(with gradientView: GradientView) -> Self {
        layer.cornerRadius = .buttonCornerRadius
        titleLabel?.styleAsDyanmicText(.headline).centralize()
        setTitleColor(.init(.primaryText), for: .normal)

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
    func addAction(_ action: @escaping () -> Void) -> Self {
        addAction(.init(handler: { _ in action() }), for: .touchUpInside)
        return self
    }

    @discardableResult
    func addTitle(_ title: String) -> Self {
        setTitle(title, for: .normal)
        return self
    }
}

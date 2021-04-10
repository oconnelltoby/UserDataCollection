//
// Copyright © 2021 Toby O'Connell. All rights reserved.
//

import UIKit

public class TextField: UITextField {
    private let gradientView = BorderGradientView(cornerRadius: .buttonCornerRadius)

    public init(text: String? = nil, placeholder: String? = nil) {
        super.init(frame: .zero)

        self.text = text
        self.placeholder = placeholder

        addAutoLayoutSubview(gradientView)
        constrain(gradientView, to: self)

        layer.borderWidth = 1
        layer.cornerRadius = .buttonCornerRadius
        setBorderHidden(false)

        font = UIFont.preferredFont(forTextStyle: .body)
        adjustsFontForContentSizeCategory = true
        autocorrectionType = .no
        enablesReturnKeyAutomatically = true
        NSLayoutConstraint.activate([heightAnchor.constraint(greaterThanOrEqualToConstant: .buttonMinimumHeight)])

        tintColor = UIColor(.accentGreen)
    }

    private func setBorderHidden(_ hide: Bool) {
        layer.borderColor = hide ? UIColor.clear.cgColor : UIColor(.primaryText).cgColor
    }

    override public var isEditing: Bool {
        gradientView.isHidden = !super.isEditing
        setBorderHidden(super.isEditing)
        return super.isEditing
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override public func textRect(forBounds bounds: CGRect) -> CGRect {
        super.textRect(forBounds: bounds).inset(by: .halfSpacing)
    }

    override public func editingRect(forBounds bounds: CGRect) -> CGRect {
        super.editingRect(forBounds: bounds).inset(by: .halfSpacing)
    }
}

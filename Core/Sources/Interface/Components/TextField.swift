//
// Copyright © 2021 Toby O'Connell. All rights reserved.
//

import UIKit

public class TextField: UITextField {
    private let gradientView = BorderGradientView(cornerRadius: .buttonCornerRadius)

    public enum ErrorState {
        case error
        case normal
    }

    public var errorState: ErrorState = .normal {
        didSet {
            setBorderColor(isEditing: isEditing, errorState: errorState)
            setTintColor(errorState: errorState)
        }
    }

    public init(text: String? = nil, placeholder: String? = nil) {
        super.init(frame: .zero)

        self.text = text
        self.placeholder = placeholder

        addAutoLayoutSubview(gradientView)
        constrain(gradientView, to: self)

        layer.cornerRadius = .buttonCornerRadius
        setBorderColor(isEditing: isEditing, errorState: errorState)
        setTintColor(errorState: errorState)

        font = UIFont.preferredFont(forTextStyle: .body)
        adjustsFontForContentSizeCategory = true
        autocorrectionType = .no
        enablesReturnKeyAutomatically = true
        NSLayoutConstraint.activate([heightAnchor.constraint(greaterThanOrEqualToConstant: .buttonMinimumHeight)])
    }
    
    private func setTintColor(errorState: ErrorState) {
        switch errorState {
        case .error:
            tintColor = UIColor(.error)
        case .normal:
            tintColor = UIColor(.accentGreen)
        }
    }

    private func setBorderColor(isEditing: Bool, errorState: ErrorState) {
        switch (isEditing, errorState) {
        case (true, .normal):
            gradientView.isHidden = false
            layer.borderColor = UIColor.clear.cgColor
            layer.borderWidth = 1
        case (false, .normal):
            gradientView.isHidden = true
            layer.borderColor = UIColor(.primaryText).cgColor
            layer.borderWidth = 1
        case (_, .error):
            gradientView.isHidden = true
            layer.borderColor = UIColor(.error).cgColor
            layer.borderWidth = 2
        }
    }

    override public var isEditing: Bool {
        setBorderColor(isEditing: super.isEditing, errorState: errorState)
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

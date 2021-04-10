//
// Copyright © 2021 Toby O'Connell. All rights reserved.
//

import UIKit

public extension CGFloat {
    static let standardSpacing: CGFloat = 16
    static let halfSpacing: CGFloat = standardSpacing / 2

    static let buttonCornerRadius: CGFloat = 15
    static let borderWidth: CGFloat = 2
    static let buttonMinimumHeight: CGFloat = 45
}

extension UIEdgeInsets {
    static let halfSpacing = UIEdgeInsets(
        top: .halfSpacing,
        left: .halfSpacing,
        bottom: .halfSpacing,
        right: .halfSpacing
    )
}

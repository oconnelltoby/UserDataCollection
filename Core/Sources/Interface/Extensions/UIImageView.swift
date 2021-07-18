//
// Copyright © 2021 Toby O'Connell. All rights reserved.
//

import UIKit

extension UIImageView {
    static func icon(systemName: String) -> UIImageView {
        let configuration = UIImage.SymbolConfiguration(textStyle: .title2)
        let image = UIImage(systemName: systemName, withConfiguration: configuration)?
            .withTintColor(.init(.primaryText), renderingMode: .alwaysOriginal)
        let imageView = UIImageView(image: image)

        imageView.setContentHuggingPriority(.required, for: .horizontal)
        imageView.setContentHuggingPriority(.required, for: .vertical)

        return imageView
    }
    
    func setTintColor(_ colorName: ColorName) {
        image = image?.withTintColor(UIColor(colorName))
    }
    
    func setTintColor(_ color: UIColor) {
        image = image?.withTintColor(color)
    }
}

//
// Copyright © 2021 Toby O'Connell. All rights reserved.
//

import UIKit

class GradientView: UIView {
    private(set) lazy var gradientLayer: CAGradientLayer = {
        let gradientLayer = CAGradientLayer()
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0, y: 1)
        return gradientLayer
    }()

    init() {
        super.init(frame: .zero)
        setColors()
        layer.insertSublayer(gradientLayer, at: 0)

        isUserInteractionEnabled = false
        translatesAutoresizingMaskIntoConstraints = false
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSublayers(of layer: CALayer) {
        super.layoutSublayers(of: layer)
        gradientLayer.frame = bounds
    }

    private func setColors() {
        gradientLayer.colors = [UIColor(.accentTeal), UIColor(.accentGreen)].map(\.cgColor)
    }

    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        if #available(iOS 13.0, *) {
            if traitCollection.hasDifferentColorAppearance(comparedTo: previousTraitCollection) {
                setColors()
            }
        }
    }
}

//
//  File.swift
//  
//
//  Created by Toby O'Connell on 28/03/2021.
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
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSublayers(of layer: CALayer) {
        super.layoutSublayers(of: layer)
        gradientLayer.frame = bounds
    }
    
    private func setColors() {
        gradientLayer.colors = [UIColor(.accentTeal), UIColor(.accentGreen)].map { $0.cgColor }
    }

    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        if #available(iOS 13.0, *) {
            if traitCollection.hasDifferentColorAppearance(comparedTo: previousTraitCollection) {
                setColors()
            }
        }
    }
}

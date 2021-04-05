//
//  ButtonGradientView.swift
//
//
//  Created by Toby O'Connell on 04/04/2021.
//

import UIKit

class BorderGradientView: GradientView {
    private(set) lazy var maskLayer: CAShapeLayer = {
        let maskLayer = CAShapeLayer()
        maskLayer.lineWidth = 2
        maskLayer.fillColor = nil
        maskLayer.strokeColor = UIColor.black.cgColor
        return maskLayer
    }()

    private var cornerRadius: CGFloat

    init(cornerRadius: CGFloat) {
        self.cornerRadius = cornerRadius
        super.init()
        gradientLayer.mask = maskLayer
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        let borderRect = bounds.insetBy(dx: .borderWidth / 2, dy: .borderWidth / 2)
        let path = UIBezierPath(roundedRect: borderRect, cornerRadius: cornerRadius - .borderWidth / 2)
        maskLayer.path = path.cgPath
    }
}

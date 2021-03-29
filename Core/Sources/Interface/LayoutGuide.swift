//
//  LayoutGuide.swift
//  
//
//  Created by Toby O'Connell on 29/03/2021.
//

import UIKit

/// A unified protocl for UILayoutGuide and UIView
///
/// Stops the need for using `Any` everywhere like `NSLayoutConstraint` does

public protocol LayoutGuide {
    var leadingAnchor: NSLayoutXAxisAnchor { get }
    var trailingAnchor: NSLayoutXAxisAnchor { get }
    var leftAnchor: NSLayoutXAxisAnchor { get }
    var rightAnchor: NSLayoutXAxisAnchor { get }
    var topAnchor: NSLayoutYAxisAnchor { get }
    var bottomAnchor: NSLayoutYAxisAnchor { get }
    var widthAnchor: NSLayoutDimension { get }
    var heightAnchor: NSLayoutDimension { get }
    var centerXAnchor: NSLayoutXAxisAnchor { get }
    var centerYAnchor: NSLayoutYAxisAnchor { get }
}

extension UIView: LayoutGuide {}
extension UILayoutGuide: LayoutGuide {}

func constrain(_ lhs: LayoutGuide, to rhs: LayoutGuide) {
    NSLayoutConstraint.activate([
        lhs.leadingAnchor.constraint(equalTo: rhs.leadingAnchor),
        lhs.trailingAnchor.constraint(equalTo: rhs.trailingAnchor),
        lhs.topAnchor.constraint(equalTo: rhs.topAnchor),
        lhs.bottomAnchor.constraint(equalTo: rhs.bottomAnchor),
    ])
}

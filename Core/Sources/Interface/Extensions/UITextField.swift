//
// Copyright © 2021 Toby O'Connell. All rights reserved.
//

import UIKit

extension UITextField {
    @discardableResult
    func withDelegate(_ delegate: UITextFieldDelegate) -> Self {
        self.delegate = delegate
        return self
    }
    
    public func shake() {
        let animation = CAKeyframeAnimation(keyPath: "transform.translation.x")
        animation.timingFunction = .init(name: .linear)
        animation.duration = 0.5
        
        let curveLength = CGFloat.pi * 8
        let values = stride(from: 0, to: 1, by: 0.01)
            .reversed()
            .map { unit in
                sin(unit * curveLength) * unit * CGFloat.standardSpacing
            }
        
        animation.values = values
        layer.add(animation, forKey: "shake")
    }
}

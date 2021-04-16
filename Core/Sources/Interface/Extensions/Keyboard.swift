//
// Copyright © 2021 Toby O'Connell. All rights reserved.
//

import UIKit

extension UIView {
    func observeKeyboardHeight(heightChanged: @escaping (CGFloat) -> Void) {
        [UIApplication.keyboardWillHideNotification, UIApplication.keyboardWillShowNotification].forEach {
            NotificationCenter.default.addObserver(forName: $0, object: nil, queue: .main) { [weak self] notification in
                guard let self = self else { return }
                guard let endFrame = notification.userInfo?.keyboardFrameEnd else { return }
                guard let curve = notification.userInfo?.animationCurve else { return }
                guard let duration = notification.userInfo?.animationDuration else { return }

                UIView.animate(
                    withDuration: duration,
                    delay: 0,
                    options: [.init(curve), .beginFromCurrentState],
                    animations: {
                        let convertedFrame = self.convert(endFrame, from: UIScreen.main.coordinateSpace)
                        let height = max(0, self.bounds.maxY - convertedFrame.minY)
                        heightChanged(height)
                        self.layoutIfNeeded()
                    }
                )
            }
        }
    }
}

extension Dictionary where Key == AnyHashable, Value == Any {
    var keyboardFrameEnd: CGRect? {
        self[UIApplication.keyboardFrameEndUserInfoKey] as? CGRect
    }

    var animationCurve: UIView.AnimationCurve? {
        let rawValue = self[UIApplication.keyboardAnimationCurveUserInfoKey] as? Int
        return rawValue.flatMap { UIView.AnimationCurve(rawValue: $0) }
    }

    var animationDuration: TimeInterval? {
        self[UIApplication.keyboardAnimationDurationUserInfoKey] as? TimeInterval
    }
}

public extension UIView.AnimationOptions {
    init(_ curve: UIView.AnimationCurve) {
        switch curve {
        case .easeInOut:
            self = .curveEaseInOut
        case .easeIn:
            self = .curveEaseIn
        case .easeOut:
            self = .curveEaseOut
        case .linear:
            self = .curveLinear
        @unknown default:
            self = .curveEaseInOut
        }
    }
}

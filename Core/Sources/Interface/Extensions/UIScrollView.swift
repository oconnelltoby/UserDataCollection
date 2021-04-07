//
// Copyright © 2021 Toby O'Connell. All rights reserved.
//

import UIKit

public extension UIScrollView {
    convenience init(contentProvider: StackContentProvider) {
        let stackView = UIStackView()
            .addContent(from: contentProvider)
            .styleAsStandard()
        self.init(stackView: stackView)
    }

    convenience init(stackView: UIStackView) {
        self.init(frame: .zero)

        addAutoLayoutSubview(stackView)
        backgroundColor = UIColor(.background)

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentLayoutGuide.topAnchor, constant: .standardSpacing),
            stackView.bottomAnchor.constraint(equalTo: contentLayoutGuide.bottomAnchor, constant: -.standardSpacing),
            stackView.leadingAnchor.constraint(equalTo: readableContentGuide.leadingAnchor, constant: .halfSpacing),
            stackView.trailingAnchor.constraint(equalTo: readableContentGuide.trailingAnchor, constant: -.halfSpacing),
            contentLayoutGuide.widthAnchor.constraint(equalTo: widthAnchor),
        ])
    }
}

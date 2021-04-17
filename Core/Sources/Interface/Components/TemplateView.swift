//
// Copyright © 2021 Toby O'Connell. All rights reserved.
//

import UIKit

public class TemplateView: UIView {
    let footerStackView: UIView

    let scrollView: UIScrollView
    let topBlurView: UIVisualEffectView
    let bottomBlurView: UIVisualEffectView

    public init(scrolling: StackContentProvider, footer: StackContentProvider) {
        footerStackView = UIStackView().addContent(from: footer).styleAsStandard(spacing: .doubleSpacing)
        scrollView = UIScrollView(contentProvider: scrolling)
        topBlurView = UIVisualEffectView(effect: UIBlurEffect(style: .regular))
        bottomBlurView = UIVisualEffectView(effect: UIBlurEffect(style: .regular))

        super.init(frame: .zero)
        backgroundColor = UIColor(.background)

        addSubviews()
        setupConstraints()
    }

    private func addSubviews() {
        addAutoLayoutSubview(scrollView)
        addAutoLayoutSubview(topBlurView)
        addAutoLayoutSubview(bottomBlurView)
        bottomBlurView.contentView.addAutoLayoutSubview(footerStackView)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            topBlurView.topAnchor.constraint(equalTo: topAnchor),
            topBlurView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            topBlurView.leadingAnchor.constraint(equalTo: leadingAnchor),
            topBlurView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            topAnchor.constraint(equalTo: scrollView.topAnchor),
            safeAreaLayoutGuide.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            safeAreaLayoutGuide.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            
            leadingAnchor.constraint(equalTo: bottomBlurView.leadingAnchor),
            trailingAnchor.constraint(equalTo: bottomBlurView.trailingAnchor),
            bottomAnchor.constraint(equalTo: bottomBlurView.bottomAnchor),
            
            footerStackView.leadingAnchor.constraint(equalTo: readableContentGuide.leadingAnchor),
            footerStackView.trailingAnchor.constraint(equalTo: readableContentGuide.trailingAnchor),
            footerStackView.topAnchor.constraint(equalTo: bottomBlurView.topAnchor, constant: .standardSpacing),
        ])

        let bottomConstraint = footerStackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -.standardSpacing)
        bottomConstraint.isActive = true
        bottomConstraint.priority = .defaultHigh

        let keyboardConstraint = footerStackView.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor)
        keyboardConstraint.isActive = true

        observeKeyboardHeight { height in
            keyboardConstraint.constant = -.standardSpacing - height
        }
    }

    private func setBlurTransparent() {
        [topBlurView, bottomBlurView]
            .flatMap(\.subviews).forEach {
                $0.backgroundColor = .clear
            }
    }

    private func makeSpaceForFooter() {
        scrollView.contentInset.bottom = bottomBlurView.bounds.height
    }

    override public func layoutSubviews() {
        super.layoutSubviews()

        setBlurTransparent()
        makeSpaceForFooter()
    }

    override public func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)

        // Re-layout if (dark / light) mode or prefered font size changes
        setNeedsLayout()
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

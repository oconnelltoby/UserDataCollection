//
//  TemplateView.swift
//
//
//  Created by Toby O'Connell on 03/04/2021.
//

import UIKit

public class TemplateView: UIView {
    let footerStackView: UIView

    let scrollView: UIScrollView
    let blurView: UIVisualEffectView

    public init(scrolling: StackContentProvider, footer: StackContentProvider) {
        footerStackView = UIStackView().addContent(from: footer).styleAsStandard()
        scrollView = UIScrollView(contentProvider: scrolling)
        blurView = UIVisualEffectView(effect: UIBlurEffect(style: .regular))

        super.init(frame: .zero)
        backgroundColor = UIColor(.background)

        addSubviews()
        setupConstraints()
    }

    private func addSubviews() {
        addAutoLayoutSubview(scrollView)
        addAutoLayoutSubview(blurView)
        blurView.contentView.addAutoLayoutSubview(footerStackView)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            safeAreaLayoutGuide.topAnchor.constraint(equalTo: scrollView.topAnchor),
            safeAreaLayoutGuide.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            safeAreaLayoutGuide.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),

            leadingAnchor.constraint(equalTo: blurView.leadingAnchor),
            trailingAnchor.constraint(equalTo: blurView.trailingAnchor),
            bottomAnchor.constraint(equalTo: blurView.bottomAnchor),

            footerStackView.leadingAnchor.constraint(equalTo: readableContentGuide.leadingAnchor),
            footerStackView.trailingAnchor.constraint(equalTo: readableContentGuide.trailingAnchor),
            footerStackView.topAnchor.constraint(equalTo: blurView.topAnchor, constant: .standardSpacing),
            footerStackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -.standardSpacing),
        ])
    }

    private func setBlurTransparent() {
        blurView.subviews.forEach {
            $0.backgroundColor = .clear
        }
    }

    private func makeSpaceForFooter() {
        scrollView.contentInset.bottom = blurView.bounds.height
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

//
//  TemplateViewScenario.swift
//
//
//  Created by Toby O'Connell on 03/04/2021.
//

import Integration
import Interface
import UIKit

public class TemplateViewScenario: Scenario {
    public static var path = Path("Components", "Template View")

    public static var alertTitle = "Button Pressed"
    public static var buttonTitle = "Primary Button"
    public static var labelText = "This is some text to go inside the scrolling content. If it is very long or if accessibility font size is set to large, this should scroll."

    public static var coordinator: Coordinating {
        let viewController = ViewController(
            alertTitle: alertTitle,
            buttonTitle: buttonTitle,
            labelText: labelText
        )

        return SimpleCoordinator(rootViewController: viewController)
    }
}

private class ViewController: UIViewController {
    init(alertTitle: String, buttonTitle: String, labelText: String) {
        super.init(nibName: nil, bundle: nil)

        let label = UILabel()
            .styleAsDyanmicText(.body)
            .addText(labelText)

        let button = UIButton()
            .styleAsPrimary()
            .addTitle(buttonTitle)
            .addAction { [weak self] in
                self?.showAlert(title: alertTitle, actionTitle: "Ok")
            }

        view = TemplateView(
            scrolling: [label],
            footer: button
        )
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

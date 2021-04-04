//
//  PrimaryButton.swift
//  
//
//  Created by Toby O'Connell on 29/03/2021.
//

import Integration
import Interface
import UIKit

public class ButtonScenario: Scenario {
    public static var path = Path("Components", "Buttons")
    public static var primaryButtonAlertTitle = "Primary Button Pressed"
    public static var secondaryButtonAlertTitle = "Secondary Button Pressed"

    public static var primaryButtonTitle = "Primary Button"
    public static var secondaryButtonTitle = "Secondary Button"

    public static var coordinator: Coordinating {
        let primaryButton = UIButton()
            .styleAsPrimary()
            .addTitle(primaryButtonTitle)

        let secondaryButton = UIButton()
            .styleAsSecondary()
            .addTitle(secondaryButtonTitle)
        
        let viewController = ContentViewController(contentProvider: [primaryButton, secondaryButton])
        
        primaryButton.addAction { [weak viewController] in
            viewController?.showAlert(title: primaryButtonAlertTitle, actionTitle: "Ok")
        }

        secondaryButton.addAction { [weak viewController] in
            viewController?.showAlert(title: secondaryButtonAlertTitle, actionTitle: "Ok")
        }
        
        return SimpleCoordinator(rootViewController: viewController)
    }
}

//
//  PrimaryButton.swift
//  
//
//  Created by Toby O'Connell on 29/03/2021.
//

import Integration
import Interface
import UIKit

public class PrimaryButtonScenario: Scenario {
    public static var path = Path("Components", "Primary Button")
    public static var alertTitle = "Button Pressed"
    public static var buttonTitle = "Primary Button"
    
    public static var coordinator: Coordinating {
        let button = UIButton()
            .styleAsPrimary()
            .addTitle(buttonTitle)
        
        let viewController = ContentViewController(contentProvider: button)
        
        button.addAction { [weak viewController] in
            viewController?.showAlert(title: alertTitle, actionTitle: "Ok")
        }
        
        return SimpleCoordinator(rootViewController: viewController)
    }
}

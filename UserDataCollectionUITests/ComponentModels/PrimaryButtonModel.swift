//
//  PrimaryButtonModel.swift
//  UserDataCollectionUITests
//
//  Created by Toby O'Connell on 03/04/2021.
//


import XCTest
import Scenarios

struct PrimaryButtonModel {
    var app: XCUIApplication
    
    var primaryButton: XCUIElement {
        app.staticTexts[ButtonScenario.primaryButtonTitle]
    }
    
    var primaryButtonAlertTitle: XCUIElement {
        app.staticTexts[ButtonScenario.primaryButtonAlertTitle]
    }

    var secondaryButton: XCUIElement {
        app.staticTexts[ButtonScenario.secondaryButtonTitle]
    }

    var secondaryButtonAlertTitle: XCUIElement {
        app.staticTexts[ButtonScenario.secondaryButtonAlertTitle]
    }
}

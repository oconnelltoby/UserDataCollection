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
    
    var button: XCUIElement {
        app.staticTexts[PrimaryButtonScenario.buttonTitle]
    }
    
    var alertTitle: XCUIElement {
        app.staticTexts[PrimaryButtonScenario.alertTitle]
    }
}

//
// Copyright © 2021 Toby O'Connell. All rights reserved.
//

import Integration
import Interface
import UIKit

class DatePickerScenario: Scenario {
    static var path = Path("Screens", "Prototype", "Date Picker")

    static var coordinator: Coordinating {
        SimpleCoordinator(rootViewController: ViewController())
    }
}

private class ViewController: UIViewController {
    override func loadView() {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.tintColor = UIColor(.accentGreen)
        datePicker.becomeFirstResponder()
        datePicker.preferredDatePickerStyle = .inline
        
        let displayLabel = UILabel().styleAsDyanmicText(.body)
        
        let formatter = DateFormatter()
        formatter.locale = .autoupdatingCurrent
        formatter.setLocalizedDateFormatFromTemplate("ddMMMMyyyy")
        
        let displayDate = { [weak datePicker] in
            guard let datePicker = datePicker else { return }
            let date = formatter.string(for: datePicker.date)?.replacingOccurrences(of: "/", with: " / ")
            displayLabel.text = date.map { "You have selected \($0) as your date of birth" }
        }
        
        displayDate()

        datePicker.addAction(
            .init { _ in
                displayDate()
            },
            for: .valueChanged
        )
                        
        view = TemplateView(
            scrolling: [
                UILabel().styleAsDyanmicText(.body).addText("Please select your date of birth"),
                datePicker,
                displayLabel,
            ],
            footer: [UIButton().addTitle("Continue").styleAsPrimary()]
        )
        
        title = "Date Picker"
    }
}

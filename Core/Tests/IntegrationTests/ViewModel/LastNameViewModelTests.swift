//
// Copyright © 2021 Toby O'Connell. All rights reserved.
//

import Domain
import Localization
import UserDataValidation
import XCTest
@testable import Integration
@testable import Interface

class LastNameViewModelTests: XCTestCase {
    let minLength: UInt = 0
    let maxLength: UInt = .max
    var validator: MockLastNameValidator!
    var viewModel: SingleFieldViewModel!
    var storedLastName: LastNameModel?

    override func setUp() {
        validator = MockLastNameValidator(
            validInput: "Valid Last Name",
            tooLongInput: "Too Long Last Name",
            tooShortInput: "Too Short Last Name",
            nameLength: 0 ... .max
        )

        viewModel = .lastName(
            validator: validator,
            store: { [weak self] in
                self?.storedLastName = $0
            }
        )

        storedLastName = nil
    }

    func testCopy() {
        XCTAssertEqual(localize(.last_name_title), viewModel.labels.title)
        XCTAssertEqual(localize(.last_name_heading), viewModel.labels.heading)
        XCTAssertEqual(localize(.last_name_body), viewModel.labels.body)
        XCTAssertEqual(localize(.last_name_info(min: minLength, max: maxLength)), viewModel.labels.info)
        XCTAssertEqual(localize(.last_name_button), viewModel.labels.button)
        XCTAssertEqual(localize(.last_name_textfield_placeholder), viewModel.labels.textField)
    }

    func testMaxLengthMatchesValidator() {
        XCTAssertEqual(viewModel.maxLength, validator.nameLength.upperBound)
    }

    func testValidInputIsStored() throws {
        let result = viewModel.validate(validator.validInput)
        try result.get()()
        XCTAssertEqual(storedLastName?.value, validator.validInput)
    }

    func testTooLongInputIsNotStored() {
        let result = viewModel.validate(validator.tooLongInput)
        XCTAssertThrowsError(try result.get())
        XCTAssertNil(storedLastName?.value)
    }

    func testTooShortInputIsNotStored() {
        let result = viewModel.validate(validator.tooShortInput)
        XCTAssertThrowsError(try result.get())
        XCTAssertNil(storedLastName?.value)
    }

    func testValidInputReturnsSuccess() {
        XCTAssertNoThrow(try viewModel.validate(validator.validInput).get())
    }

    func testTooLongInputReturnsTooLongError() {
        XCTAssertThrowsError(try viewModel.validate(validator.tooLongInput).get()) { error in
            XCTAssertEqual(error as? LastNameValidator.LastNameError, .tooLong)
        }
    }

    func testTooShortInputReturnsTooShortError() {
        XCTAssertThrowsError(try viewModel.validate(validator.tooShortInput).get()) { error in
            XCTAssertEqual(error as? LastNameValidator.LastNameError, .tooShort)
        }
    }
}

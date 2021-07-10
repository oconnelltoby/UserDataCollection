//
// Copyright © 2021 Toby O'Connell. All rights reserved.
//

import Domain
import Localization
import UserDataValidation
import XCTest
@testable import Integration
@testable import Interface

class FirstNameViewModelTests: XCTestCase {
    let minLength: UInt = 0
    let maxLength: UInt = .max
    var validator: MockFirstNameValidator!
    var viewModel: SingleFieldViewModel!
    var storedFirstName: FirstNameModel?

    override func setUp() {
        validator = MockFirstNameValidator(
            validInput: "Valid First Name",
            tooLongInput: "Too Long First Name",
            tooShortInput: "Too Short First Name",
            nameLength: 0 ... .max
        )

        viewModel = .firstName(
            validator: validator,
            store: { [weak self] in
                self?.storedFirstName = $0
            }
        )

        storedFirstName = nil
    }
    
    func testCopy() {
        XCTAssertEqual(localize(.first_name_title), viewModel.labels.title)
        XCTAssertEqual(localize(.first_name_heading), viewModel.labels.heading)
        XCTAssertEqual(localize(.first_name_body), viewModel.labels.body)
        XCTAssertEqual(localize(.first_name_info(min: minLength, max: maxLength)), viewModel.labels.info)
        XCTAssertEqual(localize(.first_name_button), viewModel.labels.button)
        XCTAssertEqual(localize(.first_name_textfield_placeholder), viewModel.labels.textField)
    }

    func testMaxLengthMatchesValidator() {
        XCTAssertEqual(viewModel.maxLength, validator.nameLength.upperBound)
    }

    func testValidInputIsStored() throws {
        let result = viewModel.validate(validator.validInput)
        try result.get()()
        XCTAssertEqual(storedFirstName?.value, validator.validInput)
    }

    func testTooLongInputIsNotStored() {
        let result = viewModel.validate(validator.tooLongInput)
        XCTAssertThrowsError(try result.get())
        XCTAssertNil(storedFirstName?.value)
    }

    func testTooShortInputIsNotStored() {
        let result = viewModel.validate(validator.tooShortInput)
        XCTAssertThrowsError(try result.get())
        XCTAssertNil(storedFirstName?.value)
    }

    func testValidInputReturnsSuccess() {
        XCTAssertNoThrow(try viewModel.validate(validator.validInput).get())
    }

    func testTooLongInputReturnsTooLongError() {
        XCTAssertThrowsError(try viewModel.validate(validator.tooLongInput).get()) { error in
            XCTAssertEqual(error as? FirstNameValidator.FirstNameError, .tooLong)
        }
    }

    func testTooShortInputReturnsTooShortError() {
        XCTAssertThrowsError(try viewModel.validate(validator.tooShortInput).get()) { error in
            XCTAssertEqual(error as? FirstNameValidator.FirstNameError, .tooShort)
        }
    }
}

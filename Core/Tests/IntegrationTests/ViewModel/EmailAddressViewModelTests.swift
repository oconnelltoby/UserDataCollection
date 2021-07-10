//
// Copyright © 2021 Toby O'Connell. All rights reserved.
//

import Domain
import Localization
import UserDataValidation
import XCTest
@testable import Integration
@testable import Interface

class EmailAddressViewModelTests: XCTestCase {
    let minLength: UInt = 0
    let maxLength: UInt = .max
    var validator: MockEmailAddressValidator!
    var viewModel: SingleFieldViewModel!
    var storedEmailAddress: EmailAddressModel?

    override func setUp() {
        validator = MockEmailAddressValidator(
            validInput: "Valid Email Address",
            tooLongInput: "Too Long Email Address",
            tooShortInput: "Too Short Email Address",
            emailAddressLength: minLength ... maxLength
        )

        viewModel = .email(
            validator: validator,
            store: { [weak self] in
                self?.storedEmailAddress = $0
            }
        )

        storedEmailAddress = nil
    }
    
    func testCopy() {
        XCTAssertEqual(localize(.email_address_title), viewModel.labels.title)
        XCTAssertEqual(localize(.email_address_heading), viewModel.labels.heading)
        XCTAssertEqual(localize(.email_address_body), viewModel.labels.body)
        XCTAssertEqual(localize(.email_address_info(min: minLength, max: maxLength)), viewModel.labels.info)
        XCTAssertEqual(localize(.email_address_button), viewModel.labels.button)
        XCTAssertEqual(localize(.email_address_textfield_placeholder), viewModel.labels.textField)
    }

    func testMaxLengthMatchesValidator() {
        XCTAssertEqual(viewModel.maxLength, validator.emailAddressLength.upperBound)
    }

    func testValidInputIsStored() throws {
        let result = viewModel.validate(validator.validInput)
        try result.get()()
        XCTAssertEqual(storedEmailAddress?.value, validator.validInput)
    }

    func testTooLongInputIsNotStored() {
        let result = viewModel.validate(validator.tooLongInput)
        XCTAssertThrowsError(try result.get())
        XCTAssertNil(storedEmailAddress?.value)
    }

    func testTooShortInputIsNotStored() {
        let result = viewModel.validate(validator.tooShortInput)
        XCTAssertThrowsError(try result.get())
        XCTAssertNil(storedEmailAddress?.value)
    }

    func testValidInputReturnsSuccess() {
        XCTAssertNoThrow(try viewModel.validate(validator.validInput).get())
    }

    func testTooLongInputReturnsTooLongError() {
        XCTAssertThrowsError(try viewModel.validate(validator.tooLongInput).get()) { error in
            XCTAssertEqual(error as? EmailAddressValidator.EmailAddressError, .tooLong)
        }
    }

    func testTooShortInputReturnsTooShortError() {
        XCTAssertThrowsError(try viewModel.validate(validator.tooShortInput).get()) { error in
            XCTAssertEqual(error as? EmailAddressValidator.EmailAddressError, .tooShort)
        }
    }
}

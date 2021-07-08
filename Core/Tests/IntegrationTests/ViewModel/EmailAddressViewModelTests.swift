//
// Copyright © 2021 Toby O'Connell. All rights reserved.
//

import Domain
import UserDataValidation
import XCTest
@testable import Integration
@testable import Interface

class EmailAddressViewModelTests: XCTestCase {
    var validator: MockEmailAddressValidator!
    var viewModel: EmailAddressViewModel!
    var storedEmailAddress: EmailAddressModel?

    override func setUp() {
        validator = MockEmailAddressValidator(
            validInput: "Valid Email Address",
            tooLongInput: "Too Long Email Address",
            tooShortInput: "Too Short Email Address",
            emailAddressLength: 0 ... .max
        )

        viewModel = EmailAddressViewModel(
            validator: validator,
            store: { [weak self] in
                self?.storedEmailAddress = $0
            }
        )

        storedEmailAddress = nil
    }

    func testMinLengthMatchesValidator() {
        XCTAssertEqual(viewModel.minLength, validator.emailAddressLength.lowerBound)
    }

    func testMaxLengthMatchesValidator() {
        XCTAssertEqual(viewModel.maxLength, validator.emailAddressLength.upperBound)
    }

    func testValidInputIsStored() {
        _ = viewModel.validate(validator.validInput)
        XCTAssertEqual(storedEmailAddress?.value, validator.validInput)
    }

    func testTooLongInputIsNotStored() {
        _ = viewModel.validate(validator.tooLongInput)
        XCTAssertNil(storedEmailAddress?.value)
    }

    func testTooShortInputIsNotStored() {
        _ = viewModel.validate(validator.tooShortInput)
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

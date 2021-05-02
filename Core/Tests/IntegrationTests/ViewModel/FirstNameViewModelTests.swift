//
// Copyright © 2021 Toby O'Connell. All rights reserved.
//

import UserDataValidation
import XCTest
@testable import Integration
@testable import Interface

class FirstNameViewModelTests: XCTestCase {
    var validator: MockFirstNameValidator!
    var viewModel: FirstNameViewModel!
    var storedFirstName: FirstNameModel?

    override func setUp() {
        validator = MockFirstNameValidator(
            validInput: "Valid First Name",
            tooLongInput: "Too Long First Name",
            tooShortInput: "Too Short First Name",
            nameLength: 0 ... .max
        )

        viewModel = FirstNameViewModel(
            validator: validator,
            store: { [weak self] in
                self?.storedFirstName = $0
            }
        )

        storedFirstName = nil
    }

    func testMinLengthMatchesValidator() {
        XCTAssertEqual(viewModel.minLength, validator.nameLength.lowerBound)
    }

    func testMaxLengthMatchesValidator() {
        XCTAssertEqual(viewModel.maxLength, validator.nameLength.upperBound)
    }

    func testValidInputIsStored() {
        _ = viewModel.validate(validator.validInput)
        XCTAssertEqual(storedFirstName?.value, validator.validInput)
    }

    func testTooLongInputIsNotStored() {
        _ = viewModel.validate(validator.tooLongInput)
        XCTAssertNil(storedFirstName?.value)
    }

    func testTooShortInputIsNotStored() {
        _ = viewModel.validate(validator.tooShortInput)
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

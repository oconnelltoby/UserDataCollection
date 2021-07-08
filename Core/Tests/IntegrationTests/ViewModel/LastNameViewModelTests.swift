//
// Copyright © 2021 Toby O'Connell. All rights reserved.
//

import Domain
import UserDataValidation
import XCTest
@testable import Integration
@testable import Interface

class LastNameViewModelTests: XCTestCase {
    var validator: MockLastNameValidator!
    var viewModel: LastNameViewModel!
    var storedLastName: LastNameModel?

    override func setUp() {
        validator = MockLastNameValidator(
            validInput: "Valid Last Name",
            tooLongInput: "Too Long Last Name",
            tooShortInput: "Too Short Last Name",
            nameLength: 0 ... .max
        )

        viewModel = LastNameViewModel(
            validator: validator,
            store: { [weak self] in
                self?.storedLastName = $0
            }
        )

        storedLastName = nil
    }

    func testMinLengthMatchesValidator() {
        XCTAssertEqual(viewModel.minLength, validator.nameLength.lowerBound)
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

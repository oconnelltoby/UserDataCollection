//
//  Lint.swift
//
//
//  Created by Toby O'Connell on 04/04/2021.
//

import ArgumentParser
import ShellOut

struct Lint: ParsableCommand {
    static var configuration = CommandConfiguration(
        commandName: "lint",
        abstract: "Lint the codebase, such as static analysis."
    )
    
    @Argument(help: "Path to code that should be linted")
    var path: String
    
    @Argument(help: "Swift version used by swiftformat for version-specific linting")
    var swiftVersion: String

    func run() throws {
        try shell("swift run swiftformat \(path) --swiftversion \(swiftVersion)")
        try shell("swift run swiftlint --path \(path)")
    }
}

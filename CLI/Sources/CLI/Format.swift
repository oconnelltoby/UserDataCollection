//
//  Lint.swift
//
//
//  Created by Toby O'Connell on 04/04/2021.
//

import ArgumentParser

struct Format: ParsableCommand {
    static var configuration = CommandConfiguration(
        commandName: "format",
        abstract: "Format the codebase with swiftformat"
    )
    
    @Argument(help: "Path to code that should be formatted")
    var path: String
    
    @Argument(help: "Swift version used by swiftformat for version-specific formatting")
    var swiftVersion: String

    func run() throws {
        try shell("swift run swiftformat \(path) --swiftversion \(swiftVersion)")
    }
}

//
//  Lint.swift
//
//
//  Created by Toby O'Connell on 04/04/2021.
//

import ArgumentParser

struct Lint: ParsableCommand {
    static var configuration = CommandConfiguration(
        commandName: "lint",
        abstract: "Lint the codebase with swiftlint"
    )
    
    @Argument(help: "Path to code that should be linted")
    var path: String
    
    func run() throws {
        try shell("swift run swiftlint --path \(path)")
    }
}

//
// Copyright © 2021 Toby O'Connell. All rights reserved.
//

import ArgumentParser

struct Format: ParsableCommand {
    static var configuration = CommandConfiguration(
        commandName: "format",
        abstract: "Format the codebase with swiftformat"
    )

    @Argument(help: "Path to code that should be formatted")
    var path: String

    @Flag(help: "If true, lint and report errors rather than performing changes")
    var lint = false

    func run() throws {
        let lintFlag = lint ? " --lint" : ""
        try shell("swift run swiftformat \(path)\(lintFlag)")
    }
}

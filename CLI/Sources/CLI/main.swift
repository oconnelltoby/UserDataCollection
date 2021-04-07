//
// Copyright © 2021 Toby O'Connell. All rights reserved.
//

import ArgumentParser

struct CLI: ParsableCommand {
    static let configuration = CommandConfiguration(
        commandName: "cli",
        abstract: "CLI commands",
        subcommands: [Format.self]
    )
}

CLI.main()

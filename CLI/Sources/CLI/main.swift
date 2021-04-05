//
//  main.swift
//
//
//  Created by Toby O'Connell on 04/04/2021.
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

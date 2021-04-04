//
//  Shell.swift
//
//
//  Created by Toby O'Connell on 04/04/2021.
//

import ShellOut

func shell(_ command: String) throws {
    try shellOut(
        to: command,
        outputHandle: .standardOutput,
        errorHandle: .standardError
    )
}

//
// Copyright © 2021 Toby O'Connell. All rights reserved.
//

import ShellOut

func shell(_ command: String) throws {
    try shellOut(
        to: command,
        outputHandle: .standardOutput,
        errorHandle: .standardError
    )
}

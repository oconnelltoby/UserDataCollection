//
// Copyright © 2021 Toby O'Connell. All rights reserved.
//

public extension Result where Success == Void {
    static var success: Self {
        Self.success(())
    }
}

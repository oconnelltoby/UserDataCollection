//
//  Path.swift
//
//
//  Created by Toby O'Connell on 27/03/2021.
//

public class Path {
    var title: String
    var tail: Path?

    convenience init(_ title: String, _ tail: String...) {
        self.init(title, tail)
    }

    private init<Tail: Collection>(_ title: String, _ tail: Tail) where Tail.Element == String {
        self.title = title
        self.tail = tail.first.map {
            Path($0, tail.dropFirst())
        }
    }
}

extension Path: CustomDebugStringConvertible {
    public var debugDescription: String {
        [title, tail?.debugDescription]
            .compactMap { $0 }
            .joined(separator: "/")
    }
}

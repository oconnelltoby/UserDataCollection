//
//  Path.swift
//  
//
//  Created by Toby O'Connell on 27/03/2021.
//

class Path {
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

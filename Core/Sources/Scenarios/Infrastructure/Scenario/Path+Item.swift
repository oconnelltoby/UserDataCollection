//
//  Path+Item.swift
//  
//
//  Created by Toby O'Connell on 27/03/2021.
//

extension Array where Element == HierarchyViewController.Item {
    typealias InsertionError = Element.InsetionError
    
    mutating func insert(_ path: Path, action: @escaping () -> Void) throws {
        let existingItem = first { $0.title == path.title }
        
        switch (existingItem, path.tail) {
        case (.some(var existingItem), .some(let subPath)):
            try existingItem.insert(subPath: subPath, action: action)
        case (.some(let existingItem), .none):
            throw InsertionError(message: "Attempting to overwrite item \"\(existingItem.title)\" with new action")
        case (.none, .some(let subPath)):
            try insert(title: path.title, subPath: subPath, action: action)
        case (.none, .none):
            append(.init(title: path.title, part: .leaf(action: action)))
        }
    }
    
    private mutating func insert(title: String, subPath: Path, action: @escaping () -> Void) throws {
        var subItems = [Element]()
        try subItems.insert(subPath, action: action)
        append(.init(title: title, part: .node(items: subItems)))
    }
}

extension HierarchyViewController.Item {
    struct InsetionError: Error {
        let message: String
    }
    
    fileprivate mutating func insert(subPath: Path, action: @escaping () -> Void) throws {
        switch part {
        case .leaf:
            throw InsetionError(message: "Attempting to overwrite item \"\(title)\" with sub-items")
        case .node(var items):
            try items.insert(subPath, action: action)
            part = .node(items: items)
        }
    }
}

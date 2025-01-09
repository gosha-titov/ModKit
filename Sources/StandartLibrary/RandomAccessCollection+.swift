extension RandomAccessCollection {
    
    /// Returns the elements of the sequence, sorted using the given predicate as the comparison between some elements.
    ///
    ///     struct User {
    ///         let id: Int
    ///         let name: String
    ///     }
    ///     let users = [
    ///         User(id: 0, name: "James"), User(id: 1, name: "Robert"),
    ///         User(id: 2, name: "Mary"), User(id: 3, name: "Lisa")
    ///     ]
    ///     let sortedUsers = users.sorted(by: \.name, using: <)
    ///     /* [User(id: 0, name: James), User(id: 3, name: Lisa),
    ///         User(id: 2, name: Mary), User(id: 1, name: Robert)] */
    ///
    @inlinable func sorted<T>(by keyPath: KeyPath<Element, T>, using compare: (T, T) -> Bool) -> [Element] {
        return sorted { compare($0[keyPath: keyPath], $1[keyPath: keyPath]) }
    }
    
    /// Returns the elements of the sequence, sorted using the given predicate as the comparison between some elements.
    ///
    ///     struct User {
    ///         let id: Int
    ///         let name: String
    ///     }
    ///     let users = [
    ///         User(id: 0, name: "James"), User(id: 1, name: "Robert"),
    ///         User(id: 2, name: "Mary"), User(id: 3, name: "Lisa")
    ///     ]
    ///     let sortedUsers = users.sorted(by: \.name)
    ///     /* [User(id: 0, name: James), User(id: 3, name: Lisa),
    ///         User(id: 2, name: Mary), User(id: 1, name: Robert)] */
    ///
    @inlinable func sorted<T: Comparable>(by keyPath: KeyPath<Element, T>) -> [Element] {
        return sorted { $0[keyPath: keyPath] < $1[keyPath: keyPath] }
    }
    
}


extension RandomAccessCollection where Self: MutableCollection {
    
    /// Returns the elements of the sequence, sorted using the given predicate as the comparison between some elements.
    ///
    ///     struct User {
    ///         let id: Int
    ///         let name: String
    ///     }
    ///     var users = [
    ///         User(id: 0, name: "James"), User(id: 1, name: "Robert"),
    ///         User(id: 2, name: "Mary"), User(id: 3, name: "Lisa")
    ///     ]
    ///     users.sort(by: \.name, with: <)
    ///     /* [User(id: 0, name: James), User(id: 3, name: Lisa),
    ///         User(id: 2, name: Mary), User(id: 1, name: Robert)] */
    ///
    @inlinable mutating func sort<T>(by keyPath: KeyPath<Element, T>, using compare: (T, T) -> Bool) {
        sort { compare($0[keyPath: keyPath], $1[keyPath: keyPath]) }
    }
    
}

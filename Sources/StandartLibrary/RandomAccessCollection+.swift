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
    ///     let sortedUsers = users.sorted(by: \.name, with: <)
    ///     /* [User(id: 0, name: James), User(id: 3, name: Lisa),
    ///         User(id: 2, name: Mary), User(id: 1, name: Robert)
    ///     ] */
    ///
    @inlinable func sorted<T>(by keyPath: KeyPath<Element, T>, with compare: (T, T) -> Bool) -> [Element] {
        return sorted { compare($0[keyPath: keyPath], $1[keyPath: keyPath]) }
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
    ///     users.sorted(by: \.name, with: <)
    ///     /* [User(id: 0, name: James), User(id: 3, name: Lisa),
    ///         User(id: 2, name: Mary), User(id: 1, name: Robert)
    ///     ] */
    ///
    @inlinable mutating func sort<T>(by keyPath: KeyPath<Element, T>, with compare: (T, T) -> Bool) {
        sort { compare($0[keyPath: keyPath], $1[keyPath: keyPath]) }
    }
    
}

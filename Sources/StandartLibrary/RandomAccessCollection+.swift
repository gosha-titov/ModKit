public extension RandomAccessCollection {
    
    /// Returns the elements of the sequence, sorted using the given predicate as the comparison between elements.
    ///
    ///     struct User {
    ///         let id: Int
    ///         let name: String
    ///     }
    ///     let users = [
    ///         User(id: 0, name: "James"), User(id: 1, name: "Robert"),
    ///         User(id: 2, name: "Mary"), User(id: 3, name: "Lisa")
    ///     ]
    ///     let sortedUsers = users.sorted(by: \.name) { $0 < $1 }
    ///     /* [User(id: 0, name: James), User(id: 3, name: Lisa),
    ///         User(id: 2, name: Mary), User(id: 1, name: Robert)] */
    ///
    @inlinable @inline(__always)
    func sorted<T>(by keyPath: KeyPath<Element, T>, using compare: (T, T) -> Bool) -> [Element] {
        return sorted { compare($0[keyPath: keyPath], $1[keyPath: keyPath]) }
    }
    
    /// Returns the elements of the sequence, sorted using the given predicate as the comparison between elements.
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
    @inlinable @inline(__always)
    func sorted<T: Comparable>(by keyPath: KeyPath<Element, T>) -> [Element] {
        return sorted { $0[keyPath: keyPath] < $1[keyPath: keyPath] }
    }
    
}


public extension RandomAccessCollection where Self: MutableCollection {
    
    /// Sorts the collection in place, using the given predicate as the comparison between elements.
    ///
    ///     struct User {
    ///         let id: Int
    ///         let name: String
    ///     }
    ///     var users = [
    ///         User(id: 0, name: "James"), User(id: 1, name: "Robert"),
    ///         User(id: 2, name: "Mary"), User(id: 3, name: "Lisa")
    ///     ]
    ///     users.sort(by: \.name) { $0 < $1 }
    ///     /* [User(id: 0, name: James), User(id: 3, name: Lisa),
    ///         User(id: 2, name: Mary), User(id: 1, name: Robert)] */
    ///
    @inlinable @inline(__always)
    mutating func sort<T>(by keyPath: KeyPath<Element, T>, using compare: (T, T) -> Bool) {
        sort { compare($0[keyPath: keyPath], $1[keyPath: keyPath]) }
    }
    
    /// Sorts the collection in place, using the given predicate as the comparison between elements.
    ///
    ///     struct User {
    ///         let id: Int
    ///         let name: String
    ///     }
    ///     var users = [
    ///         User(id: 0, name: "James"), User(id: 1, name: "Robert"),
    ///         User(id: 2, name: "Mary"), User(id: 3, name: "Lisa")
    ///     ]
    ///     users.sort(by: \.name)
    ///     /* [User(id: 0, name: James), User(id: 3, name: Lisa),
    ///         User(id: 2, name: Mary), User(id: 1, name: Robert)] */
    ///
    @inlinable @inline(__always)
    mutating func sort<T: Comparable>(by keyPath: KeyPath<Element, T>) {
        sort { $0[keyPath: keyPath] < $1[keyPath: keyPath] }
    }
    
}

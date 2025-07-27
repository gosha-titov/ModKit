public extension RandomAccessCollection where Self: MutableCollection {
    
    /// Sorts the collection in place, using the value at the specified key path for comparison.
    ///
    ///     struct Person {
    ///         let name: String, age: Int
    ///     }
    ///     var persons = [
    ///         Person(name: "Alice", age: 31),
    ///         Person(name: "James", age: 23),
    ///         Person(name: "Kevin", age: 57)
    ///     ]
    ///     persons.sort(by: \.age, using: > )
    ///     /* [Person(name: "Kevin", age: 57),
    ///         Person(name: "Alice", age: 31),
    ///         Person(name: "James", age: 23)
    ///     ] */
    /// - Parameter keyPath: A key path to a `Comparable` value in `Element`.
    @inlinable @inline(__always)
    mutating func sort<T>(by keyPath: KeyPath<Element, T>, using compare: (T, T) throws -> Bool) rethrows {
        try sort { try compare($0[keyPath: keyPath], $1[keyPath: keyPath]) }
    }
    
    /// Sorts the collection in place, using the value at the specified key path for comparison.
    ///
    ///     struct Person {
    ///         let name: String, age: Int
    ///     }
    ///     var persons = [
    ///         Person(name: "Alice", age: 31),
    ///         Person(name: "James", age: 23),
    ///         Person(name: "Kevin", age: 57)
    ///     ]
    ///     persons.sort(by: \.age)
    ///     /* [Person(name: "James", age: 23),
    ///         Person(name: "Alice", age: 31),
    ///         Person(name: "Kevin", age: 57)
    ///     ] */
    /// - Parameter keyPath: A key path to a `Comparable` value in `Element`.
    @inlinable @inline(__always)
    mutating func sort<T: Comparable>(by keyPath: KeyPath<Element, T>) {
        sort { $0[keyPath: keyPath] < $1[keyPath: keyPath] }
    }
    
}

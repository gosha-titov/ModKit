public extension Sequence {
    
    /// Calls the specified closure on each element that satisfies the given predicate in the sequence in the same order as a `for-in-where` loop.
    ///
    ///     struct Task {
    ///         let title: String
    ///         let isCompleted: Bool
    ///     }
    ///     let tasks = [
    ///         Task(title: "Design layout", isCompleted: true),
    ///         Task(title: "Implement feature", isCompleted: false),
    ///         Task(title: "Fix bugs", isCompleted: true)
    ///     ]
    ///     tasks.forEach(where: \.isCompleted) {
    ///         print("Completed: \($0.title)")
    ///     }
    ///     // Prints "Completed: Design layout"
    ///     // Prints "Completed: Fix bugs"
    ///
    /// - Parameter isIncluded: A closure that takes an element of the sequence as its argument
    ///   and returns a Boolean value indicating whether the element should be included.
    /// - Parameter body: A closure that takes an element of the sequence as a parameter.
    @inlinable @inline(__always)
    func forEach(where isIncluded: (Element) throws -> Bool, body: (Element) throws -> Void) rethrows {
        try forEach { if try isIncluded($0) { try body($0) } }
    }
    
    /// Returns an array containing, in order, the elements of the sequence that do not satisfy the given predicate.
    ///
    ///     let inputNames = ["Mia", "Emma", "", "Luna"]
    ///     let validNames = inputNames.except(where: \.isEmpty)
    ///     // ["Mia", "Emma", "Luna"]
    ///
    /// - Parameter shouldBeExcluded: A closure that takes an element of the sequence as its argument
    ///   and returns a Boolean value indicating whether the element should be excluded from the returned array.
    /// - Returns: An array of elements that do not satisfy the predicate.
    @inlinable @inline(__always)
    func except(where shouldBeExcluded: (Element) throws -> Bool) rethrows -> [Element] {
        return try filter { try !shouldBeExcluded($0) }
    }
    
    
    /// Returns the elements of the sequence, sorted using the value at the specified key path for comparison.
    ///
    ///     struct Person {
    ///         let name: String, age: Int
    ///     }
    ///     let persons = [
    ///         Person(name: "Alice", age: 31),
    ///         Person(name: "James", age: 23),
    ///         Person(name: "Kevin", age: 57)
    ///     ]
    ///     persons.sorted(by: \.age, using: > )
    ///     /* [Person(name: "Kevin", age: 57),
    ///         Person(name: "Alice", age: 31),
    ///         Person(name: "James", age: 23)
    ///     ] */
    /// - Parameter keyPath: A key path to a `Comparable` value in `Element`.
    /// - Parameter areInIncreasingOrder: A predicate that returns `true`
    ///   if its first argument should be ordered before its second argument; otherwise, `false`.
    func sorted<T>(by keyPath: KeyPath<Element, T>, using areInIncreasingOrder: (T, T) throws -> Bool) rethrows -> [Element] {
        return try sorted { try areInIncreasingOrder($0[keyPath: keyPath], $1[keyPath: keyPath]) }
    }
    
    /// Returns the elements of the sequence, sorted using the value at the specified key path for comparison.
    ///
    ///     struct Person {
    ///         let name: String, age: Int
    ///     }
    ///     let persons = [
    ///         Person(name: "Alice", age: 31),
    ///         Person(name: "James", age: 23),
    ///         Person(name: "Kevin", age: 57)
    ///     ]
    ///     let sortedPersons = persons.sorted(by: \.age)
    ///     /* [Person(name: "James", age: 23),
    ///         Person(name: "Alice", age: 31),
    ///         Person(name: "Kevin", age: 57)
    ///     ] */
    /// - Parameter keyPath: A key path to a `Comparable` value in `Element`.
    /// - Returns: A sorted array of the sequence’s elements.
    @inlinable @inline(__always)
    func sorted<T: Comparable>(by keyPath: KeyPath<Element, T>) -> [Element] {
        return sorted { $0[keyPath: keyPath] < $1[keyPath: keyPath] }
    }
    
    /// Returns the maximum element in the sequence, using the value at the specified key path for comparison.
    ///
    ///     struct Person {
    ///         let name: String, age: Int
    ///     }
    ///     let persons = [
    ///         Person(name: "Alice", age: 31),
    ///         Person(name: "James", age: 23),
    ///         Person(name: "Kevin", age: 57)
    ///     ]
    ///     let oldestPerson = persons.max(by: \.age)
    ///     // Person(name: "Kevin", age: 57)
    ///
    /// - Parameter keyPath: A key path to a `Comparable` value in `Element`.
    /// - Returns: The sequence’s maximum element if the sequence is not empty; otherwise, `nil`.
    @inlinable @inline(__always)
    func max<T: Comparable>(by keyPath: KeyPath<Element, T>) -> Element? {
        return self.max { $0[keyPath: keyPath] < $1[keyPath: keyPath] }
    }
    
    /// Returns the minimum element in the sequence, using the value at the specified key path for comparison.
    ///
    ///     struct Person {
    ///         let name: String, age: Int
    ///     }
    ///     let persons = [
    ///         Person(name: "Alice", age: 31),
    ///         Person(name: "James", age: 23),
    ///         Person(name: "Kevin", age: 57)
    ///     ]
    ///     let youngestPerson = persons.min(by: \.age)
    ///     // Person(name: "James", age: 23)
    ///
    /// - Parameter keyPath: A key path to a `Comparable` value in `Element`.
    /// - Returns: The sequence’s maximum element if the sequence is not empty; otherwise, `nil`.
    @inlinable @inline(__always)
    func min<T: Comparable>(by keyPath: KeyPath<Element, T>) -> Element? {
        return self.min { $0[keyPath: keyPath] < $1[keyPath: keyPath] }
    }
    
    
    /// Returns a string by converting the elements of the sequence to strings and concatenating them, adding the given separator between each element.
    ///
    ///     [1.2, 3.4, 5.6].toString(separatedBy: " ") // "1.2 3.4 5.6"
    ///     [1, 2, 3, 4].toString(separatedBy: " → ") // "1 → 2 → 3 → 4"
    ///
    /// - Parameter separator: A string to insert between each of the elements in this sequence.
    @inlinable @inline(__always)
    func toString(separatedBy separator: String) -> String {
        return map { String(describing: $0) }.joined(separator: separator)
    }
    
    /// Returns an array that contains all elements of the sequence.
    ///
    ///     let set: Set = [1, 2, 3]
    ///     set.toArray() // [1, 3, 2]
    ///
    @inlinable @inline(__always)
    func toArray() -> Array<Element> {
        return Array(self)
    }
    
}


public extension Sequence where Element: Hashable {
    
    /// Returns a set that contains unique elements of the sequence.
    ///
    ///     let array = [1, 2, 3, 2]
    ///     array.toSet() // [1, 2, 3]
    ///
    @inlinable @inline(__always)
    func toSet() -> Set<Element> {
        return Set(self)
    }
    
}


public extension Sequence where Element: Numeric {
    
    /// Returns the result of summing all the elements of the sequence.
    ///
    ///     let numbers = [3, 5, 7]
    ///     numbers.sum() // 15
    ///
    @inlinable @inline(__always)
    func sum() -> Element {
        return reduce(0, +)
    }
    
}

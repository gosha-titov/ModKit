public extension Set {
    
    /// Creates a set that has no elements.
    @inlinable @inline(__always)
    static var empty: Self { [] }
    
    
    // MARK: Methods
    
    /// Finds, removes and returns the elements that satisfy the given predicate.
    ///
    ///     var sourceNumbers: Set = [0, 1, 2, 3, 4, 5]
    ///     let evenNumbers = sourceNumbers.extract { $0 % 2 == 0 }
    ///     print(sourceNumbers) // [1, 3, 5]
    ///     print(evenNumbers) // [0, 2, 4]
    ///
    @inlinable @inline(__always)
    mutating func extract(_ isExtracted: (Element) -> Bool) -> Self {
        let extractedElements = filter(isExtracted)
        subtract(extractedElements)
        return extractedElements
    }
    
    
    /// Inserts the specified elements in the set if they are not already present.
    ///
    ///     var set: Set = [0, 1]
    ///     set.insert(contentsOf: [2, 3]) // [0, 1, 2, 3]
    ///
    @inlinable @inline(__always)
    mutating func insert<S: Sequence>(contentsOf newElements: S) where S.Element == Element {
        self = union(newElements)
    }
    
    /// Returns a new set with the specified element inserted.
    ///
    ///     let set: Set = [0, 1]
    ///     set.inserting(2) // [0, 1, 2]
    ///
    @inlinable @inline(__always)
    func inserting(_ newElement: Element) -> Self {
        return mutating(self) { $0.insert(newElement) }
    }
    
    /// Returns a new set with the specified elements inserted.
    ///
    ///     let set: Set = [0, 1]
    ///     set.inserting(contentsOf: [2, 3]) // [0, 1, 2, 3]
    ///
    @inlinable @inline(__always)
    func inserting<S: Sequence>(contentsOf newElements: S) -> Self where S.Element == Element {
        return union(newElements)
    }
    
    
    /// Removes the specified elements from the set.
    ///
    ///     var set: Set = [0, 1, 2, 3]
    ///     set.remove(contentsOf: [2, 3]) // [0, 1]
    ///
    @inlinable @inline(__always)
    mutating func remove<S: Sequence>(contentsOf oldElements: S) where S.Element == Element {
        self = subtracting(oldElements)
    }
    
    /// Returns a new set with the specified element removed.
    ///
    ///     let set: Set = [0, 1, 2, 3]
    ///     set.removing(2) // Prints [0, 1, 3]
    ///
    @inlinable @inline(__always)
    func removing(_ oldElement: Element) -> Self {
        return mutating(self) { $0.remove(oldElement) }
    }
    
    /// Returns a new set with the specified elements removed.
    ///
    ///     let set: Set = [0, 1, 2, 3]
    ///     set.removing(contentsOf: [2, 3]) // [0, 1]
    ///
    @inlinable @inline(__always)
    func removing<S: Sequence>(contentsOf oldElements: S) -> Self where S.Element == Element {
        return subtracting(oldElements)
    }
    
}

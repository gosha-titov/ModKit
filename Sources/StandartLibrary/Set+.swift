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
    mutating func extract(_ isExtracted: (Element) -> Bool) -> Set<Element> {
        let extractedElements = filter(isExtracted)
        self = subtracting(extractedElements)
        return extractedElements
    }
    
    
    /// Inserts the specified elements in the set if they are not already present.
    ///
    ///     var set: Set = [0, 1]
    ///     set.insert([2, 3]) // [0, 1, 2, 3]
    ///     
    @inlinable @inline(__always)
    mutating func insert(_ newElements: any Sequence<Element>) {
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
    ///     set.inserting([2, 3]) // [0, 1, 2, 3]
    ///
    @inlinable @inline(__always)
    func inserting(_ newElements: any Sequence<Element>) -> Self {
        return union(newElements)
    }
    
    
    /// Removes the specified elements from the set.
    ///
    ///     var set: Set = [0, 1, 2, 3]
    ///     set.remove([2, 3]) // [0, 1]
    ///
    @inlinable @inline(__always)
    mutating func remove(_ oldElements: any Sequence<Element>) {
        self = subtracting(oldElements)
    }
    
    /// Returns a new set with the specified elements removed.
    ///
    ///     let set: Set = [0, 1, 2, 3]
    ///     set.removing([2, 3]) // [0, 1]
    ///
    @inlinable @inline(__always)
    func removing(_ oldElements: any Sequence<Element>) -> Self {
        return subtracting(oldElements)
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
    
}

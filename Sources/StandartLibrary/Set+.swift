public extension Set {
    
    /// Creates a set that has no elements.
    @inlinable static var empty: Self { [] }
    
    
    // MARK: Methods
    
    /// Inserts the specified elements in the set if they are not already present.
    ///
    ///     var set: Set<Int> = [0, 1]
    ///     set.insert([2, 3]) // [0, 1, 2, 3]
    @inlinable mutating func insert(_ newElements: any Sequence<Element>) {
        newElements.forEach { insert($0) }
    }
    
    /// Returns a new set with the specified element inserted.
    ///
    ///     let set: Set<Int> = [0, 1]
    ///     set.inserting(2) // [0, 1, 2]
    ///
    @inlinable func inserting(_ newElement: Element) -> Self {
        return mutating(self) { $0.insert(newElement) }
    }
    
    /// Returns a new set with the specified elements inserted.
    ///
    ///     let set: Set<Int> = [0, 1]
    ///     set.inserting([2, 3]) // [0, 1, 2, 3]
    ///
    @inlinable func inserting(_ newElements: any Sequence<Element>) -> Self {
        return union(newElements)
    }
    
    
    /// Removes the specified elements from the set.
    ///
    ///     var set: Set<Int> = [0, 1, 2, 3]
    ///     set.remove([2, 3]) // [0, 1]
    ///
    @inlinable mutating func remove(_ oldElements: any Sequence<Element>) {
        self = subtracting(oldElements)
    }
    
    /// Returns a new set with the specified elements removed.
    ///
    ///     let set: Set<Int> = [0, 1, 2, 3]
    ///     set.removing([2, 3]) // [0, 1]
    ///
    @inlinable func removing(_ oldElements: any Sequence<Element>) -> Self {
        return subtracting(oldElements)
    }
    
    /// Returns a new set with the specified element removed.
    ///
    ///     let set: Set<Int> = [0, 1, 2, 3]
    ///     set.removing(2) // Prints [0, 1, 3]
    ///
    @inlinable func removing(_ oldElement: Element) -> Self {
        return mutating(self) { $0.remove(oldElement) }
    }
    
}

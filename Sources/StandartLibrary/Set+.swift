public extension Set {
    
    /// Creates a set that has no elements.
    ///
    /// It's often used when you need to specify the empty set as an argument:
    ///
    ///     let c = Configuration(parameters: .empty)
    ///
    @inlinable static var empty: Self { [] }
    
    /// Returns a new set with the specified element inserted.
    ///
    ///     let set: Set<Int> = [0, 1]
    ///     print(set.inserting(2))
    ///     // Prints [0, 1, 2]
    ///
    @inlinable func inserting(_ element: Element) -> Self {
        var mutableSelf = self
        mutableSelf.insert(element)
        return mutableSelf
    }
    
    /// Returns a new set with the specified elements inserted.
    ///
    ///     let set: Set<Int> = [0, 1]
    ///     print(set.inserting([2, 3]))
    ///     // Prints [0, 1, 2, 3]
    ///
    @inlinable func inserting(_ elements: [Element]) -> Self {
        return union(elements)
    }
    
    /// Removes the specified elements from the set.
    ///
    ///     var set: Set<Int> = [0, 1, 2, 3]
    ///     set.remove([2, 3])
    ///     print(set)
    ///     // Prints [0, 1]
    ///
    @inlinable mutating func remove(_ elements: [Element]) -> Void {
        self = subtracting(elements)
    }
    
    /// Returns a new set with the specified elements removed.
    ///
    ///     var set: Set<Int> = [0, 1, 2, 3]
    ///     print(set.removing([2, 3]))
    ///     // Prints [0, 1]
    ///
    @inlinable func removing(_ elements: [Element]) -> Self {
        return subtracting(elements)
    }
    
    /// Returns a new set with the specified element removed.
    ///
    ///     var set: Set<Int> = [0, 1, 2, 3]
    ///     print(set.removing(2))
    ///     // Prints [0, 1, 3]
    ///
    @inlinable func removing(_ element: Element) -> Self {
        var mutableSelf = self
        mutableSelf.remove(element)
        return mutableSelf
    }
    
}

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
        var mutableSelf = self
        for element in elements {
            mutableSelf.insert(element)
        }
        return mutableSelf
    }
    
}

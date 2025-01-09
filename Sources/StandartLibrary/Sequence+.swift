public extension Sequence {
    
    /// Calls the specified closure on each element satisfying the given predicate in the sequence in the same order as a for-in-where loop.
    ///
    ///     let array = [0, 1, 2, 3, 4, 5]
    ///     array.forEach(where: { $0 % 2 == 0 }) {
    ///         print($0)
    ///     )
    ///     // Prints "0, 2, 4"
    ///
    @inlinable func forEach(where isIncluded: (Element) throws -> Bool, body: (Element) throws -> Void) rethrows {
        try lazy.filter(isIncluded).forEach(body)
    }
    
}


public extension Sequence where Element: Comparable {
    
    /// Returns the first element of the sequence except the specified ones; otherwise, `nil` if there is no available element.
    ///
    ///     let availableNumbers = 1...10
    ///     let usedNumbers = [1, 2, 4, 5]
    ///     let freeNumber = availableNumbers.first(
    ///         excluding: usedNumbers
    ///     )
    ///     // Optional(3)
    ///
    @inlinable func first(excluding excludedElements: any Sequence<Element>) -> Element? {
        return first { !excludedElements.contains($0) }
    }
    
}

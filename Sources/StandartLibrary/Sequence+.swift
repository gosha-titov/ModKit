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

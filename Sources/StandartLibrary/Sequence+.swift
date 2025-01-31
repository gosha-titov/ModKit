public extension Sequence {
    
    /// Calls the specified closure on each element that satisfies the given predicate in the sequence in the same order as a `for-in-where` loop.
    ///
    ///     let array = [0, 1, 2, 3, 4, 5]
    ///     array.forEach(where: { $0 % 2 == 0 }) {
    ///         print($0)
    ///     )
    ///     // Prints "0, 2, 4"
    ///
    @inlinable @inline(__always)
    func forEach(where isIncluded: (Element) throws -> Bool, body: (Element) throws -> Void) rethrows {
        try lazy.filter(isIncluded).forEach(body)
    }
    
    /// Returns an array containing, in order, the elements of the sequence except for the ones that satisfy the given predicate.
    ///
    /// This method is mainly used in cases when you want to specify the key path but you can't use it with the `!` unary operator.
    ///
    ///     let sourceNames = ["Mia", "Emma", "", "Luna"]
    ///     let names = sourceNames.except(where: \.isEmpty)
    ///     // ["Mia", "Emma", "Luna"]
    ///
    ///     // This is the same as the above
    ///     let names = sourceNames.filter { !$0.isEmpty }
    ///
    /// - Parameter isNotIncluded: A closure that takes an element of the sequence as its argument
    ///   and returns a Boolean value indicating whether the element should not be included in the returned array.
    @inlinable @inline(__always)
    func except(where isNotIncluded: (Element) throws -> Bool) rethrows -> [Element] {
        return try lazy.filter { try !isNotIncluded($0) }
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
    @inlinable @inline(__always)
    func first(excluding excludedElements: any Sequence<Element>) -> Element? {
        return first { !excludedElements.contains($0) }
    }
    
}

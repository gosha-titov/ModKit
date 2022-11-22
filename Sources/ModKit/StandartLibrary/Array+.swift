public extension Array {
    
    /// Returns an array containing all elements but an element was rearranged from one specific position to another.
    ///
    ///     let array = [0, 1, 2, 3]
    ///     array.rearrangedElement(from: 3, to: 1) // [0, 3, 1, 2]
    ///
    func rearrangedElement(from indexToRemove: Int, to indexToInsert: Int) -> [Element] {
        var array = self
        let element = array.remove(at: indexToRemove)
        array.insert(element, at: indexToInsert)
        return array
    }
    
    /// Rearranges an element from one specific position to another.
    ///
    ///     var array = [0, 1, 2, 3]
    ///     array.rearrangeElement(from: 3, to: 1) // [0, 3, 1, 2]
    ///
    mutating func rearrangeElement(from indexToRemove: Int, to indexToInsert: Int) -> Void {
        self = rearrangedElement(from: indexToRemove, to: indexToInsert)
    }
    
    /// Returns the first K elements of this array.
    ///
    ///     let arr = [1, 2, 3, 4, 5]
    ///     arr.first(3) // [1, 2, 3]
    ///
    func first(_ k: Int) -> [Element] {
        let k = k > count ? count : k
        var first = [Element]()
        for i in 0..<k {
            first.append(self[i])
        }
        return first
    }
    
    /// Returns the last K elements of this array.
    ///
    ///     let arr = [1, 2, 3, 4, 5]
    ///     arr.last(3) // [3, 4, 5]
    ///
    func last(_ k: Int) -> [Element] {
        let k = k > count ? count : k
        var last = [Element]()
        for i in (count - k)..<count {
            last.append(self[i])
        }
        return last
    }
    
}


public extension Array where Element: Equatable {
    
    /// Returns an array containing all but the given elements.
    ///
    ///     let array = [1, 2, 3, 2, 4]
    ///     array.removed([2, 4]) // [1, 3]
    ///
    func removed(_ elements: [Element]) -> [Element] {
        return filter { !elements.contains($0) }
    }
    
    /// Removes the given elements from the array.
    ///
    ///     var array = [1, 2, 3, 2, 4]
    ///     array.remove([2, 4]) // [1, 3]
    ///
    mutating func remove(_ elements: [Element]) -> Void {
        self = removed(elements)
    }
    
    /// Returns an array containing all but duplicates, leaving only the first element of them.
    ///
    ///     let array = [1, 2, 3, 2, 4, 4, 5, 4]
    ///     array.removedDuplicates() // [1, 2, 3, 4, 5]
    ///
    func removedDuplicates() -> [Element] {
        var result = [Element]()
        forEach { if !result.contains($0) { result.append($0) } }
        return result
    }
    
    /// Removes all duplicate elements, leaving only the first element of them.
    ///
    ///     var array = [1, 2, 3, 2, 4, 4, 5, 4]
    ///     array.removeDuplicates() // [1, 2, 3, 4, 5]
    ///
    mutating func removeDuplicates() -> Void {
        self = removedDuplicates()
    }
    
    /// Returns a `Boolean` value that indicates whether the sequence contains all the given elements.
    ///
    ///     let array = [3, 1, 4, 1, 5]
    ///     array.contains([5, 4, 6]) // false
    ///     array.contains([5, 4])    // true
    ///
    /// - Parameter elements: The elements to find in the sequence.
    /// - Returns: `true` if all elements were found in the sequence; otherwise, `false`.
    ///
    func contains(_ elements: [Element]) -> Bool {
        for element in elements {
            guard contains(element) else { return false }
        }
        return true
    }
    
    /// Returns an array containing all indexes of the given element.
    ///
    ///     let arr = [5, 2, 1, 6, 2]
    ///     arr.indexes(of: 2) // [1, 4]
    ///
    func indexes(of element: Element) -> [Int] {
        return enumerated().filter { $0.element == element }.map { $0.offset }
    }
    
}


public extension Array where Element: Numeric {
    
    /// Returns the result of summing the elements of the sequence.
    ///
    ///     let arr = [3, 5, 7]
    ///     arr.sum // 15
    ///
    var sum: Element { reduce(0, +) }
    
}


public extension Array where Element: LosslessStringConvertible {
    
    /// Returns a string by converting the elements of the sequence to strings and concatenating them, adding the given separator between each element.
    ///
    ///     [1.2, 3.4, 5.6].toString(separator: " ") // "1.2 3.4 5.6"
    ///     [1, 2, 3].toString(separator: ", ") // "1, 2, 3"
    ///
    /// - Parameter separator: A string to insert between each of the elements in this sequence. The default separator is an empty string.
    ///
    func toString(separator: String = "") -> String {
        return map { String($0) }.joined(separator: separator)
    }
    
}

public extension Array {
    
    /// Creates an array that has no elements.
    @inlinable static var empty: Self { [] }
    
    
    // MARK: Methods
    
    /// Returns a new array containing all elements but an element was rearranged from one specific position to another.
    ///
    ///     let array = ["a", "b", "c", "d"]
    ///     array.rearrangingElement(from: 3, to: 1) // ["a", "d", "b", "c"]
    ///
    @inlinable func rearrangingElement(from indexToRemove: Int, to indexToInsert: Int) -> Self {
        return mutating(self) { $0.rearrangeElement(from: indexToRemove, to: indexToInsert) }
    }
    
    /// Rearranges an element from one specific position to another.
    ///
    ///     var array = ["a", "b", "c", "d"]
    ///     array.rearrangeElement(from: 3, to: 1) // ["a", "d", "b", "c"]
    ///
    @inlinable mutating func rearrangeElement(from indexToRemove: Int, to indexToInsert: Int) {
        let element = remove(at: indexToRemove)
        insert(element, at: indexToInsert)
    }
    
    
    /// Adds the elements of a sequence to the end of the array.
    ///
    ///     var array = [0, 1]
    ///     array.append([2, 3]) // [0, 1, 2, 3]
    ///
    @inlinable mutating func append(_ newElements: any Sequence<Element>) {
        append(contentsOf: newElements)
    }
    
    /// Returns a new array with the specified element appended.
    ///
    ///     let array = [0, 1]
    ///     array.appending(2) // [0, 1, 2]
    ///
    @inlinable func appending(_ newElement: Element) -> Self {
        return mutating(self) { $0.append(newElement) }
    }
    
    /// Returns a new array with the elements of the specified sequence added to the end of the array.
    ///
    ///     let array = [0, 1]
    ///     array.appending([2, 3]) // [0, 1, 2, 3]
    ///
    @inlinable func appending(_ newElements: any Sequence<Element>) -> Self {
        return mutating(self) { $0.append(newElements) }
    }
    
    
    /// Adds a new element at the beginning of the array.
    ///
    ///     var array = [1, 2, 3]
    ///     array.prepend(0) // [0, 1, 2, 3]
    ///
    @inlinable mutating func prepend(_ newElement: Element) {
        insert(newElement, at: .zero)
    }
    
    /// Adds the elements of a sequence to the beginning of the array.
    ///
    ///     var array = [2, 3]
    ///     array.prepend([0, 1]) // [0, 1, 2, 3]
    ///
    @inlinable mutating func prepend(_ newElements: any Collection<Element>) {
        insert(contentsOf: newElements, at: .zero)
    }
    
    /// Returns a new array with the specified element added at the beginning of the array.
    ///
    ///     var array = [1, 2, 3]
    ///     array.prepend(0) // [0, 1, 2, 3]
    ///
    @inlinable func prepending(_ newElement: Element) -> Self {
        return mutating(self) { $0.prepend(newElement) }
    }
    
    /// Returns a new array with the specified elements of a sequence added to the beginning of the array.
    ///
    ///     let array = [2, 3]
    ///     array.prepending([0, 1]) // [0, 1, 2, 3]
    ///
    @inlinable mutating func prepending(_ newElements: any Collection<Element>) -> Self {
        return mutating(self) { $0.prepend(newElements) }
    }
    
    
    /// Returns the first K elements of this array.
    ///
    ///     let arr = [1, 2, 3, 4, 5]
    ///     arr.first(3) // [1, 2, 3]
    ///
    @inlinable func first(_ k: Int) -> Self {
        guard k > 0 else { return .empty }
        let k = k.clamped(to: 0...count)
        return Array(self[0..<k])
    }
    
    /// Returns the last K elements of this array.
    ///
    ///     let arr = [1, 2, 3, 4, 5]
    ///     arr.last(3) // [3, 4, 5]
    ///
    @inlinable func last(_ k: Int) -> Self {
        guard k > 0 else { return .empty }
        let k = k.clamped(to: 0...count)
        return Array(self[(count - k)..<count])
    }
    
}


public extension Array where Element: Equatable {
    
    /// Returns a new array containing all but the specified elements.
    ///
    ///     let array = [1, 2, 3, 2, 4]
    ///     array.removingAll(contentsOf: [2, 4]) // [1, 3]
    ///
    @inlinable func removing(_ oldElements: any Sequence<Element>) -> Self {
        return mutating(self) { $0.remove(oldElements) }
    }
    
    /// Returns a new array containing all but the specified element.
    ///
    ///     let array = [1, 2, 3, 2, 4]
    ///     array.removing(2) // [1, 3, 4]
    ///
    @inlinable func removing(_ oldElement: Element) -> Self {
        return mutating(self) { $0.remove(oldElement) }
    }
    
    /// Removes all the specified elements from the array.
    ///
    ///     var array = [1, 2, 3, 2, 4]
    ///     array.removeAll(contentsOf: [2, 4]) // [1, 3]
    ///
    @inlinable mutating func remove(_ oldElements: any Sequence<Element>) {
        removeAll(where: { oldElements.contains($0) })
    }
    
    /// Removes all the elements equal to the specified one from the array.
    ///
    ///     var array = [1, 2, 3, 2, 4]
    ///     array.removeAll(2) // [1, 3, 4]
    ///
    @inlinable mutating func remove(_ oldElement: Element) {
        removeAll(where: { $0 == oldElement })
    }
    
    
    /// Returns a new array containing all but duplicates, leaving only the first element of them.
    ///
    ///     let array = [1, 2, 3, 2, 4, 4, 5, 4]
    ///     array.removingDuplicates() // [1, 2, 3, 4, 5]
    ///
    @inlinable func removingDuplicates() -> Self {
        return reduce(into: .empty) { result, element in
            if result.contains(element) == false {
                result.append(element)
            }
        }
    }
    
    /// Removes all duplicate elements, leaving only the first element of them.
    ///
    ///     var array = [1, 2, 3, 2, 4, 4, 5, 4]
    ///     array.removeDuplicates() // [1, 2, 3, 4, 5]
    ///
    @inlinable mutating func removeDuplicates() {
        self = removingDuplicates()
    }
    
    
    /// Returns a Boolean value that indicates whether the sequence contains all the given elements.
    ///
    ///     let array = [3, 1, 4, 1, 5]
    ///     array.containsAll([5, 4, 6]) // false
    ///     array.containsAll([5, 4])    // true
    ///
    /// - Parameter elements: The elements to find in the sequence.
    /// - Returns: `True` if all elements were found in the sequence; otherwise, `false`.
    @inlinable func containsAll(_ elements: any Sequence<Element>) -> Bool {
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
    @inlinable func indexes(of element: Element) -> [Int] {
        return enumerated()
            .filter { $0.element == element }
            .map(\.offset)
    }
    

    // MARK: Subscripts
    
    @inlinable subscript(safe offset: Int) -> Element? {
        guard (0..<count).contains(offset) else { return nil }
        return self[offset]
    }
    
}


public extension Array where Element: AnyObject {
    
    /// Returns a new array containing all but the given reference-type objects.
    ///
    ///     let array = [t1, t2, t3, t2, t4]
    ///     array.removingReferences([t2, t4]) // [t1, t3]
    ///
    @inlinable func removingReferences(_ objects: [Element]) -> Self {
        return filter { sourceObject in
            !objects.contains { removedObject in
                sourceObject === removedObject
            }
        }
    }
    
    /// Removes the given reference-type objects from the array.
    ///
    ///     var array = [t1, t2, t3, t2, t4]
    ///     array.removeReferences([t2, t4]) // [t1, t3]
    ///
    @inlinable mutating func removeReferences(_ objects: [Element]) {
        self = removingReferences(objects)
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
    /// - Parameter separator: A string to insert between each of the elements in this sequence.
    @inlinable func toString(separator: String) -> String {
        return map { String($0) }.joined(separator: separator)
    }
    
}


public extension Array where Element == Character {
    
    /// A string that contains all characters of this array.
    ///
    ///     let array = [Character("H"), Character("i"), Character("!")]
    ///     array.toString() // "Hi!"
    ///
    @inlinable func toString() -> String {
        return reduce("") { $0.appending($1) }
    }
    
}

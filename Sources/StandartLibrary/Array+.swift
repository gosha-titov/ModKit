public extension Array {
    
    /// Creates an array that has no elements.
    @inlinable @inline(__always)
    static var empty: Self { [] }
    
    
    // MARK: Methods
    
    /// Finds, removes and returns the elements that satisfy the given predicate.
    ///
    ///     var sourceNumbers = [0, 1, 2, 3, 4, 5]
    ///     let evenNumbers = sourceNumbers.extract { $0 % 2 == 0 }
    ///     print(sourceNumbers) // [1, 3, 5]
    ///     print(evenNumbers) // [0, 2, 4]
    ///
    @inlinable @inline(__always)
    mutating func extract(_ isExtracted: (Element) -> Bool) -> [Element] {
        let extractedElements = filter(isExtracted)
        removeAll(where: isExtracted)
        return extractedElements
    }
    
    
    /// Rearranges an element from one specific position to another.
    ///
    ///     var array = ["a", "b", "c", "d"]
    ///     array.rearrangeElement(from: 3, to: 1) // ["a", "d", "b", "c"]
    ///
    @inlinable @inline(__always)
    mutating func rearrangeElement(from indexToRemove: Index, to indexToInsert: Index) {
        let element = remove(at: indexToRemove)
        insert(element, at: indexToInsert)
    }
    
    /// Returns a new array containing all elements but an element was rearranged from one specific position to another.
    ///
    ///     let array = ["a", "b", "c", "d"]
    ///     array.rearrangingElement(from: 3, to: 1) // ["a", "d", "b", "c"]
    ///
    @inlinable @inline(__always)
    func rearrangingElement(from indexToRemove: Index, to indexToInsert: Index) -> Self {
        return mutating(self) { $0.rearrangeElement(from: indexToRemove, to: indexToInsert) }
    }
    
    
    /// Returns a new array with the specified element appended.
    ///
    ///     let array = [0, 1]
    ///     array.appending(2) // [0, 1, 2]
    ///
    @inlinable @inline(__always)
    func appending(_ newElement: Element) -> Self {
        return mutating(self) { $0.append(newElement) }
    }
    
    /// Returns a new array with the elements of the specified sequence added to the end of the array.
    ///
    ///     let array = [0, 1]
    ///     array.appending(contentsOf: [2, 3]) // [0, 1, 2, 3]
    ///
    @inlinable @inline(__always)
    func appending(contentsOf newElements: any Sequence<Element>) -> Self {
        return mutating(self) { $0.append(contentsOf: newElements) }
    }
    
    
    /// Adds a new element at the beginning of the array.
    ///
    ///     var array = [1, 2, 3]
    ///     array.prepend(0) // [0, 1, 2, 3]
    ///
    @inlinable @inline(__always)
    mutating func prepend(_ newElement: Element) {
        insert(newElement, at: .zero)
    }
    
    /// Adds the elements of a sequence to the beginning of the array.
    ///
    ///     var array = [2, 3]
    ///     array.prepend(contentsOf: [0, 1]) // [0, 1, 2, 3]
    ///
    @inlinable @inline(__always)
    mutating func prepend(contentsOf newElements: any Collection<Element>) {
        insert(contentsOf: newElements, at: .zero)
    }
    
    /// Returns a new array with the specified element added at the beginning of the array.
    ///
    ///     var array = [1, 2, 3]
    ///     array.prepend(0) // [0, 1, 2, 3]
    ///
    @inlinable @inline(__always)
    func prepending(_ newElement: Element) -> Self {
        return mutating(self) { $0.prepend(newElement) }
    }
    
    /// Returns a new array with the specified elements of a sequence added to the beginning of the array.
    ///
    ///     let array = [2, 3]
    ///     array.prepending(contentsOf: [0, 1]) // [0, 1, 2, 3]
    ///
    @inlinable @inline(__always)
    func prepending(contentsOf newElements: any Collection<Element>) -> Self {
        return mutating(self) { $0.prepend(contentsOf: newElements) }
    }
    
    
    /// Returns a new array with an element at the specified index updated to a new one.
    ///
    ///     let array = ["a", "b", "c"]
    ///     array.updating(to: "m", at: 1) // ["a", "m", "c"]
    ///
    @inlinable @inline(__always)
    func updating(to newElement: Element, at index: Index) -> Self {
        return mutating(self) { $0[index] = newElement }
    }
    
    
    /// Returns the first K elements of this array.
    ///
    ///     let arr = [1, 2, 3, 4, 5]
    ///     arr.first(3) // [1, 2, 3]
    ///
    @inlinable @inline(__always)
    func first(_ k: Int) -> Self {
        guard k > 0 else { return .empty }
        let k = k.clamped(to: 0...count)
        return Array(self[0..<k])
    }
    
    /// Returns the last K elements of this array.
    ///
    ///     let arr = [1, 2, 3, 4, 5]
    ///     arr.last(3) // [3, 4, 5]
    ///
    @inlinable @inline(__always)
    func last(_ k: Int) -> Self {
        guard k > 0 else { return .empty }
        let k = k.clamped(to: 0...count)
        return Array(self[(count - k)..<count])
    }
    
}


public extension Array where Element: Equatable {
    
    /// Removes all the elements equal to the specified one from the array.
    ///
    ///     var array = [1, 2, 3, 2, 4]
    ///     array.remove(2) // [1, 3, 4]
    ///
    @inlinable @inline(__always)
    mutating func remove(_ oldElement: Element) {
        removeAll(where: { $0 == oldElement })
    }
    
    /// Removes all the specified elements from the array.
    ///
    ///     var array = [1, 2, 3, 2, 4]
    ///     array.remove(contentsOf: [2, 4]) // [1, 3]
    ///
    @inlinable @inline(__always)
    mutating func remove(contentsOf oldElements: any Sequence<Element>) {
        removeAll(where: { oldElements.contains($0) })
    }
    
    /// Returns a new array containing all but the specified element.
    ///
    ///     let array = [1, 2, 3, 2, 4]
    ///     array.removing(2) // [1, 3, 4]
    ///
    @inlinable @inline(__always)
    func removing(_ oldElement: Element) -> Self {
        return mutating(self) { $0.remove(oldElement) }
    }
    
    /// Returns a new array containing all but the specified elements.
    ///
    ///     let array = [1, 2, 3, 2, 4]
    ///     array.removing(contentsOf: [2, 4]) // [1, 3]
    ///
    @inlinable @inline(__always)
    func removing(contentsOf oldElements: any Sequence<Element>) -> Self {
        return mutating(self) { $0.remove(contentsOf: oldElements) }
    }
    
    
    /// Returns a new array containing all but duplicates, leaving only the first element of them.
    ///
    ///     let array = [1, 2, 3, 2, 4, 4, 5, 4]
    ///     array.removingDuplicates() // [1, 2, 3, 4, 5]
    ///
    @inlinable @inline(__always)
    func removingDuplicates() -> Self {
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
    @inlinable @inline(__always)
    mutating func removeDuplicates() {
        self = removingDuplicates()
    }
    
    
    /// Returns a Boolean value that indicates whether the sequence contains all the given elements.
    ///
    ///     let array = [3, 1, 4, 1, 5]
    ///     array.contains(contentsOf: [5, 4, 6]) // false
    ///     array.contains(contentsOf: [5, 4])    // true
    ///
    /// - Parameter elements: The elements to find in the sequence.
    /// - Returns: `True` if all elements were found in the sequence; otherwise, `false`.
    @inlinable @inline(__always)
    func contains(contentsOf elements: any Sequence<Element>) -> Bool {
        for element in elements {
            guard contains(element) else { return false }
        }
        return true
    }
    

    // MARK: Subscripts
    
    @inlinable @inline(__always)
    subscript(safe offset: Index) -> Element? {
        guard (0..<count).contains(offset) else { return nil }
        return self[offset]
    }
    
}


public extension Array where Element: AnyObject {
    
    /// Removes the given reference-type object from the array.
    ///
    ///     var array = [t1, t2, t3, t2, t4]
    ///     array.removeReference(t2) // [t1, t3, t4]
    ///
    @inlinable @inline(__always)
    mutating func removeReference(_ object: Element) {
        removeAll { $0 === object }
    }
    
    /// Removes the given reference-type objects from the array.
    ///
    ///     var array = [t1, t2, t3, t2, t4]
    ///     array.removeReferences([t2, t4]) // [t1, t3]
    ///
    @inlinable @inline(__always)
    mutating func removeReferences(_ objects: any Sequence<Element>) {
        removeAll { sourceObject in
            return objects.contains { removedObject in
                sourceObject === removedObject
            }
        }
    }

    
    /// Returns a new array containing all but the given reference-type object.
    ///
    ///     let array = [t1, t2, t3, t2, t4]
    ///     array.removingReference(t2) // [t1, t3, t4]
    ///
    @inlinable @inline(__always)
    func removingReference(_ object: Element) -> Self {
        return mutating(self) { $0.removeReference(object) }
    }
    
    /// Returns a new array containing all but the given reference-type objects.
    ///
    ///     let array = [t1, t2, t3, t2, t4]
    ///     array.removingReferences([t2, t4]) // [t1, t3]
    ///
    @inlinable @inline(__always)
    func removingReferences(_ objects: any Sequence<Element>) -> Self {
        return mutating(self) { $0.removeReferences(objects) }
    }
    
}


public extension Array where Element: LosslessStringConvertible {
    
    /// Returns a string by converting the elements of the sequence to strings and concatenating them, adding the given separator between each element.
    ///
    ///     [1.2, 3.4, 5.6].toString(separator: " ") // "1.2 3.4 5.6"
    ///     [1, 2, 3].toString(separator: ", ") // "1, 2, 3"
    ///
    /// - Parameter separator: A string to insert between each of the elements in this sequence.
    @inlinable @inline(__always)
    func toString(separator: String) -> String {
        return map { String($0) }.joined(separator: separator)
    }
    
}


public extension Array where Element == Character {
    
    /// A string that contains all characters of the array.
    ///
    ///     let array = [Character("H"), Character("i"), Character("!")]
    ///     array.toString() // "Hi!"
    ///
    @inlinable @inline(__always)
    func toString() -> String {
        return reduce(.empty) { $0.appending($1) }
    }
    
}

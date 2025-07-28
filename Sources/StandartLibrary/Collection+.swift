public extension Collection {
    
    /// Returns an array containing the non-nil results of calling the given transformation with each element of the collection,
    /// but only if all elements have been transformed; otherwise, returns `nil`.
    ///
    ///     let strings = ["1", "2", "three", "///4///", "5"]
    ///     let strings2 = ["1", "2", "3", "4", "5"]
    ///
    ///     strings.map { Int($0) }
    ///     // [1, 2, nil, nil, 5]
    ///
    ///     strings.compactMap { Int($0) }
    ///     // [1, 2, 5]
    ///
    ///     strings.fullMap { Int($0) }
    ///     // nil
    ///
    ///     strings2.fullMap { Int($0) }
    ///     // Optional([1, 2, 3, 4, 5])
    ///
    @inlinable @inline(__always)
    func fullMap<ElementOfResult>(_ transform: (Element) throws -> ElementOfResult?) rethrows -> [ElementOfResult]? {
        let result = try compactMap(transform)
        return result.count == count ? result : nil
    }
    
    
    /// Returns an array, up to the specified maximum length, containing the first elements of the collection.
    ///
    ///     let numbers = [1, 2, 3, 4, 5]
    ///     print(numbers.firsts(2)) // [1, 2]
    ///     print(numbers.firsts(9)) // [1, 2, 3, 4, 5]
    ///
    /// - Parameter maxLength: The maximum number of elements to return.
    ///   If it is less than zero, the return array will be empty.
    /// - Returns: An array starting at the beginning of this collection with at most `maxLength` elements.
    @inlinable @inline(__always)
    func firsts(_ maxLength: Int) -> [Element] {
        guard maxLength > 0 else { return .empty }
        return Array(prefix(maxLength))
    }
    
    /// Returns an array, up to the given maximum length, containing the last elements of the collection.
    ///
    ///     let numbers = [1, 2, 3, 4, 5]
    ///     print(numbers.lasts(2)) // [4, 5]
    ///     print(numbers.lasts(9)) // [1, 2, 3, 4, 5]
    ///
    /// - Parameter maxLength: The maximum number of elements to return.
    ///   If it is less than zero, the return array will be empty.
    /// - Returns: An array terminating at the end of the collection with at most `maxLength` elements.
    @inlinable @inline(__always)
    func lasts(_ maxLength: Int) -> [Element] {
        guard maxLength > 0 else { return .empty }
        return Array(suffix(maxLength))
    }
    
}


public extension Collection where Element: BinaryInteger {
    
    /// Returns the average value among all the elements in the collection.
    ///
    ///     let numbers = [1, 2, 3, 4]
    ///     numbers.average() // 2.5
    ///
    @inlinable @inline(__always)
    func average() -> Double {
        guard count > 0 else { return 0 }
        return Double(sum()) / Double(count)
    }
    
}


public extension Collection where Element: FloatingPoint {
    
    /// Returns the average value among all the elements in the collection.
    ///
    ///     let numbers = [1.2, 3.4, 5.6, 7.8]
    ///     numbers.average() // 4.5
    ///
    @inlinable @inline(__always)
    func average() -> Element {
        guard count > 0 else { return 0 }
        return sum() / Element(count)
    }
    
}

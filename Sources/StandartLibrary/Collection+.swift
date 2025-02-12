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

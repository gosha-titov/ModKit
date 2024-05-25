public extension Collection {
    
    /// Returns an array containing the non-nil results of calling the given transformation with each element of this collection,
    /// but only if all elements have been transformed; otherwise, returns `nil`.
    ///
    ///     let strings = ["1", "2", "three", "///4///", "5"]
    ///     let strings2 = ["1", "2", "3", "4", "5"]
    ///
    ///     let mapped: [Int?] = strings.map { Int($0) }
    ///     // [1, 2, nil, nil, 5]
    ///
    ///     let compactMapped: [Int] = strings.compactMap { Int($0) }
    ///     // [1, 2, 5]
    ///
    ///     let fullMapped: [Int]? = strings.fullMap { Int($0) }
    ///     // nil
    ///
    ///     let fullMapped: [Int]? = strings2.fullMap { Int($0) }
    ///     // Optional([1, 2, 3, 4, 5])
    ///
    @inlinable func fullMap<ElementOfResult>(_ transform: (Element) throws -> ElementOfResult?) rethrows -> [ElementOfResult]? {
        let result = try compactMap(transform)
        return result.count == count ? result : nil
    }
    
}

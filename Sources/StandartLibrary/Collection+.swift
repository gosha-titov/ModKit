public extension Collection {
    
    /// Returns an array containing the non-nil results of calling the given transformation with each element of this collection,
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

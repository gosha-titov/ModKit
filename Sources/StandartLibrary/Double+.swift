public extension Double {
    
    /// An array containing the digits of this double value.
    ///
    ///     let number = -312.55
    ///     number.digits // [3, 1, 2, 5, 5]
    ///
    @inlinable @inline(__always)
    var digits: [Int] {
        guard self != 0 else { return [0] } // otherwise, it returns [0, 0]
        return abs.toString().compactMap { $0.toInt() }
    }
    
    
    // MARK: Methods
    
    /// Returns an Int value converted from this double value.
    ///
    ///     let number = 34.56
    ///     number.toInt() // 34
    ///
    @inlinable @inline(__always)
    func toInt() -> Int { Int(self) }
    
}

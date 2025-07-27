public extension Numeric {
    
    /// Returns the value of this instance raised to the given power.
    ///
    ///     (-11).raised(toPower: 3) // -1331
    ///     (2.5).raised(toPower: 2) // 6.25
    ///
    @inlinable
    func raised(toPower exponent: Int) -> Self {
        guard exponent > 0 else { return 1 }
        var result: Self = 1
        var base = self
        var exponent = exponent
        while exponent > 0 {
            if exponent & 1 == 1 {
                result *= base
            }
            base *= base
            exponent >>= 1
        }
        return result
    }
    
    /// Raises the value of this instance to the given power.
    ///
    ///     var i = 12
    ///     i.raise(toPower: 2) // 144
    ///
    ///     var d = 1.5
    ///     d.raise(toPower: 3) // 3.375
    ///
    @inlinable @inline(__always)
    mutating func raise(toPower exponent: Int) {
        self = raised(toPower: exponent)
    }
    
}

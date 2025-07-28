public extension LosslessStringConvertible {
    
    /// Returns a string converted from this value.
    ///
    ///     (-97).toString() // "-97"
    ///     (1.5).toString() // "1.5"
    ///
    @inlinable @inline(__always)
    func toString() -> String {
        return String(self)
    }
    
}

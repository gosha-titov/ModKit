public extension Substring {
    
    /// Returns a String value converted from this substring.
    ///
    ///     let sub = "12345".dropLast(2) // "123" is substring
    ///     let str = sub.toString() // "123" is string
    ///
    @inlinable func toString() -> String { String(self) }
    
}

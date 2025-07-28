public extension ArraySlice where Element == Character {
    
    /// Returns a string containing the same characters as this slice.
    ///
    ///     let array = ["H", "e", "l", "l", "o"]
    ///     let slice = array[0...3]
    ///     let string = slice.toString() // "Hell"
    ///
    @inlinable @inline(__always)
    func toString() -> String {
        return String(self)
    }
    
}

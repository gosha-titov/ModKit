public extension Substring {
    
    /// Returns a string containing the same characters as this substring.
    ///
    ///     let greeting = "Hello, world!"
    ///     let substring = greeting.prefix(5) // Substring containing "Hello"
    ///     let string = substring.toString()  // "Hello"
    ///
    @inlinable @inline(__always)
    func toString() -> String {
        return String(self)
    }
    
}

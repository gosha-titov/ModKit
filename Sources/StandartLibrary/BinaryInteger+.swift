public extension BinaryInteger {
    
    /// Calls the given closure N number of times.
    ///
    ///     3.times {
    ///         print("N is \($0)")
    ///     }
    ///     // Prints "N is 0"
    ///     // Prints "N is 1"
    ///     // Prints "N is 2"
    ///
    /// - Parameter body: A closure that takes the current loop number as a parameter.
    @inlinable @inline(__always)
    func times(_ body: (Int) throws -> Void) rethrows {
        guard self > 0 else { return }
        for n in 0..<Int(self) { try body(n) }
    }
    
    /// Calls the given closure N number of times.
    ///
    ///     3.times {
    ///         print("Hello, world!")
    ///     }
    ///     // Prints "Hello, world!"
    ///     // Prints "Hello, world!"
    ///     // Prints "Hello, world!"
    ///
    @inlinable @inline(__always)
    func times(_ body: () throws -> Void) rethrows {
        guard self > 0 else { return }
        for _ in 0..<Int(self) { try body() }
    }
    
    
    /// Returns an integer clamped to the given limiting range.
    ///
    ///     let limits = 3..<8
    ///     2.clamped(to: limits) // 3
    ///     5.clamped(to: limits) // 5
    ///     8.clamped(to: limits) // 7
    ///
    @inlinable @inline(__always)
    func clamped(to limits: Range<Self>) -> Self {
        if self < limits.lowerBound { return limits.lowerBound }
        if self >= limits.upperBound { return limits.upperBound - 1 }
        return self
    }
    
    /// Returns an integer clamped to the given limiting range.
    ///
    ///     let limits = 5...8
    ///     3.clamped(to: limits) // 5
    ///     7.clamped(to: limits) // 7
    ///     9.clamped(to: limits) // 8
    ///
    @inlinable @inline(__always)
    func clamped(to limits: ClosedRange<Self>) -> Self {
        return max(limits.lowerBound, min(self, limits.upperBound))
    }
    
    /// Returns an integer clamped to the given limiting range.
    ///
    ///     let limits = 5...
    ///     3.clamped(to: limits) // 5
    ///     7.clamped(to: limits) // 7
    ///
    @inlinable @inline(__always)
    func clamped(to limits: PartialRangeFrom<Self>) -> Self {
        if self < limits.lowerBound { return limits.lowerBound }
        return self
    }
    
    /// Returns an integer clamped to the given limiting range.
    ///
    ///     let limits = ...5
    ///     3.clamped(to: limits) // 3
    ///     7.clamped(to: limits) // 5
    ///
    @inlinable @inline(__always)
    func clamped(to limits: PartialRangeThrough<Self>) -> Self {
        if self > limits.upperBound { return limits.upperBound }
        return self
    }
    
    /// Clamps this integer to the given limiting range.
    ///
    ///     let limits = 3..<8
    ///
    ///     var number = 2
    ///     number.clamped(to: limits) // 3
    ///
    ///     number = 5
    ///     number.clamped(to: limits) // 5
    ///
    ///     number = 8
    ///     number.clamped(to: limits) // 7
    ///
    @inlinable @inline(__always)
    mutating func clamp(to limits: Range<Self>) {
        self = clamped(to: limits)
    }
    
    /// Clamps this integer to the given limiting range.
    ///
    ///     let limits = 5...8
    ///
    ///     var number = 3
    ///     number.clamp(to: limits) // 5
    ///
    ///     number = 7
    ///     number.clamp(to: limits) // 7
    ///
    ///     number = 9
    ///     number.clamp(to: limits) // 8
    ///
    @inlinable @inline(__always)
    mutating func clamp(to limits: ClosedRange<Self>) {
        self = clamped(to: limits)
    }
    
    /// Clamps this integer to the given limiting range.
    ///
    ///     let limits = 5...
    ///
    ///     var number = 3
    ///     number.clamp(to: limits) // 5
    ///
    ///     number = 7
    ///     number.clamp(to: limits) // 7
    ///
    @inlinable @inline(__always)
    mutating func clamp(to limits: PartialRangeFrom<Self>) {
        self = clamped(to: limits)
    }
    
    /// Clamps this integer to the given limiting range.
    ///
    ///     let limits = ...5
    ///
    ///     var number = 3
    ///     number.clamp(to: limits) // 3
    ///
    ///     number = 7
    ///     number.clamp(to: limits) // 5
    ///
    @inlinable @inline(__always)
    mutating func clamp(to limits: PartialRangeThrough<Self>) {
        self = clamped(to: limits)
    }
    
    
    /// Returns a Double value converted from this integer.
    ///
    ///     let number = 49
    ///     number.toDouble() // 49.0
    ///
    @inlinable @inline(__always)
    func toDouble() -> Double { Double(self) }
    
    /// Returns a Float value converted from this integer.
    ///
    ///     let number = 21
    ///     number.toFloat() // 21.0
    ///
    @inlinable @inline(__always)
    func toFloat() -> Float { Float(self) }
    
    /// Returns a String value converted from this integer.
    ///
    ///     let number = 53
    ///     number.toString() // "53"
    ///
    @inlinable @inline(__always)
    func toString() -> String { String(self) }
    
}

public extension FloatingPoint {
    
    /// The absolute value of this floating-point value.
    ///
    ///     let number = -30.8
    ///     number.abs // 30.8
    ///
    @inlinable @inline(__always)
    var abs: Self {
        return Swift.abs(self)
    }
    
    /// A value converted from the value of this instance in degrees to a value in radians.
    ///
    ///     let angle = 120.0
    ///     angle.degreesToRadians // 2.094...
    ///
    @inlinable @inline(__always)
    var degreesToRadians: Self {
        return self * .pi / 180
    }
    
    /// A value converted from the value of this instance in radians to a value in degrees.
    ///
    ///     let angle = 2.0
    ///     angle.radiansToDegrees // 114.5...
    ///
    @inlinable @inline(__always)
    var radiansToDegrees: Self {
        return self * 180 / .pi
    }
    
    
    // MARK: Methods
    
    /// Returns an instance value clamped to the given limiting range.
    ///
    ///     let limits = (5.5)...(8.9)
    ///     (3.3).clamped(to: limits) // 5.5
    ///     (7.1).clamped(to: limits) // 7.1
    ///     (9.3).clamped(to: limits) // 8.9
    ///
    @inlinable @inline(__always)
    func clamped(to limits: ClosedRange<Self>) -> Self {
        return max(limits.lowerBound, min(self, limits.upperBound))
    }
    
    /// Clamps this instance value to the given limiting range.
    ///
    ///     let limits = (5.5)...(8.9)
    ///
    ///     var number = 3.3
    ///     number.clamp(to: limits) // 5.5
    ///
    ///     number = 7.1
    ///     number.clamp(to: limits) // 7.1
    ///
    ///     number = 9.3
    ///     number.clamp(to: limits) // 8.9
    ///
    @inlinable @inline(__always)
    mutating func clamp(to limits: ClosedRange<Self>) {
        self = clamped(to: limits)
    }
    
    
    /// Returns this value rounded to the specified decimal places using the specified rounding rule.
    ///
    ///     let pi = 3.14159
    ///
    ///     print(pi.rounded(toDecimalPlaces: 3, rule: .toNearestOrAwayFromZero))
    ///     // Prints "3.142"
    ///
    ///     print(pi.rounded(toDecimalPlaces: 3, rule: .up)
    ///     // Prints "3.142"
    ///
    ///     print(pi.rounded(toDecimalPlaces: 3, rule: .down)
    ///     // Prints "3.141"
    ///
    @inlinable
    func rounded(toDecimalPlaces number: Int, rule: FloatingPointRoundingRule = .toNearestOrAwayFromZero) -> Self {
        let factor = Self(10.raised(to: number))
        return (self * factor).rounded(rule) / factor
    }
    
}

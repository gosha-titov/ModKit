public extension FloatingPoint {
    
    // MARK: Properties
    
    /// A value converted from the value of this instance in degrees to a value in radians.
    ///
    ///     let angle = 120.0
    ///     angle.degreesToRadians // 2.094...
    ///
    var degreesToRadians: Self {
        return self * Self.pi / 180
    }
    
    /// A value converted from the value of this instance in radians to a value in degrees.
    ///
    ///     let angle = 2.0
    ///     angle.radiansToDegrees // 114.5...
    ///
    var radiansToDegrees: Self {
        return self * 180 / Self.pi
    }
    
    /// A `Boolean` value that indicates whether the instance is greater than zero.
    ///
    ///     let number = 21.43
    ///     number.isPositive // true
    ///
    var isPositive: Bool { self > 0 }
    
    /// A `Boolean` value that indicates whether the instance is less than zero.
    ///
    ///     let number = -45.03
    ///     number.isNegative // true
    ///
    var isNegative: Bool { self < 0 }
    
    
    // MARK: Methods
    
    /// Returns an instance clamped to the given limiting range.
    ///
    ///     let limits = (5.5)...(8.9)
    ///     (3.3).clamped(to: limits) // 5.5
    ///     (7.1).clamped(to: limits) // 7.1
    ///     (9.3).clamped(to: limits) // 8.9
    ///
    func clamped(to limits: ClosedRange<Self>) -> Self {
        if self > limits.upperBound { return limits.upperBound }
        if self < limits.lowerBound { return limits.lowerBound }
        return self
    }
    
    /// Clamps this instance to the given limiting range.
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
    mutating func clamp(to limits: ClosedRange<Self>) -> Void {
        self = clamped(to: limits)
    }
    
}

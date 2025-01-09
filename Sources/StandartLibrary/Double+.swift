public extension Double {
    
    /// An array containing the digits of this double value.
    ///
    ///     let number = -312.55
    ///     number.digits // [3, 1, 2, 5, 5]
    ///
    @inlinable var digits: [Int] {
        guard self != 0 else { return [0] } // otherwise, it returns [0, 0]
        return abs.toString().compactMap { $0.toInt() }
    }
    
    
    // MARK: Methods
    
    /// A type that represents a unit of time.
    ///
    /// It's used in `convertTime(from:to:)` and `convertedTime(from:to:)` methods.
    /// These methods convert time from one specific unit time to another.
    ///
    /// All units of time: nanoseconds, milliseconds, seconds, minutes, hours, days and years.
    enum TimeUnit: Int { case nanoseconds, milliseconds, seconds, minutes, hours, days, years }
    
    /// Returns converted time from one specific time unit to another.
    ///
    ///     10000.convertedTime(from: .seconds, to: .hours) // 2.7777
    ///     (1.5).convertedTime(from: .days, to: .minutes)  // 2160.0
    ///
    @inlinable func convertedTime(from start: TimeUnit, to end: TimeUnit) -> Double {
        let start = start.rawValue; let end = end.rawValue
        let coefficients = [1_000_000.0, 1000.0, 60.0, 60.0, 24.0, 365.0][min(start, end)..<max(start, end)]
        let operation: (Double, Double) -> Double = start > end ? { $0 * $1 } : { $0 / $1 }
        return coefficients.reduce(self, operation)
    }
    
    /// Converts time from one specific time unit to another.
    ///
    ///     var time = 1.5
    ///     time.convertTime(from: .days, to: .minutes)  // 2160.0
    ///
    @inlinable mutating func convertTime(from start: TimeUnit, to end: TimeUnit) {
        self = convertedTime(from: start, to: end)
    }
    
    
    /// Returns an Int value converted from this double value.
    ///
    ///     let number = 34.56
    ///     number.toInt() // 34
    ///
    @inlinable func toInt() -> Int { Int(self) }
    
    /// Returns a String value converted from this double value.
    ///
    ///     let number = 13.24
    ///     number.toString() // "13.24"
    ///
    @inlinable func toString() -> String { String(self) }
    
}

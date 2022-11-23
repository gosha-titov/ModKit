public extension Double {
    
    // MARK: Properties
    
    /// An Int value that is the number of digits of this double value.
    ///
    ///     let number = -592.4
    ///     number.digitCount // 4
    ///
    var digitCount: Int {
        return abs.toString.filter { $0 != "." }.count
    }
    
    /// An array containing the digits of this double value.
    ///
    ///     let number = -312.55
    ///     number.digits // [3, 1, 2, 5, 5]
    ///
    var digits: [Int] {
        return abs.toString.filter { $0 != "." }.map { $0.toInt! }
    }
    
    /// The absolute value of this double value.
    ///
    ///     let number = -30.8
    ///     number.abs // 30.8
    ///
    var abs: Self { Swift.abs(self) }
    
    /// An Int value converted from this double value.
    ///
    ///     let number = 34.56
    ///     number.toInt // 34
    ///
    var toInt: Int { Int(self) }
    
    /// A Boolean value converted from this double value.
    ///
    ///     let number = 4
    ///     number.toBool // true
    ///
    var toBool: Bool { Bool(self) }
    
    /// A String value converted from this double value.
    ///
    ///     let number = 13.24
    ///     number.toString // "13.24"
    ///
    var toString: String { String(self) }
    
    
    // MARK: Methods
    
    /// A type that represents a unit of time.
    ///
    /// It's used in `converTime(from:to:)` and `convertedTime(from:to:)` methods.
    /// These methods convert time from one specific unit time to another.
    ///
    /// All units of time: nanoseconds, milliseconds, seconds, minutes, hours, days and years.
    enum TimeUnit: Int { case nanoseconds, milliseconds, seconds, minutes, hours, days, years }
    
    /// Returns converted time from one specific time unit to another.
    ///
    ///     10000.convertedTime(from: .seconds, to: .hours) // 2.7777
    ///     (1.5).convertedTime(from: .days, to: .minutes)  // 2160.0
    ///
    func convertedTime(from start: TimeUnit, to end: TimeUnit) -> Double {
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
    mutating func convertTime(from start: TimeUnit, to end: TimeUnit) -> Void {
        self = convertedTime(from: start, to: end)
    }
    
}

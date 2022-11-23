public extension BinaryInteger {
    
    // MARK: Properties
    
    /// A Boolean value that indicates whether this integer is greater than zero.
    ///
    ///     let number = 43
    ///     number.isPositive // true
    ///
    var isPositive: Bool { self > 0 }
    
    /// A Boolean value that indicates whether this integer is less than zero.
    ///
    ///     let number = -91
    ///     number.isNegative // true
    ///
    var isNegative: Bool { self < 0 }
    
    /// A Boolean value that indicates whether this integer is equal to zero.
    ///
    ///     let number = 0
    ///     number.isZero // true
    ///
    var isZero: Bool { self == 0 }
    
    /// A Boolean value that indicates whether this integer is even.
    ///
    ///     let number = 52
    ///     number.isEven // true
    ///
    var isEven: Bool { self % 2 == 0 }
    
    /// A Boolean value that indicates whether this integer is odd.
    ///
    ///     let number = 37
    ///     number.isOdd // true
    ///
    var isOdd: Bool { self % 2 != 0 }
    
    /// A Double value converted from this integer.
    ///
    ///     let number = 49
    ///     number.toDouble // 49.0
    ///
    var toDouble: Double { Double(self) }
    
    /// A Float value converted from this integer.
    ///
    ///     let number = 21
    ///     number.toFloat // 21.0
    ///
    var toFloat: Float { Float(self) }
    
    /// A Boolean value converted from this integer.
    ///
    ///     let number = 4
    ///     number.toBool // true
    ///
    var toBool: Bool { Bool(self) }
    
    /// A String value converted from this integer.
    ///
    ///     let number = 53
    ///     number.toString // "53"
    ///
    var toString: String { String(self) }
    
    
    // MARK: Methods
    
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
    ///
    func times(_ body: (Int) -> Void) -> Void {
        guard self > 0 else { return }
        for n in 0..<Int(self) { body(n) }
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
    func times(_ body: () -> Void) -> Void {
        guard self > 0 else { return }
        for _ in 0..<Int(self) { body() }
    }
    
    /// Returns a Boolean value indicating whether this integer is contained in the range.
    ///
    ///     let number = 19
    ///     number.isInRange(5..<99) // true
    ///
    func isInRange(_ range: Range<Self>) -> Bool {
        return range.contains(self)
    }
    
    /// Returns an integer clamped to the given limiting range.
    ///
    ///     let limits = 5...8
    ///     3.clamped(to: limits) // 5
    ///     7.clamped(to: limits) // 7
    ///     9.clamped(to: limits) // 8
    ///
    func clamped(to limits: ClosedRange<Self>) -> Self {
        if self > limits.upperBound { return limits.upperBound }
        if self < limits.lowerBound { return limits.lowerBound }
        return self
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
    mutating func clamp(to limits: ClosedRange<Self>) -> Void {
        self = clamped(to: limits)
    }
    
}

public extension BinaryInteger {
    
    // MARK: Properties
    
    /// A `Boolean` value that indicates whether this instance is greater than zero.
    ///
    ///     let number = 43
    ///     number.isPositive // true
    ///
    var isPositive: Bool { self > 0 }
    
    /// A `Boolean` value that indicates whether this instance is less than zero.
    ///
    ///     let number = -91
    ///     number.isNegative // true
    ///
    var isNegative: Bool { self < 0 }
    
    /// A `Boolean` value that indicates whether this instance is equal to zero.
    ///
    ///     let number = 0
    ///     number.isZero // true
    ///
    var isZero: Bool { self == 0 }
    
    /// A `Boolean` value that indicates whether this instance is even.
    ///
    ///     let number = 52
    ///     number.isEven // true
    ///
    var isEven: Bool { self % 2 == 0 }
    
    /// A `Boolean` value that indicates whether this instance is odd.
    ///
    ///     let number = 37
    ///     number.isOdd // true
    ///
    var isOdd: Bool { self % 2 != 0 }
    
    /// Converts this instance value to a `Double` value.
    ///
    ///     let number = 49
    ///     number.toDouble // 49.0
    ///
    var toDouble: Double { Double(self) }
    
    /// Converts the instance value to a Float value.
    ///
    ///     let number = 21
    ///     number.toFloat // 21.0
    ///
    var toFloat: Float { Float(self) }
    
    /// Converts the instance value to a Boolean value.
    ///
    ///     let number = 4
    ///     number.toBool // true
    ///
    var toBool: Bool { Bool(self) }
    
    
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
    
    /// Returns a Boolean value indicating whether this instance is contained in the range.
    ///
    ///     let number = 19
    ///     number.isInRange(5..<99) // true
    ///
    func isInRange(_ range: Range<Self>) -> Bool {
        return range.contains(self)
    }
    
}

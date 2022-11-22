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
    
}

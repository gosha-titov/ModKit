public extension SignedInteger {
    
    /// An Int value that is the number of digits of this integer.
    ///
    ///     let number = -592
    ///     number.digitCount // 3
    ///
    var digitCount: Int {
        return String(abs).count
    }

    /// An array containing the digits of this integer.
    ///
    ///     let number = -312
    ///     number.digits // [3, 1, 2]
    ///
    var digits: [Int] {
        return String(abs).map { $0.toInt! }
    }

    /// The absolute value of this integer.
    ///
    ///     let number = -30
    ///     number.abs // 30
    ///
    var abs: Self { Swift.abs(self) }
    
}

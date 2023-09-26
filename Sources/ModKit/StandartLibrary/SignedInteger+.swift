public extension SignedInteger {

    /// An array containing the digits of this integer.
    ///
    ///     let number = -312
    ///     number.digits // [3, 1, 2]
    ///
    var digits: [Int] {
        return abs.toString.compactMap { $0.toInt }
    }

    /// The absolute value of this integer.
    ///
    ///     let number = -30
    ///     number.abs // 30
    ///
    var abs: Self { Swift.abs(self) }
    
}

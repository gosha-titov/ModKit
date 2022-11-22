public extension Double {
    
    // MARK: Properties
    
    /// An `Int` value that is the number of digits of this instance value.
    ///
    ///     let number = -592.4
    ///     number.digitCount // 4
    ///
    var digitCount: Int {
        return abs.toString.filter { $0 != "." }.count
    }
    
    /// An array containing the digits of this instance value.
    ///
    ///     let number = -312.55
    ///     number.digits // [3, 1, 2, 5, 5]
    ///
    var digits: [Int] {
        let ch = Character("1")
        return abs.toString.filter { $0 != "." }.map { $0.toInt! }
    }
    
    /// The absolute value of this instance value.
    ///
    ///     let number = -30.8
    ///     number.abs // 30.8
    ///
    var abs: Self { Swift.abs(self) }
    
    /// An `Int` value converted from this instance value.
    ///
    ///     let number = 34.56
    ///     number.toInt // 34
    ///
    var toInt: Int { Int(self) }
    
    /// A `Boolean` value converted from this instance value.
    ///
    ///     let number = 4
    ///     number.toBool // true
    ///
    var toBool: Bool { Bool(self) }
    
    /// A `String` value converted from this instance value.
    ///
    ///     let number = 13.24
    ///     number.toString // "13.24"
    ///
    var toString: String { String(self) }
    
}

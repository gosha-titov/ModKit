public extension Bool {
    
    // MARK: Properties
    
    /// A Boolean toggled value of this.
    ///
    ///     let flag = false
    ///     flag.toggled // true
    ///
    var toggled: Bool { !self }
    
    /// An Int value converted from this boolean value.
    ///
    ///     let bool = true
    ///     bool.toInt // 1
    ///
    var toInt: Int { self ? 1 : 0 }
    
    /// A String value converted from this boolean value.
    ///
    ///     let bool = false
    ///     bool.toString // "false"
    ///
    var toString: String { String(self) }
    
    
    // MARK: Inits
    
    /// Creates an instance equal to `false` if the given value is `0`; otherwise, `true`.
    init<B: BinaryInteger>(_ value: B) {
        if value.isZero { self.init(false) }
        else { self.init(true) }
    }
    
    /// Creates an instance equal to `false` if the given value is `0.0`; otherwise, `true`.
    init<F: FloatingPoint>(_ value: F) {
        if value.isZero { self.init(false) }
        else { self.init(true) }
    }
    
}

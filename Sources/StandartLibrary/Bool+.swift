public extension Bool {
    
    /// A Boolean toggled value of this.
    ///
    ///     let flag = false
    ///     flag.toggled // true
    ///
    @inlinable var toggled: Bool { !self }
    
    /// An Int value converted from this boolean value.
    ///
    ///     let bool = true
    ///     bool.toInt // 1
    ///
    @inlinable var toInt: Int { self ? 1 : 0 }
    
    /// A String value converted from this boolean value.
    ///
    ///     let bool = false
    ///     bool.toString // "false"
    ///
    @inlinable var toString: String { String(self) }
    
    
    // MARK: Inits
    
    /// Creates an instance equal to `false` if the given value is `0`; otherwise, `true`.
    @inlinable init<B: BinaryInteger>(_ value: B) {
        self = !value.isZero
    }
    
    /// Creates an instance equal to `false` if the given value is `0.0`; otherwise, `true`.
    @inlinable init<F: FloatingPoint>(_ value: F) {
        self = !value.isZero
    }
    
}

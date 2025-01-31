public extension Bool {
    
    /// A Boolean toggled value of this.
    ///
    ///     let flag = false
    ///     flag.toggled // true
    ///
    @inlinable @inline(__always)
    var toggled: Bool { !self }
    
    
    // MARK: Methods
    
    /// Return an Int value converted from this boolean value.
    ///
    ///     let bool = true
    ///     bool.toInt() // 1
    ///
    @inlinable @inline(__always)
    func toInt() -> Int { self ? 1 : 0 }
    
    
    // MARK: Inits
    
    /// Creates an instance equal to `false` if the given value is `0`; otherwise, `true`.
    @inlinable @inline(__always)
    init<B: BinaryInteger>(_ value: B) {
        self = value != .zero
    }
    
    /// Creates an instance equal to `false` if the given value is `0.0`; otherwise, `true`.
    @inlinable @inline(__always)
    init<F: FloatingPoint>(_ value: F) {
        self = value != .zero
    }
    
}

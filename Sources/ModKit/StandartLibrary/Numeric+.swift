public extension Numeric {
    
    /// Returns the value of this instance raised to the given power.
    ///
    ///     (-11).raised(to: 3) // -1331
    ///     (2.5).raised(to: 2) // 6.25
    ///
    func raised(to power: Int) -> Self {
        guard power > 0 else { return 1 }
        let multiplier = self; var result = self
        (power - 1).times { result *= multiplier }
        return result
    }
    
    /// Raises the value of this instance to the given power.
    ///
    ///     var i = 12
    ///     i.raise(to: 2) // 144
    ///
    ///     var d = 1.5
    ///     d.raise(to: 3) // 3.375
    ///
    mutating func raise(to power: Int) -> Void {
        self = raised(to: power)
    }
    
}

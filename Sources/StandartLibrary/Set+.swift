public extension Set {
    
    /// Creates a set that has no elements.
    ///
    /// It's often used when you need to specify the empty set as an argument:
    ///
    ///     let c = Configuration(parameters: .empty)
    ///
    @inlinable static var empty: Self { [] }
    
}

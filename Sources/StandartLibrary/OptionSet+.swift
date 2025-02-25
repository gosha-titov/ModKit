public extension OptionSet {
    
    /// Returns an empty option set.
    @inlinable @inline(__always)
    static var empty: Self { .init() }
    
    
    // MARK: Methods
    
    /// Returns a new option set with the given element inserted in the set if it is not already present.
    ///
    ///     let workingDays: WeekDays = [.monday, .wednesday]
    ///     workingDays.inserting(.friday) // [.monday, .wednesday, .friday]
    ///
    @inlinable @inline(__always)
    func inserting(_ newMember: Element) -> Self {
        return mutating(self) { $0.insert(newMember) }
    }
    
    /// Returns a new option set with the given element and any elements subsumed by the given element removed.
    ///
    ///     let workingDays: WeekDays = [.monday, .wednesday, .friday]
    ///     workingDays.removing(.friday) // [.monday, .wednesday]
    ///
    @inlinable @inline(__always)
    func removing(_ oldMember: Element) -> Self {
        return mutating(self) { $0.remove(oldMember) }
    }
    
}

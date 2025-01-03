public extension Character {
    
    /// The non-breaking space character that prevents an automatic line break at its position.
    ///
    ///     let space: Character = .nonbreakingSpace
    ///     let currency = "499" + space + "999"
    ///
    @inlinable static var nonbreakingSpace: Character { "\u{00A0}" }
    
    /// The character that is a thin space.
    @inlinable static var thinSpace: Character { "\u{2009}" }
    
    /// The character that is a space.
    ///
    ///     // Usage example
    ///     guard char != .space else { return }
    ///
    @inlinable static var space: Character { "\u{0020}" }
    
    
    // MARK: Methods
    
    /// Returns an optional Int value converted from this character.
    ///
    ///     let char = Character("4")
    ///     char.toInt() // Optional(4)
    ///
    @inlinable func toInt() -> Int? {
        return Int(toString())
    }
 
    /// Returns a String value converted from this character.
    ///
    ///     let char = Character("!")
    ///     let str = "Hello" + char.toString() // "Hello!"
    ///
    @inlinable func toString() -> String {
        return String(self)
    }
    
}

public extension Character {
    
    /// The non-breaking space character that prevents an automatic line break at its position.
    @inlinable static var nonbreakingSpace: Character { "\u{00A0}" }
    
    /// The character that is a thin space.
    @inlinable static var thinSpace: Character { "\u{2009}" }
    
    /// The character that is a space.
    @inlinable static var space: Character { "\u{0020}" }
    
    /// The new-line character (`"\n"`) that signifies the end of a line of text and the start of a new one.
    @inlinable static var newline: String { "\u{000A}" }
    
    /// The character that is a tab (`"\t"`).
    @inlinable static var tab: String { "\u{0009}" }
    
    
    /// An uppercase version of this character.
    ///
    ///     let char = Character("a")
    ///     char.uppercased // Character("A")
    ///
    @inlinable var uppercased: Character {
        return toString().uppercased().first!
    }
    
    /// A lowercase version of this character.
    ///
    ///     let char = Character("A")
    ///     char.lowercased // Character("a")
    ///
    @inlinable var lowercased: Character {
        return toString().lowercased().first!
    }
    
    
    // MARK: Methods
    
    /// Makes this character uppercase.
    ///
    ///     var char = Character("a")
    ///     char.uppercase() // Character("A")
    ///
    @inlinable mutating func uppercase() {
        self = uppercased
    }
    
    /// Makes this character lowercase.
    ///
    ///     var char = Character("A")
    ///     char.lowercase() // Character("a")
    ///
    @inlinable mutating func lowercase() {
        self = lowercased
    }
    
    
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

public extension Character {
    
    /// The character that acts as a placeholder for an embedded object, often used when converting a document to plain text.
    @inlinable @inline(__always)
    static var objectReplacement: Character { "\u{fffc}" }
    
    /// The non-breaking space character that prevents an automatic line break at its position.
    @inlinable @inline(__always)
    static var nonbreakingSpace: Character { "\u{00A0}" }
    
    /// The character that is a thin space.
    @inlinable @inline(__always)
    static var thinSpace: Character { "\u{2009}" }
    
    /// The character that is a space.
    @inlinable @inline(__always)
    static var space: Character { "\u{0020}" }
    
    /// The new-line character (`"\n"`) that signifies the end of a line of text and the start of a new one.
    @inlinable @inline(__always)
    static var newline: Character { "\u{000A}" }
    
    /// The character that is a tab (`"\t"`).
    @inlinable @inline(__always)
    static var tab: Character { "\u{0009}" }
    
    
    /// An uppercase version of this character.
    ///
    ///     let char = Character("a")
    ///     char.uppercased // Character("A")
    ///
    @inlinable @inline(__always)
    var uppercased: Character {
        return String(self).uppercased().first!
    }
    
    /// A lowercase version of this character.
    ///
    ///     let char = Character("A")
    ///     char.lowercased // Character("a")
    ///
    @inlinable @inline(__always)
    var lowercased: Character {
        return String(self).lowercased().first!
    }
    
    
    // MARK: Methods
    
    /// Makes this character uppercase.
    ///
    ///     var char = Character("a")
    ///     char.uppercase() // Character("A")
    ///
    @inlinable @inline(__always)
    mutating func uppercase() {
        self = uppercased
    }
    
    /// Makes this character lowercase.
    ///
    ///     var char = Character("A")
    ///     char.lowercase() // Character("a")
    ///
    @inlinable @inline(__always)
    mutating func lowercase() {
        self = lowercased
    }
    
    
    /// Returns an optional Int value converted from this character.
    ///
    ///     let char = Character("4")
    ///     char.toInt() // Optional(4)
    ///
    @inlinable @inline(__always)
    func toInt() -> Int? { String(self).toInt() }
 
    /// Returns a String value converted from this character.
    ///
    ///     let char = Character("!")
    ///     let str = "Hello" + char.toString() // "Hello!"
    ///
    @inlinable @inline(__always)
    func toString() -> String { String(self) }
    
}

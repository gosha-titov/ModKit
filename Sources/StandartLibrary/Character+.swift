public extension Character {
    
    /// The non-breaking space character that prevents an automatic line break at its position.
    ///
    ///     let space = Character.nonbreakingSpace
    ///     let currency = "499" + space + "999"
    ///
    @inlinable static var nonbreakingSpace: Character { Character("\u{00A0}") }
    
    /// An optional Int value converted from this character.
    ///
    ///     let char = Character("4")
    ///     char.toInt // Optional(4)
    ///
    @inlinable var toInt: Int? { Int(toString) }
 
    /// A String value converted from this character.
    ///
    ///     let char = Character("!")
    ///     let str = "Hello" + char.toString // "Hello!"
    ///
    @inlinable var toString: String { String(self) }
    
}

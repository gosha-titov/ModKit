public extension Character {
    
    /// The non-breaking space character that prevents an automatic line break at its position.
    ///
    ///     let space = Character.nonbreakingSpace
    ///     let currency = "499" + space + "999"
    ///
    static let nonbreakingSpace = Character("\u{00A0}")
    
    /// An optional Int value converted from this character.
    ///
    ///     let char = Character("4")
    ///     char.toInt // Optional(4)
    ///
    var toInt: Int? { Int(toString) }
 
    /// A String value converted from this character.
    ///
    ///     let char = Character("!")
    ///     let str = "Hello" + char.toString // "Hello!"
    ///
    var toString: String { String(self) }
    
}

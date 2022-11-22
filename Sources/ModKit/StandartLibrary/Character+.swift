public extension Character {
    
    /// An `Int` value converted from this character, or `nil`.
    ///
    ///     let char = Character("4")
    ///     char.toInt // Optional(4)
    ///
    var toInt: Int? { Int(toString) }
 
    /// A `String` value converted from this character.
    ///
    ///     let char = Character("!")
    ///     let str = "Hello" + char.toString // "Hello!"
    ///
    var toString: String { String(self) }
    
}

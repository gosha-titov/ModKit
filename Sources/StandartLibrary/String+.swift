public extension String {
    
    /// Creates a string that has no characters.
    @inlinable @inline(__always)
    static var empty: Self { String() }
    
    
    /// The string that contains only the symbol that acts as a placeholder for an embedded object, often used when converting a document to plain text.
    @inlinable @inline(__always)
    static var objectReplacement: Character { "\u{fffc}" }
    
    /// The string that contains only the non-breaking space symbol that prevents an automatic line break at its position.
    @inlinable @inline(__always)
    static var nonbreakingSpace: String { "\u{00A0}" }
    
    /// The string that contains only the thin space.
    @inlinable @inline(__always)
    static var thinSpace: String { "\u{2009}" }
    
    /// The string that contains only the space symbol.
    @inlinable @inline(__always)
    static var space: String { "\u{0020}" }
    
    /// The string that contains only the new-line symbol (`"\n"`) that signifies the end of a line of text and the start of a new one.
    @inlinable @inline(__always)
    static var newline: String { "\u{000A}" }
    
    /// The string that contains only the tab symbol (`"\t"`).
    @inlinable @inline(__always)
    static var tab: String { "\u{0009}" }
    
    
    /// A boolean value that indicates whether all characters in the string are unique.
    ///
    ///     "package".containsOnlyUniqueCharacters // false
    ///     "combine".containsOnlyUniqueCharacters // true
    ///
    /// - Returns: `True` if all characters in the string are distinct (no duplicates);
    ///   otherwise, `false` if any character appears more than once.
    @inlinable @inline(__always)
    var containsOnlyUniqueCharacters: Bool {
        guard count > 1 else { return true }
        var seen = Set<Character>(minimumCapacity: min(count, 256))
        return allSatisfy { seen.insert($0).inserted }
    }
    
    
    // MARK: Methods
    
    /// Returns a new string, up to the specified maximum length, containing the first characters of this string.
    ///
    ///     let string = "abcde"
    ///     print(string.firsts(2)) // "ab"
    ///     print(string.firsts(9)) // "abcde"
    ///
    /// - Parameter maxLength: The maximum number of characters to return.
    ///   If it is less than zero, the return string will be empty.
    /// - Returns: A string starting at the beginning of this string with at most `maxLength` characters.
    @inlinable @inline(__always)
    func firsts(_ maxLength: Int) -> String {
        guard maxLength > 0 else { return .empty }
        return String(prefix(maxLength))
    }
    
    /// Returns a new string, up to the given maximum length, containing the last characters of this string.
    ///
    ///     let string = "abcde"
    ///     print(string.lasts(2)) // "de"
    ///     print(string.lasts(9)) // "abcde"
    ///
    /// - Parameter maxLength: The maximum number of characters to return.
    ///   If it is less than zero, the return string will be empty.
    /// - Returns: A string terminating at the end of this string with at most `maxLength` characters.
    @inlinable @inline(__always)
    func lasts(_ maxLength: Int) -> String {
        guard maxLength > 0 else { return .empty }
        return String(suffix(maxLength))
    }
    
    
    /// Returns a new string with the given character added to the end of the string.
    ///
    ///     let string = "ab"
    ///     string.appending("c") // "abc"
    ///
    @inlinable @inline(__always)
    func appending(_ newCharacter: Character) -> String {
        return self + String(newCharacter)
    }
    
    /// Returns a new string with the characters of the given sequence added to the end of the string.
    ///
    ///     let string = "ab"
    ///     string.appending(contentsOf: "cd") // "abcd"
    ///
    @inlinable @inline(__always)
    func appending<S: Sequence>(contentsOf newElements: S) -> String where S.Element == Character {
        return self + String(newElements)
    }
    
    /// Adds the given character at the beginning of the string.
    ///
    ///     var string = "bc"
    ///     string.prepend("a") // "abc"
    ///
    @inlinable @inline(__always)
    mutating func prepend(_ newCharacter: Character) {
        self.insert(newCharacter, at: startIndex)
    }
    
    /// Adds the characters of the given sequence at the beginning of the string.
    ///
    ///     var string = "cd"
    ///     string.prepend(contentsOf: "ab") // "abcd"
    ///
    @inlinable @inline(__always)
    mutating func prepend<C: Collection>(contentsOf newElements: C) where C.Element == Character {
        self.insert(contentsOf: newElements, at: startIndex)
    }
    
    /// Returns a new string with the given character added at the beginning of the string.
    ///
    ///     let string = "bc"
    ///     string.prepending("a") // "abc"
    ///
    @inlinable @inline(__always)
    func prepending(_ char: Character) -> String {
        return String(char) + self
    }
    
    /// Returns a new string with the characters of the given sequence added to the beginning of the string.
    ///
    ///     let string = "cd"
    ///     string.prepending(contentsOf: "ab") // "abcd"
    ///
    @inlinable @inline(__always)
    func prepending<S: Sequence>(contentsOf newElements: S) -> String where S.Element == Character {
        return String(newElements) + self
    }
    
    
    /// Returns a string containing characters  this string and the given string have in common,
    /// starting from the ending of each up to the first characters that aren’t equivalent.
    ///
    ///     let str1 = "abcde"
    ///     let str2 = "abde"
    ///     str1.commonSuffix(with: str2) // "de"
    ///
    @inlinable @inline(__always)
    func commonSuffix(with str: String) -> String {
        var (index1, index2) = (endIndex, str.endIndex)
        var startIndex = self.endIndex
        while index1 > self.startIndex && index2 > str.startIndex {
            let (previousIndex1, previousIndex2) = (index(before: index2), str.index(before: index2))
            guard self[previousIndex1] == str[previousIndex2] else { break }
            (index1, index2) = (previousIndex1, previousIndex2)
            startIndex = index1
        }
        return String(self[startIndex..<endIndex])
    }
    
    
    /// Makes this string uppercase.
    ///
    ///     var str = "WorD"
    ///     str.uppercase() // "WORD"
    ///
    @inlinable @inline(__always)
    mutating func uppercase() {
        self = uppercased()
    }
    
    /// Makes this string lowercase.
    ///
    ///     var str = "WorD"
    ///     str.lowercase() // "word"
    ///
    @inlinable @inline(__always)
    mutating func lowercase() {
        self = lowercased()
    }
    
    
    /// Returns an optional `Int` value converted from this string.
    ///
    ///     let str = "213"
    ///     str.toInt // Optional(213)
    ///
    @inlinable @inline(__always)
    func toInt() -> Int? { Int(self) }
    
    
    // MARK: Subscripts
    
    @inlinable @inline(__always)
    subscript(bounds: ClosedRange<Int>) -> String {
        let lowerBound = index(startIndex, offsetBy: bounds.lowerBound)
        let upperBound = index(startIndex, offsetBy: bounds.upperBound)
        return String(self[lowerBound...upperBound])
    }

    @inlinable @inline(__always)
    subscript(bounds: Range<Int>) -> String {
        let lowerBound = index(startIndex, offsetBy: bounds.lowerBound)
        let upperBound = index(startIndex, offsetBy: bounds.upperBound)
        return String(self[lowerBound..<upperBound])
    }

    @inlinable @inline(__always)
    subscript(bounds: PartialRangeFrom<Int>) -> String {
        let lowerBound = index(startIndex, offsetBy: bounds.lowerBound)
        return String(self[lowerBound...])
    }

    @inlinable @inline(__always)
    subscript(bounds: PartialRangeUpTo<Int>) -> String {
        let upperBound = index(startIndex, offsetBy: bounds.upperBound)
        return String(self[..<upperBound])
    }

    @inlinable @inline(__always)
    subscript(bounds: PartialRangeThrough<Int>) -> String {
        let upperBound = index(startIndex, offsetBy: bounds.upperBound)
        return String(self[...upperBound])
    }
    
    
    @inlinable @inline(__always)
    subscript(offset: Int) -> Character {
        let index = index(startIndex, offsetBy: offset)
        return self[index]
    }
    
    @inlinable @inline(__always)
    subscript(safe offset: Int) -> Character? {
        guard (0..<count).contains(offset) else { return nil }
        return self[offset]
    }
    
}

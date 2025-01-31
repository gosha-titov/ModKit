public extension String {
    
    /// Creates a string that has no characters.
    @inlinable @inline(__always)
    static var empty: Self { String() }
    
    /// The non-breaking space string that prevents an automatic line break at its position.
    @inlinable @inline(__always)
    static var nonbreakingSpace: String { "\u{00A0}" }
    
    /// The string that is a thin space.
    @inlinable @inline(__always)
    static var thinSpace: String { "\u{2009}" }
    
    /// The string that is a space.
    @inlinable @inline(__always)
    static var space: String { "\u{0020}" }
    
    /// The new-line string (`"\n"`) that signifies the end of a line of text and the start of a new one.
    @inlinable @inline(__always)
    static var newline: String { "\u{000A}" }
    
    /// The string that is a tab (`"\t"`).
    @inlinable @inline(__always)
    static var tab: String { "\u{0009}" }
    
    
    // MARK: Methods
    
    /// Returns a new string with the specified char appended.
    @inlinable @inline(__always)
    func appending(_ char: Character) -> String {
        return mutating(self) { $0.append(char) }
    }
    
    /// Returns a string containing characters this string and the given string have in common,
    /// starting from the ending of each up to the first characters that aren’t equivalent.
    ///
    ///     let str1 = "abcde"
    ///     let str2 = "abde"
    ///     str1.commonSuffix(with: str2) // "de"
    ///
    @inlinable @inline(__always)
    func commonSuffix(with str: String) -> String {
        var suffix = String()
        let min = min(count, str.count)
        let str1 = self.last(min)
        let str2 = str .last(min)
        for (char1, char2) in zip(str1, str2).reversed() {
            guard char1 == char2 else { break }
            suffix.append(char1)
        }
        return String(suffix.reversed())
    }
    
    
    /// Returns the first K elements of the string.
    ///
    ///     let str = "abcde"
    ///     str.first(3) // "abc"
    ///
    @inlinable @inline(__always)
    func first(_ k: Int) -> String {
        guard k > 0 else { return .empty }
        let k = k.clamped(to: 0...count)
        return self[0..<k]
    }
    
    /// Returns the last K elements of the string.
    ///
    ///     let str = "abcde"
    ///     str.last(3) // "cde"
    ///
    @inlinable @inline(__always)
    func last(_ k: Int) -> String {
        guard k > 0 else { return .empty }
        let k = k.clamped(to: 0...count)
        return self[(count - k)..<count]
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
    
    
    /// Returns an optional Int value converted from this string.
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

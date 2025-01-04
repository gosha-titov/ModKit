public extension String {
    
    /// Creates a string that has no characters.
    @inlinable static var empty: Self { String() }
    
    
    // MARK: Methods
    
    /// Returns a new string with the specified char appended.
    @inlinable func appending(_ char: Character) -> String {
        return mutating(self) { $0.append(char) }
    }
    
    /// Returns a string containing characters this string and the given string have in common,
    /// starting from the ending of each up to the first characters that aren’t equivalent.
    ///
    ///     let str1 = "abcde"
    ///     let str2 = "abde"
    ///     str1.commonSuffix(with: str2) // "de"
    ///
    @inlinable func commonSuffix(with str: String) -> String {
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
    @inlinable func first(_ k: Int) -> String {
        let k = k > count ? count : k
        var first = String()
        for i in 0..<k {
            first.append(self[i])
        }
        return first
    }
    
    /// Returns the last K elements of the string.
    ///
    ///     let str = "abcde"
    ///     str.last(3) // "cde"
    ///
    @inlinable func last(_ k: Int) -> String {
        let k = k > count ? count : k
        var last = String()
        for i in (count - k)..<count {
            last.append(self[i])
        }
        return last
    }
    
    
    /// Makes this string uppercase.
    ///
    ///     var str = "WorD"
    ///     str.uppercase() // "WORD"
    ///
    @inlinable mutating func uppercase() {
        self = uppercased()
    }
    
    /// Makes this string lowercase.
    ///
    ///     var str = "WorD"
    ///     str.lowercase() // "word"
    ///
    @inlinable mutating func lowercase() {
        self = lowercased()
    }
    
    
    /// Returns an optional Int value converted from this string.
    ///
    ///     let str = "213"
    ///     str.toInt // Optional(213)
    ///
    @inlinable func toInt() -> Int? { Int(self) }
    
    
    // MARK: Subscripts
    
    @inlinable subscript(bounds: ClosedRange<Int>) -> String {
        let lowerBound = index(startIndex, offsetBy: bounds.lowerBound)
        let upperBound = index(startIndex, offsetBy: bounds.upperBound)
        return String(self[lowerBound...upperBound])
    }

    @inlinable subscript(bounds: Range<Int>) -> String {
        let lowerBound = index(startIndex, offsetBy: bounds.lowerBound)
        let upperBound = index(startIndex, offsetBy: bounds.upperBound)
        return String(self[lowerBound..<upperBound])
    }

    @inlinable subscript(bounds: PartialRangeFrom<Int>) -> String {
        let lowerBound = index(startIndex, offsetBy: bounds.lowerBound)
        return String(self[lowerBound...])
    }

    @inlinable subscript(bounds: PartialRangeUpTo<Int>) -> String {
        let upperBound = index(startIndex, offsetBy: bounds.upperBound)
        return String(self[..<upperBound])
    }

    @inlinable subscript(bounds: PartialRangeThrough<Int>) -> String {
        let upperBound = index(startIndex, offsetBy: bounds.upperBound)
        return String(self[...upperBound])
    }
    
    @inlinable subscript(offset: Int) -> Character {
        let index = index(startIndex, offsetBy: offset)
        return self[index]
    }
    
    @inlinable subscript(safe offset: Int) -> Character? {
        guard (0..<count).contains(offset) else { return nil }
        return self[offset]
    }
    
}

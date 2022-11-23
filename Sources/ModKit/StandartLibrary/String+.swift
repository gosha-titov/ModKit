public extension String {
    
    // MARK: Properties
    
    /// An optional Int value converted from this string.
    ///
    ///     let str = "213"
    ///     str.toInt // Optional(213)
    ///
    var toInt: Int? { Int(self) }
    
    
    // MARK: Methods
    
    /// Returns a string containing characters this string and the given string have in common,
    /// starting from the ending of each up to the first characters that aren’t equivalent.
    ///
    ///     let str1 = "abcde"
    ///     let str2 = "abde"
    ///     str1.commonSuffix(with: str2) // "de"
    ///
    func commonSuffix(with str: String) -> String {
        var suffix = String()
        let min = min(count, str.count)
        let str1 = self.last(min)
        let str2 = str .last(min)
        for (char1, char2) in zip(str1, str2).reversed() {
            if char1 == char2 { suffix += char1 }
            else { break }
        }
        return String(suffix.reversed())
    }
    
    /// Returns the first K elements of the string.
    ///
    ///     let str = "abcde"
    ///     str.first(3) // "abc"
    ///
    func first(_ k: Int) -> String {
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
    func last(_ k: Int) -> String {
        let k = k > count ? count : k
        var last = String()
        for i in (count - k)..<count {
            last.append(self[i])
        }
        return last
    }
    
    /// Returns the capitalized version of the string.
    ///
    ///     let str = "woRd"
    ///     str.capitalized() // "Word"
    ///
    func capitalized() -> String {
        return prefix(1).uppercased() + self.dropFirst().lowercased()
    }
    
    /// Leads the string to capitalized.
    ///
    ///     var str = "woRd"
    ///     str.capitalize() // "Word"
    ///
    mutating func capitalize() -> Void {
        self = capitalized()
    }
    
    /// Leads the string to uppercase.
    ///
    ///     var str = "WorD"
    ///     str.uppercase() // "WORD"
    ///
    mutating func uppercase() -> Void {
        self = uppercased()
    }
    
    /// Leads the string to lowercase.
    ///
    ///     var str = "WorD"
    ///     str.lowercase() // "word"
    ///
    mutating func lowercase() -> Void {
        self = lowercased()
    }
    
    
    // MARK: Operations
    
    static func += (lhs: inout String, rhs: Character) -> Void {
        lhs = lhs + String(rhs)
    }
    
    static func + (lhs: String, rhs: Character) -> String {
        return lhs + String(rhs)
    }
    
    static func + (lhs: Character, rhs: String) -> String {
        return String(lhs) + rhs
    }
    
    
    // MARK: Subscripts
    
    subscript(bounds: ClosedRange<Int>) -> String {
        let lowerBound = index(startIndex, offsetBy: bounds.lowerBound)
        let upperBound = index(startIndex, offsetBy: bounds.upperBound)
        return String(self[lowerBound...upperBound])
    }

    subscript(bounds: Range<Int>) -> String {
        let lowerBound = index(startIndex, offsetBy: bounds.lowerBound)
        let upperBound = index(startIndex, offsetBy: bounds.upperBound)
        return String(self[lowerBound..<upperBound])
    }

    subscript(bounds: PartialRangeFrom<Int>) -> String {
        let lowerBound = index(startIndex, offsetBy: bounds.lowerBound)
        return String(self[lowerBound...])
    }

    subscript(bounds: PartialRangeUpTo<Int>) -> String {
        let upperBound = index(startIndex, offsetBy: bounds.upperBound)
        return String(self[..<upperBound])
    }

    subscript(bounds: PartialRangeThrough<Int>) -> String {
        let upperBound = index(startIndex, offsetBy: bounds.upperBound)
        return String(self[...upperBound])
    }
    
    subscript(offset: Int) -> Character {
        let index = index(startIndex, offsetBy: offset)
        return self[index]
    }
    
}

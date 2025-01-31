#if canImport(Foundation)

import Foundation

public extension String {
    
    /// A Boolean value that indicates whether this string contains only digits.
    ///
    ///     "123".containsOnlyDigits // true
    ///     "12a".containsOnlyDigits // false
    ///
    /// - Note: The empty string is considered to satisfy this condition, so the value is `true`.
    @inlinable @inline(__always)
    var containsOnlyDigits: Bool {
        let digitsSet = CharacterSet.decimalDigits
        let stringSet = CharacterSet(charactersIn: self)
        return digitsSet.isSuperset(of: stringSet)
    }
    
    /// A boolean value that indicates whether this string contains only spaces.
    ///
    ///     "   ".containsOnlySpaces // true
    ///     " a ".containsOnlySpaces // false
    ///
    /// - Note: The empty string is considered to satisfy this condition, so the value is `true`.
    @inlinable @inline(__always)
    var containsOnlySpaces: Bool {
        let characterSet = CharacterSet.whitespaces
        for char in unicodeScalars where characterSet.contains(char) {
            return false
        }
        return true
    }
    
    /// A boolean value that indicates whether this string is a valid e-mail.
    ///
    ///     "my.email@mod.kit".isValidEmail // true
    ///
    @inlinable @inline(__always)
    var isValidEmail: Bool {
        let regex = "[A-Z0-9a-z._-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        return matches(regex)
    }
    
    /// Returns a new string without spaces and new lines on the sides.
    ///
    ///     let str = "  Hello, world! \n"
    ///     str.trimmed // "Hello, world!"
    ///
    @inlinable @inline(__always)
    var trimmed: String {
        return trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
     
    // MARK: Methods
    
    /// Makes this string capitalized.
    ///
    ///     var str = "woRd"
    ///     str.capitalize() // "Word"
    ///
    @inlinable @inline(__always)
    mutating func capitalize() {
        self = capitalized
    }
    
    /// Removes spaces and new lines on the sides.
    ///
    ///     var str = "  Hello, world! \n"
    ///     str.trim() // "Hello, world!"
    ///
    @inlinable @inline(__always)
    mutating func trim() -> Void {
        self = trimmed
    }
    
    /// Returns `true` if this string matches the given regex; otherwise, `false`.
    @inlinable @inline(__always)
    func matches(_ regex: String) -> Bool {
        return NSPredicate(format: "SELF MATCHES %@", regex).evaluate(with: self)
    }
    
    
    /// Returns an NSAttributedString value converted from this string value.
    ///
    ///     let attributedString = "Hello!"
    ///         .toNSAttributedString()
    ///         .applying(font: .title3)
    ///
    @inlinable @inline(__always)
    func toNSAttributedString() -> NSAttributedString {
        return NSAttributedString(string: self)
    }
    
}

#endif

import Foundation

public extension String {
    
    // MARK: Properties
    
    /// A NSAttributedString value converted from this string value.
    ///
    ///     let attributedString = "text".toNSAttributedString
    ///
    var toNSAttributedString: NSAttributedString {
        return NSAttributedString(string: self)
    }
    
    /// A Boolean value that indicates whether this string contains only digits.
    ///
    ///     "123".containsOnlyDigits // true
    ///     "12a".containsOnlyDigits // false
    ///
    /// - Note: The empty string is considered to satisfy this condition, so the value is `true`.
    var containsOnlyDigits: Bool {
        let digitsSet = CharacterSet.decimalDigits
        let stringSet = CharacterSet(charactersIn: self)
        return digitsSet.isSuperset(of: stringSet)
    }
    
    /// A Boolean value that indicates whether this string contains only spaces.
    ///
    ///     "   ".containsOnlySpaces // true
    ///     " a ".containsOnlySpaces // false
    ///
    /// - Note: The empty string is considered to satisfy this condition, so the value is `true`.
    var containsOnlySpaces: Bool {
        for char in self where char != " " {
            return false
        }
        return true
    }
    
    /// A Boolean value that indicates whether this string is a valid e-mail.
    ///
    ///     "my.email@mod.kit".isEmail // true
    ///
    var isValidEmail: Bool {
        let regex = "[A-Z0-9a-z._-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        return matches(regex)
    }
    
    /// Returns a string without spaces and new lines on the sides.
    ///
    ///     let str = "  Hello, world! \n"
    ///     str.trimmed // "Hello, world!"
    ///
    var trimmed: String {
        return trimmingCharacters(in: .whitespacesAndNewlines)
    }
     
    // MARK: Methods
    
    /// Removes spaces and new lines on the sides.
    ///
    ///     var str = "  Hello, world! \n"
    ///     str.trim() // "Hello, world!"
    ///
    mutating func trim() -> Void { self = trimmed }
    
    /// Returns `true` if this string matches the given regex; otherwise, `false`.
    func matches(_ regex: String) -> Bool {
        return NSPredicate(format: "SELF MATCHES %@", regex).evaluate(with: self)
    }
    
}

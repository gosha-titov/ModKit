import Foundation

public extension String {
    
    // MARK: Properties
    
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
    
    /// Returns `true` if this string matches the given regex; otherwise, `false`.
    func matches(_ regex: String) -> Bool {
        return NSPredicate(format: "SELF MATCHES %@", regex).evaluate(with: self)
    }
    
    /// Removes spaces and new lines on the sides.
    ///
    ///     var str = "  Hello, world! \n"
    ///     str.trim() // "Hello, world!"
    ///
    mutating func trim() -> Void { self = trimmed }
    
}

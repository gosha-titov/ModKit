import Foundation

public extension NSAttributedString {
    
    /// A NSMutableAttributedString value converted from this NSAttributedString value.
    ///
    ///     let mutableString = attributedString.toNSMutableAttributedString
    ///
    var toNSMutableAttributedString: NSMutableAttributedString {
        return NSMutableAttributedString(attributedString: self)
    }
    
    /// Returns an attributed string with applied the given collection of attributes to the characters in the specified range.
    /// - Parameter attributes: A dictionary containing the attributes to add.
    /// Attribute keys can be supplied by another framework or can be custom ones you define.
    /// For information about the system-supplied attribute keys, see the Constants section in `NSAttributedString`.
    /// - Parameter range: The range of characters to which the specified attributes apply.
    /// If `nil` is specified, the given attributes are applied to the full string.
    func applying(_ attributes: [Key: Any], inRange: NSRange? = nil) -> NSAttributedString {
        guard !string.isEmpty else { return self }
        let range: NSRange
        if let inRange { range = inRange }
        else { range = .init(0..<length) }
        let mutableCopy = self.toNSMutableAttributedString
        mutableCopy.addAttributes(attributes, range: range)
        return mutableCopy
    }
    

    // MARK: Operations

    static func + (lhs: NSAttributedString, rhs: NSAttributedString) -> NSAttributedString {
        let mutableString = lhs.toNSMutableAttributedString
        mutableString.append(rhs)
        return mutableString
    }

    static func + (lhs: NSAttributedString, rhs: String) -> NSAttributedString {
        return lhs + rhs.toNSAttributedString
    }
    
    static func += (lhs: inout NSAttributedString, rhs: NSAttributedString) -> Void {
        let mutableString = lhs.toNSMutableAttributedString
        mutableString.append(rhs)
        lhs = mutableString
    }
    
    static func += (lhs: inout NSAttributedString, rhs: String) -> Void {
        lhs += rhs.toNSAttributedString
    }

}

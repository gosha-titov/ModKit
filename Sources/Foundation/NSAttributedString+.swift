import Foundation

public extension NSAttributedString {
    
    /// An NSMutableAttributedString value converted from this NSAttributedString value.
    ///
    ///     let mutableString = attributedString.mutable
    ///
    @inlinable var mutable: NSMutableAttributedString {
        return NSMutableAttributedString(attributedString: self)
    }
    
    /// Returns an attributed string with applied the given collection of attributes to the characters in the specified range.
    ///
    ///     let newString = attributedString.applying([
    ///         .strikethroughStyle: NSUnderlineStyle.single,
    ///         .strikethroughColor: UIColor.red,
    ///         .font: UIFont.boldSystemFont(ofSize: 16),
    ///         .backgroundColor: UIColor.orange,
    ///         .foregroundColor: UIColor.black,
    ///         .underlineColor: UIColor.blue,
    ///         .underlineStyle: 1,
    ///     ])
    ///
    /// - Parameter attributes: A dictionary containing the attributes to add.
    /// Attribute keys can be supplied by another framework or can be custom ones you define.
    /// For information about the system-supplied attribute keys, see the Constants section in `NSAttributedString`.
    /// - Parameter range: The range of characters to which the specified attributes apply.
    /// If `nil` is specified, the given attributes are applied to the full string.
    @inlinable func applying(_ attributes: [Key: Any], inRange range: NSRange? = nil) -> NSAttributedString {
        guard !string.isEmpty else { return self }
        let mutableCopy = mutable
        mutableCopy.apply(attributes, inRange: range)
        return mutableCopy
    }
    

    // MARK: Operators

    @inlinable static func + (lhs: NSAttributedString, rhs: NSAttributedString) -> NSAttributedString {
        let mutableString = lhs.mutable
        mutableString.append(rhs)
        return mutableString
    }
    
    @inlinable static func += (lhs: inout NSAttributedString, rhs: NSAttributedString) {
        let mutableString = lhs.mutable
        mutableString.append(rhs)
        lhs = mutableString
    }

}

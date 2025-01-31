#if canImport(Foundation)

import Foundation

public extension NSAttributedString {
    
    /// An NSMutableAttributedString value converted from this NSAttributedString value.
    ///
    ///     let mutableString = attributedString.mutable
    ///
    @inlinable @inline(__always)
    var mutable: NSMutableAttributedString {
        return NSMutableAttributedString(attributedString: self)
    }
    
    /// Returns an attributed string with applied the given collection of attributes to the characters in the specified range.
    ///
    ///     let newString = attributedString.applying([
    ///         .font: UIFont.boldSystemFont(ofSize: 16),
    ///         .backgroundColor: UIColor.orange,
    ///         .foregroundColor: UIColor.black,
    ///         .underlineStyle: NSUnderlineStyle.single,
    ///         .underlineColor: UIColor.blue,
    ///         .strikethroughColor: UIColor.red,
    ///         .strikethroughStyle: 1,
    ///     ])
    ///
    /// - Parameter attributes: A dictionary containing the attributes to add.
    /// Attribute keys can be supplied by another framework or can be custom ones you define.
    /// For information about the system-supplied attribute keys, see the Constants section in `NSAttributedString`.
    /// - Parameter range: The range of characters to which the specified attributes apply.
    /// If `nil` is specified, the given attributes are applied to the full string.
    @inlinable @inline(__always)
    func applying(_ attributes: [Key: Any], inRange range: NSRange? = nil) -> NSAttributedString {
        guard !string.isEmpty else { return self }
        return mutating(mutable) { $0.apply(attributes, inRange: range) }
    }
    

    // MARK: Operators

    @inlinable @inline(__always)
    static func + (lhs: NSAttributedString, rhs: NSAttributedString) -> NSAttributedString {
        return mutating(lhs.mutable) { $0.append(rhs) }
    }
    
    @inlinable @inline(__always)
    static func += (lhs: inout NSAttributedString, rhs: NSAttributedString) {
        lhs = mutating(lhs.mutable) { $0.append(rhs) }
    }

}

#endif

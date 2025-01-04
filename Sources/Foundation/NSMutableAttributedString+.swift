#if canImport(Foundation)

import Foundation

public extension NSMutableAttributedString {
    
    /// Applies the given collection of attributes to the characters in the specified range.
    ///
    ///     attributedString.apply([
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
    @inlinable func apply(_ attributes: [Key: Any], inRange range: NSRange? = nil) {
        guard !string.isEmpty else { return }
        let range: NSRange = if let range { range } else { NSRange(0..<length) }
        addAttributes(attributes, range: range)
    }
    
}

#endif

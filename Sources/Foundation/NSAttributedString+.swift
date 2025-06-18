#if canImport(Foundation)

import Foundation

public extension NSAttributedString {
    
    /// Creates an attributed string that has no characters.
    @inlinable @inline(__always)
    static var empty: NSAttributedString { .init() }
    
    /// Returns an attributed string that has only a non-breaking-space character.
    @inlinable @inline(__always)
    static var nonbreakingSpace: NSAttributedString {
        return NSAttributedString(string: .nonbreakingSpace)
    }
    
    /// Returns an attributed string that has only a thin-space character.
    @inlinable @inline(__always)
    static var thinspace: NSAttributedString {
        return NSAttributedString(string: .thinSpace)
    }
    
    /// Returns an attributed string that has only a space-character.
    @inlinable @inline(__always)
    static var space: NSAttributedString {
        return NSAttributedString(string: .space)
    }
    
    /// Returns an attributed string that has only a new-line character (`"\n"`).
    @inlinable @inline(__always)
    static var newline: NSAttributedString {
        return NSAttributedString(string: .newline)
    }
    
    /// Returns an attributed string that has only a tab character (`"\t"`).
    @inlinable @inline(__always)
    static var tab: NSAttributedString {
        return NSAttributedString(string: .tab)
    }
    
    
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
    ///         .font: UIFont.boldSystemFont(ofSize: 17),
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
        guard string.isEmpty == false else { return self }
        return mutating(mutable) { $0.apply(attributes, inRange: range) }
    }
    
    /// Returns an attributed string with the characters and attributes of a given attributed string added to the end of the receiver.
    @inlinable @inline(__always)
    func appending(_ otherAttributedString: NSAttributedString) -> NSAttributedString {
        return mutating(mutable) { $0.append(otherAttributedString) }
    }
    
    
    // MARK: Init
    
    /// Creates a new attributed string from the contents of other ones.
    @inlinable
    convenience init(concatenating attributedStrings: [NSAttributedString]) {
        guard let firstString = attributedStrings.first else {
            self.init(); return
        }
        guard attributedStrings.count > 1 else {
            self.init(attributedString: firstString); return
        }
        let mutableString = firstString.mutable
        for attributedString in attributedStrings[1...] {
            mutableString.append(attributedString)
        }
        self.init(attributedString: mutableString)
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

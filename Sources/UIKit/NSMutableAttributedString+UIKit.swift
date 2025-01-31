#if canImport(UIKit)

import UIKit

public extension NSMutableAttributedString {
    
    /// Applies an underline attribute with the given style and color in the specified range.
    /// - Parameter style: The underline style of the text.
    /// - Parameter color: The color of the underline.
    /// - Parameter range: The range of characters to which these attributes apply.
    /// If `nil` is specified,  these attributes are applied to the full string.
    @inlinable @inline(__always)
    func apply(underlineStyle style: NSUnderlineStyle, withColor color: UIColor, inRange range: NSRange? = nil) {
        apply([.underlineColor: color, .underlineStyle: style.rawValue], inRange: range)
    }
    
    /// Applies a strikethrough attribute with the given value and color in the specified range.
    /// - Parameter style: The strikethrough style of the text, that is, this is the integer that corresponds the line thickness.
    /// - Parameter color: The color of the strikethrough.
    /// - Parameter range: The range of characters to which these attributes apply.
    /// If `nil` is specified,  these attributes are applied to the full string.
    @inlinable @inline(__always)
    func apply(strikethroughStyle style: Int, withColor color: UIColor, inRange range: NSRange? = nil) {
        apply([.strikethroughStyle: style, .strikethroughColor: color], inRange: range)
    }
    
    /// Applies the given font attribute in the specified range.
    /// - Parameter font: The font of the text.
    /// - Parameter range: The range of characters to which this attribute applies.
    /// If `nil` is specified, this attribute is applied to the full string.
    @inlinable @inline(__always)
    func apply(font: UIFont, inRange range: NSRange? = nil) {
        apply([.font: font], inRange: range)
    }
    
    /// Applies a background attribute with the given color in the specified range.
    /// - Parameter backgroundColor: The color of the background behind the text.
    /// - Parameter range: The range of characters to which this attribute applies.
    /// If `nil` is specified, this attribute is applied to the full string.
    @inlinable @inline(__always)
    func apply(backgroundColor: UIColor, inRange range: NSRange? = nil) {
        apply([.backgroundColor: backgroundColor], inRange: range)
    }
    
    /// Applies a foreground attribute with the given color in the specified range.
    /// - Parameter foregroundColor: The color of the text.
    /// - Parameter range: The range of characters to which this attribute applies.
    /// If `nil` is specified, this attribute is applied to the full string.
    @inlinable @inline(__always)
    func apply(foregroundColor: UIColor, inRange range: NSRange? = nil) {
        apply([.foregroundColor: foregroundColor], inRange: range)
    }
    
    /// Applies the given shadow attribute in the specified range.
    /// - Parameter shadow: The shadow of the text.
    /// - Parameter range: The range of characters to which this attribute applies.
    /// If `nil` is specified, this attribute is applied to the full string.
    @inlinable @inline(__always)
    func apply(shadow: NSShadow, inRange range: NSRange? = nil) {
        apply([.shadow: shadow], inRange: range)
    }
    
}

#endif

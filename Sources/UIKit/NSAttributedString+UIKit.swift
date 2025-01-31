#if canImport(UIKit)

import UIKit

public extension NSAttributedString {
    
    /// Returns an attributed string with applied an underline attribute with the given style and color in the specified range.
    /// - Parameter style: The underline style of the text.
    /// - Parameter color: The color of the underline.
    /// - Parameter range: The range of characters to which these attributes apply.
    /// If `nil` is specified,  these attributes are applied to the full string.
    @inlinable @inline(__always)
    func applying(underlineStyle style: NSUnderlineStyle, withColor color: UIColor, inRange range: NSRange? = nil) -> NSAttributedString {
        return applying([.underlineColor: color, .underlineStyle: style.rawValue], inRange: range)
    }
    
    /// Returns an attributed string with applied a strikethrough attribute with the given value and color in the specified range.
    /// - Parameter style: The strikethrough style of the text, that is, this is the integer that corresponds the line thickness.
    /// - Parameter color: The color of the strikethrough.
    /// - Parameter range: The range of characters to which these attributes apply.
    /// If `nil` is specified,  these attributes are applied to the full string.
    @inlinable @inline(__always)
    func applying(strikethroughStyle style: Int, withColor color: UIColor, inRange range: NSRange? = nil) -> NSAttributedString {
        return applying([.strikethroughStyle: style, .strikethroughColor: color], inRange: range)
    }
    
    /// Returns an attributed string with applied the given font attribute in the specified range.
    /// - Parameter font: The font of the text.
    /// - Parameter range: The range of characters to which this attribute applies.
    /// If `nil` is specified, this attribute is applied to the full string.
    @inlinable @inline(__always)
    func applying(font: UIFont, inRange range: NSRange? = nil) -> NSAttributedString {
        return applying([.font: font], inRange: range)
    }
    
    /// Returns an attributed string with applied a background attribute with the given color in the specified range.
    /// - Parameter backgroundColor: The color of the background behind the text.
    /// - Parameter range: The range of characters to which this attribute applies.
    /// If `nil` is specified, this attribute is applied to the full string.
    @inlinable @inline(__always)
    func applying(backgroundColor: UIColor, inRange range: NSRange? = nil) -> NSAttributedString {
        return applying([.backgroundColor: backgroundColor], inRange: range)
    }
    
    /// Returns an attributed string with applied a foreground attribute with the given color in the specified range.
    /// - Parameter foregroundColor: The color of the text.
    /// - Parameter range: The range of characters to which this attribute applies.
    /// If `nil` is specified, this attribute is applied to the full string.
    @inlinable @inline(__always)
    func applying(foregroundColor: UIColor, inRange range: NSRange? = nil) -> NSAttributedString {
        return applying([.foregroundColor: foregroundColor], inRange: range)
    }
    
    /// Returns an attributed string with applied the given shadow attribute in the specified range.
    /// - Parameter shadow: The shadow of the text.
    /// - Parameter range: The range of characters to which this attribute applies.
    /// If `nil` is specified, this attribute is applied to the full string.
    @inlinable @inline(__always)
    func applying(shadow: NSShadow, inRange range: NSRange? = nil) -> NSAttributedString {
        return applying([.shadow: shadow], inRange: range)
    }
    
    
    /// Calculates the width for the container rectangle necessary to draw the string.
    @inlinable @inline(__always)
    func width(basedOn containerHeight: CGFloat) -> CGFloat {
        let rect = boundingRect(
            with: CGSize(width: .greatestFiniteMagnitude, height: containerHeight),
            options: [.usesLineFragmentOrigin, .usesFontLeading],
            context: nil
        )
        return ceil(rect.size.width)
    }
    
    /// Calculates the height for the container rectangle necessary to draw the string.
    @inlinable @inline(__always)
    func height(basedOn containerWidth: CGFloat) -> CGFloat {
        let rect = boundingRect(
            with: CGSize(width: containerWidth, height: .greatestFiniteMagnitude),
            options: [.usesLineFragmentOrigin, .usesFontLeading],
            context: nil
        )
        return ceil(rect.size.height)
    }
    
}

#endif

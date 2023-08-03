#if canImport(UIKit)
import UIKit

public extension NSAttributedString {
    
    /// Returns an attributed string with applied an underline attribute with the given color and style in the specified range.
    /// - Parameter color: The color of the underline.
    /// - Parameter style: The underline style of the text.
    /// - Parameter range: The range of characters to which the specified attributes apply.
    /// If `nil` is specified, the given attributes are applied to the full string.
    func underlined(withColor color: UIColor, andStyle style: NSUnderlineStyle = .single, inRange range: NSRange? = nil) -> NSAttributedString {
        return applying([.underlineColor: color, .underlineStyle: style.rawValue], inRange: range)
    }
    
}

#endif

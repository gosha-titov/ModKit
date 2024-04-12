#if canImport(UIKit)

import UIKit

public extension UIFont {
    
    /// Returns an instance of the system font with a specific weight for the specified text style with scaling for the user's selected content size category.
    /// - Parameter style: The text style for which to return a font. See `UIFont.TextStyle` for recognized values.
    /// - Parameter weight: The weight of the preffered font. See `UIFont.Weight` for recognized values.
    /// - Parameter italic: The boolean value indicating whether the font has an italic style.
    /// - Returns: The system font associated with the specified text style.
    @inlinable static func preferredFont(forTextStyle style: TextStyle, withWeight weight: Weight, italic: Bool = false) -> UIFont {
        let traits = UITraitCollection(preferredContentSizeCategory: .large)
        let descriptor = UIFontDescriptor.preferredFontDescriptor(withTextStyle: style, compatibleWith: traits)
        var font = UIFont.systemFont(ofSize: descriptor.pointSize, weight: weight)
        if italic == true {
            let italicTrait = UIFontDescriptor.SymbolicTraits([.traitItalic])
            let otherTraits = font.fontDescriptor.symbolicTraits
            if let descriptor = font.fontDescriptor.withSymbolicTraits(italicTrait.union(otherTraits)) {
                font = UIFont(descriptor: descriptor, size: .zero)
            }
        }
        let metrics = UIFontMetrics(forTextStyle: style)
        return metrics.scaledFont(for: font)
    }
}

#endif

#if canImport(UIKit)

import UIKit

public extension UIFont {
    
    /// Returns an instance of the system font with the default size and specified weight for for large titles.
    /// - Parameter weight: The weight of the preffered font. See `UIFont.Weight` for recognized values.
    /// - Parameter italic: The boolean value indicating whether the font has an italic style.
    @inlinable @inline(__always)
    static func largeTitle(withWeight weight: Weight = .regular, italic: Bool = false) -> UIFont {
        let font: UIFont = .systemFont(ofSize: 34, weight: weight)
        return if italic { font.withItalicTrait() } else { font }
    }
    
    /// Returns an instance of the system font with the default size and specified weight for for first-level hierarchical headings.
    /// - Parameter weight: The weight of the preffered font. See `UIFont.Weight` for recognized values.
    /// - Parameter italic: The boolean value indicating whether the font has an italic style.
    @inlinable @inline(__always)
    static func title1(withWeight weight: Weight = .regular, italic: Bool = false) -> UIFont {
        let font: UIFont = .systemFont(ofSize: 28, weight: weight)
        return if italic { font.withItalicTrait() } else { font }
    }
    
    /// Returns an instance of the system font with the default size and specified weight for for second-level hierarchical headings.
    /// - Parameter weight: The weight of the preffered font. See `UIFont.Weight` for recognized values.
    /// - Parameter italic: The boolean value indicating whether the font has an italic style.
    @inlinable @inline(__always)
    static func title2(withWeight weight: Weight = .regular, italic: Bool = false) -> UIFont {
        let font: UIFont = .systemFont(ofSize: 22, weight: weight)
        return if italic { font.withItalicTrait() } else { font }
    }
    
    /// Returns an instance of the system font with the default size and specified weight for for third-level hierarchical headings.
    /// - Parameter weight: The weight of the preffered font. See `UIFont.Weight` for recognized values.
    /// - Parameter italic: The boolean value indicating whether the font has an italic style.
    @inlinable @inline(__always)
    static func title3(withWeight weight: Weight = .regular, italic: Bool = false) -> UIFont {
        let font: UIFont = .systemFont(ofSize: 20, weight: weight)
        return if italic { font.withItalicTrait() } else { font }
    }
    
    /// Returns an instance of the system font with the default size and specified weight for headings.
    /// - Parameter weight: The weight of the preffered font. See `UIFont.Weight` for recognized values.
    /// - Parameter italic: The boolean value indicating whether the font has an italic style.
    @inlinable @inline(__always)
    static func headline(withWeight weight: Weight = .semibold, italic: Bool = false) -> UIFont {
        let font: UIFont = .systemFont(ofSize: 17, weight: weight)
        return if italic { font.withItalicTrait() } else { font }
    }
    
    /// Returns an instance of the system font with the default size and specified weight for body text.
    /// - Parameter weight: The weight of the preffered font. See `UIFont.Weight` for recognized values.
    /// - Parameter italic: The boolean value indicating whether the font has an italic style.
    @inlinable @inline(__always)
    static func body(withWeight weight: Weight = .regular, italic: Bool = false) -> UIFont {
        let font: UIFont = .systemFont(ofSize: 17, weight: weight)
        return if italic { font.withItalicTrait() } else { font }
    }
    
    /// Returns an instance of the system font with the default size and specified weight for callouts.
    /// - Parameter weight: The weight of the preffered font. See `UIFont.Weight` for recognized values.
    /// - Parameter italic: The boolean value indicating whether the font has an italic style.
    @inlinable @inline(__always)
    static func callout(withWeight weight: Weight = .regular, italic: Bool = false) -> UIFont {
        let font: UIFont = .systemFont(ofSize: 16, weight: weight)
        return if italic { font.withItalicTrait() } else { font }
    }
    
    /// Returns an instance of the system font with the default size and specified weight for subheadings.
    /// - Parameter weight: The weight of the preffered font. See `UIFont.Weight` for recognized values.
    /// - Parameter italic: The boolean value indicating whether the font has an italic style.
    @inlinable @inline(__always)
    static func subheadline(withWeight weight: Weight = .regular, italic: Bool = false) -> UIFont {
        let font: UIFont = .systemFont(ofSize: 15, weight: weight)
        return if italic { font.withItalicTrait() } else { font }
    }
    
    /// Returns an instance of the system font with the default size and specified weight for footnotes.
    /// - Parameter weight: The weight of the preffered font. See `UIFont.Weight` for recognized values.
    /// - Parameter italic: The boolean value indicating whether the font has an italic style.
    @inlinable @inline(__always)
    static func footnone(withWeight weight: Weight = .regular, italic: Bool = false) -> UIFont {
        let font: UIFont = .systemFont(ofSize: 13, weight: weight)
        return if italic { font.withItalicTrait() } else { font }
    }
    
    /// Returns an instance of the system font with the default size and specified weight for standard captions.
    /// - Parameter weight: The weight of the preffered font. See `UIFont.Weight` for recognized values.
    /// - Parameter italic: The boolean value indicating whether the font has an italic style.
    @inlinable @inline(__always)
    static func caption1(withWeight weight: Weight = .regular, italic: Bool = false) -> UIFont {
        let font: UIFont = .systemFont(ofSize: 12, weight: weight)
        return if italic { font.withItalicTrait() } else { font }
    }
    
    /// Returns an instance of the system font with the default size and specified weight for alternate captions.
    /// - Parameter weight: The weight of the preffered font. See `UIFont.Weight` for recognized values.
    /// - Parameter italic: The boolean value indicating whether the font has an italic style.
    @inlinable @inline(__always)
    static func caption2(withWeight weight: Weight = .regular, italic: Bool = false) -> UIFont {
        let font: UIFont = .systemFont(ofSize: 11, weight: weight)
        return if italic { font.withItalicTrait() } else { font }
    }
    
    /// Returns an instance of the system font with a specific weight for the specified text style with scaling for the user's selected content size category.
    /// - Parameter style: The text style for which to return a font. See `UIFont.TextStyle` for recognized values.
    /// - Parameter weight: The weight of the preffered font. See `UIFont.Weight` for recognized values.
    /// - Parameter italic: The boolean value indicating whether the font has an italic style.
    /// - Returns: The system font associated with the specified text style.
    @inlinable @inline(__always)
    static func preferredFont(forTextStyle style: TextStyle, withWeight weight: Weight, italic: Bool = false) -> UIFont {
        let traits = UITraitCollection(preferredContentSizeCategory: .large)
        let descriptor = UIFontDescriptor.preferredFontDescriptor(withTextStyle: style, compatibleWith: traits)
        var font = UIFont.systemFont(ofSize: descriptor.pointSize, weight: weight)
        if italic == true {
            font = font.withItalicTrait()
        }
        let metrics = UIFontMetrics(forTextStyle: style)
        return metrics.scaledFont(for: font)
    }
    
    
    /// Returns a font object that is the same as the font, but has the italic trait.
    @inlinable @inline(__always)
    func withItalicTrait() -> UIFont {
        let italicTrait = UIFontDescriptor.SymbolicTraits([.traitItalic])
        let otherTraits = fontDescriptor.symbolicTraits
        if let descriptor = fontDescriptor.withSymbolicTraits(italicTrait.union(otherTraits)) {
            return UIFont(descriptor: descriptor, size: pointSize)
        }
        return self
    }
    
}


#endif

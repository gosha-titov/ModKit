#if canImport(UIKit)

import UIKit

public extension UIColor {
    
    /// Creates a random color where the alpha component is equal to `1.0`.
    @inlinable @inline(__always)
    static var random: UIColor {
        return UIColor(
            red:   CGFloat.random(in: 0...1.0),
            green: CGFloat.random(in: 0...1.0),
            blue:  CGFloat.random(in: 0...1.0),
            alpha: 1.0
        )
    }
    
    /// A color that is specified for the light mode.
    ///
    /// The color is created by using the `UITraitCollection.current` but with specified `.light` value for the `userInterfaceStyle` property.
    @inlinable @inline(__always)
    var lightModeColor: UIColor {
        let traitCollection: UITraitCollection
        if #available(iOS 17, *){
            traitCollection = UITraitCollection.current.modifyingTraits { traits in
                traits.userInterfaceStyle = .light
            }
        } else {
            traitCollection = UITraitCollection(traitsFrom: [.current, UITraitCollection(userInterfaceStyle: .light)])
        }
        return resolvedColor(with: traitCollection)
    }
    
    /// A color that is specified for the dark mode.
    ///
    /// The color is created by using the `UITraitCollection.current` but with specified `.dark` value for the `userInterfaceStyle` property.
    @inlinable @inline(__always)
    var darkModeColor: UIColor {
        let traitCollection: UITraitCollection
        if #available(iOS 17, *){
            traitCollection = UITraitCollection.current.modifyingTraits { traits in
                traits.userInterfaceStyle = .dark
            }
        } else {
            traitCollection = UITraitCollection(traitsFrom: [.current, UITraitCollection(userInterfaceStyle: .dark)])
        }
        return resolvedColor(with: traitCollection)
    }
    
    
    // MARK: Methods
    
    /// Creates a dynamic color object that has two colors that are dynamically provided for the light and dark modes.
    ///
    ///     let color: UIColor = .dynamic(light: .white, dark: .black)
    ///
    @inlinable @inline(__always)
    static func dynamic(light lightColor: UIColor, dark darkColor: UIColor) -> UIColor {
        return UIColor { (traitCollection: UITraitCollection) -> UIColor in
            return traitCollection.userInterfaceStyle == .dark ? darkColor : lightColor
        }
    }
    
    /// Returns a CGColor value converted from this UIColor value.
    @inlinable @inline(__always)
    func toCGColor() -> CGColor { cgColor }
    
    
    // MARK: Init
    
    /// Creates a color object using the specified hex value.
    ///
    ///     let color = UIColor(hex: 0xC7508B)
    ///
    @inlinable @inline(__always)
    convenience init(hex value: Int, alpha: CGFloat = 1.0) {
        self.init(
            red:   CGFloat((value & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((value & 0x00FF00) >> 8) / 255.0,
            blue:  CGFloat(value & 0x0000FF) / 255.0,
            alpha: alpha
        )
    }
    
    /// Creates a color object using the specified hex string.
    ///
    ///     let color = UIColor(hex: "#C7508B")
    ///
    @inlinable @inline(__always)
    convenience init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt64()
        Scanner(string: hex).scanHexInt64(&int)
        let red, green, blue, alpha: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (red, green, blue, alpha) = ((int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17, 255)
        case 6: // RGB (24-bit)
            (red, green, blue, alpha) = (int >> 16, int >> 8 & 0xFF, int & 0xFF, 255)
        case 8: // ARGB (32-bit)
            (red, green, blue, alpha) = (int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF, int >> 24)
        default:
            (red, green, blue, alpha) = (0, 0, 0, 255)
        }
        self.init(
            red:   CGFloat(red)   / 255,
            green: CGFloat(green) / 255,
            blue:  CGFloat(blue)  / 255,
            alpha: CGFloat(alpha) / 255
        )
    }
    
}

#endif

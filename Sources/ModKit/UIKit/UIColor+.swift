#if canImport(UIKit)

import UIKit

public extension UIColor {
    
    // MARK: Properties
    
    /// A random color where alpha is equal to `1.0`.
    static var random: UIColor {
        return UIColor(
            red:   CGFloat.random(in: 0...1.0),
            green: CGFloat.random(in: 0...1.0),
            blue:  CGFloat.random(in: 0...1.0),
            alpha: 1.0
        )
    }
    
    /// A CGColor value converted from this UIColor value.
    var toCGColor: CGColor { cgColor }
    
    
    // MARK: Init
    
    /// Creates a color object using the specified hex.
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

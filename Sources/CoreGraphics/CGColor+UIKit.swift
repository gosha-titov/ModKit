#if canImport(UIKit)

import UIKit

public extension CGColor {
    
    /// Returns a color object that can be used in a mask layer as opaque.
    ///
    ///     let fadeLayer = CAGradientLayer()
    ///     let colors: [CGColor] = [.opaque, .transparent]
    ///     fadeLayer.colors = colors
    ///     ...
    ///     layer.mask = fadeLayer
    ///
    @inlinable @inline(__always)
    static var opaque: CGColor {
        return UIColor.white.toCGColor()
    }
    
    /// Returns a color object that can be used in a mask layer as transparent.
    ///
    ///     let fadeLayer = CAGradientLayer()
    ///     let colors: [CGColor] = [.opaque, .transparent]
    ///     fadeLayer.colors = colors
    ///     ...
    ///     layer.mask = fadeLayer
    ///
    @inlinable @inline(__always)
    static var transparent: CGColor {
        return UIColor.white.withAlphaComponent(0).toCGColor()
    }
    
    /// Returns a UIColor value converted from this CGColor value.
    @inlinable @inline(__always)
    func toUIColor() -> UIColor { UIColor(cgColor: self) }
    
}

#endif

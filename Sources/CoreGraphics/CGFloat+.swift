#if canImport(CoreGraphics)

import CoreGraphics

public extension CGFloat {
    
    /// The floating-point value equal to `1`.
    ///
    ///     // Usage example
    ///     UIView.animate(withDuration: 0.1) {
    ///         self.label.alpha = .opaque
    ///         // self.label.alpha = 1
    ///     }
    ///
    @inlinable @inline(__always)
    static var opaque: CGFloat { 1 }
    
    /// The floating-point value equal to `0`.
    ///
    ///     // Usage example
    ///     UIView.animate(withDuration: 0.1) {
    ///         self.label.alpha = .transparent
    ///         // self.label.alpha = 0
    ///     }
    ///
    @inlinable @inline(__always)
    static var transparent: CGFloat { 0 }
    
}

#endif

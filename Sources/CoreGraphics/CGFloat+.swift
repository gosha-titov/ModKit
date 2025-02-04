#if canImport(CoreGraphics)

import CoreGraphics

public extension CGFloat {
    
    /// The value equal to `1`.
    ///
    ///     view.alpha = .opaque
    ///     // view.alpha = 1
    ///
    @inlinable @inline(__always)
    static var opaque: CGFloat {
        return 1
    }
    
    /// The value equal to `0`.
    ///
    ///     view.alpha = .clear
    ///     // view.alpha = 0
    ///
    @inlinable @inline(__always)
    static var clear: CGFloat {
        return 0
    }
    
}

#endif

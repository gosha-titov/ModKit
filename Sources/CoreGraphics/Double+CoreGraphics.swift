#if canImport(CoreGraphics)

import CoreGraphics

public extension Double {
    
    /// Returns a CGFloat value converted from this double value.
    ///
    ///     let number = Double(13.24)
    ///     number.toCGFloat() // CGFloat(13.24)
    ///
    @inlinable @inline(__always)
    func toCGFloat() -> CGFloat { CGFloat(self) }

}

#endif

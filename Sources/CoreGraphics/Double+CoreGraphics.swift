#if canImport(CoreGraphics)

import CoreGraphics

public extension Double {
    
    /// Returns a CGFloat value converted from this double value.
    ///
    ///     let number = Double(13.24)
    ///     number.toCGFloat() // CGFloat(13.24)
    ///
    @inlinable func toCGFloat() -> CGFloat {
        return CGFloat(self)
    }

}

#endif

#if canImport(Foundation)

import Foundation

public extension FloatingPoint {
    
    /// Returns a floating-point value rounded up to the smallest integer greater than or equal to the number.
    ///
    ///     let value = 123.456
    ///     value.ceil // 124.0
    ///
    @inlinable @inline(__always)
    var ceil: Self {
        return Foundation.ceil(self)
    }
    
    /// Returns a floating-point value rounded down to the largest integer less than or equal to the number.
    ///
    ///     let value = 123.456
    ///     value.floor // 123.0
    ///
    @inlinable @inline(__always)
    var floor: Self {
        return Foundation.floor(self)
    }
    
}

#endif

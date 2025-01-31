#if canImport(UIKit)

import UIKit

public extension CGColor {
    
    /// Return a UIColor value converted from this CGColor value.
    @inlinable @inline(__always)
    func toUIColor() -> UIColor { UIColor(cgColor: self) }
    
}

#endif

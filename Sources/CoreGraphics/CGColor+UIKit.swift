#if canImport(UIKit)

import UIKit

public extension CGColor {
    
    /// Return a UIColor value converted from this CGColor value.
    @inlinable func toUIColor() -> UIColor {
        return UIColor(cgColor: self)
    }
    
}

#endif

#if canImport(UIKit)

import UIKit

public extension CGColor {
    
    /// A UIColor value converted from this CGColor value.
    @inlinable var toUIColor: UIColor { UIColor(cgColor: self) }
    
}

#endif

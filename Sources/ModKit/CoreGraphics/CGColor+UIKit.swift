#if canImport(UIKit)

import UIKit

public extension CGColor {
    
    /// A UIColor value converted from this CGColor value.
    var toUIColor: UIColor { UIColor(cgColor: self) }
    
}

#endif

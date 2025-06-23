#if canImport(UIKit)

import UIKit

public extension UIEdgeInsets {
    
    /// Returns a sum of the top and bottom edge insets' values.
    ///
    ///     let availableHeight = bounds.height - padding.vertical
    ///
    ///     // The same as above:
    ///     let availableHeight = bounds.height - (padding.top + padding.bottom)
    ///
    @inlinable @inline(__always)
    var vertical: CGFloat {
        return top + bottom
    }
    
    /// Returns a sum of the left and right edge insets' values.
    ///
    ///     let availableWidth = bounds.width - padding.horizontal
    ///
    ///     // The same as above:
    ///     let availableWidth = bounds.width - (padding.left + padding.right)
    ///
    @inlinable @inline(__always)
    var horizontal: CGFloat {
        return left + right
    }
    
    
    // MARK: Inits
    
    /// Creates an edge insets structure with the specified paired edges.
    ///
    ///     let padding = UIEdgeInsets(vertical: 16, horizontal: 8)
    ///     // UIEdgeInsets(top: 16, left: 8, bottom: 16, right: 8)
    ///
    @inlinable @inline(__always)
    init(vertical: CGFloat, horizontal: CGFloat) {
        self.init(top: vertical, left: horizontal, bottom: vertical, right: horizontal)
    }
    
    /// Creates an edge insets structure with the specified common inset.
    ///
    ///     let padding = UIEdgeInsets(inset: 8)
    ///     // UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
    ///
    @inlinable @inline(__always)
    init(inset: CGFloat) {
        self.init(top: inset, left: inset, bottom: inset, right: inset)
    }
    
}

#endif

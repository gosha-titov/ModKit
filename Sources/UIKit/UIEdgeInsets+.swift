#if canImport(UIKit)

import UIKit

public extension UIEdgeInsets {
    
    /// Returns a sum of the top and bottom edge insets' values.
    ///
    ///     let availableHeight = view.height - padding.topAndBottom
    ///
    ///     // The same as above:
    ///     let availableHeight = view.height - (padding.top + padding.bottom)
    ///
    @inlinable @inline(__always)
    var topAndBottom: CGFloat {
        return top + bottom
    }
    
    /// Returns a sum of the left and right edge insets' values.
    ///
    ///     let availableWidth = view.width - padding.leftAndRight
    ///
    ///     // The same as above:
    ///     let availableWidth = view.width - (padding.left + padding.right)
    ///
    @inlinable @inline(__always)
    var leftAndRight: CGFloat {
        return left + right
    }
    
    
    // MARK: Inits
    
    /// Creates an edge insets structure with the specified paired edges.
    ///
    ///     let insets = UIEdgeInsets(topAndBottom: 16, leftAndRight: 8)
    ///     // UIEdgeInsets(top: 16, left: 8, bottom: 16, right: 8)
    ///
    @inlinable @inline(__always)
    init(topAndBottom: CGFloat, leftAndRight: CGFloat) {
        self.init(top: topAndBottom, left: leftAndRight, bottom: topAndBottom, right: leftAndRight)
    }
    
    /// Creates an edge insets structure with the specified common inset.
    ///
    ///     let insets = UIEdgeInsets(8)
    ///     // UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
    ///
    @inlinable @inline(__always)
    init(_ inset: CGFloat) {
        self.init(top: inset, left: inset, bottom: inset, right: inset)
    }
    
}

#endif

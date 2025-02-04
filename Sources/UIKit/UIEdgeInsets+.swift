#if canImport(UIKit)

import UIKit

public extension UIEdgeInsets {
    
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

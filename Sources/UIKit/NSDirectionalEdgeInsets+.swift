#if canImport(UIKit)

import UIKit

public extension NSDirectionalEdgeInsets {
    
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
    
    /// Returns a sum of the leading and trailing edge insets' values.
    ///
    ///     let availableWidth = bounds.width - padding.horizontal
    ///
    ///     // The same as above:
    ///     let availableWidth = bounds.width - (padding.leading + padding.trailing)
    ///
    @inlinable @inline(__always)
    var horizontal: CGFloat {
        return leading + trailing
    }
    
    
    // MARK: Init
    
    /// Creates an edge insets structure with the specified paired edges.
    ///
    ///     let padding = NSDirectionalEdgeInsets(vertical: 16, horizontal: 8)
    ///     // NSDirectionalEdgeInsets(top: 16, leading: 8, bottom: 16, trailing: 8)
    ///
    @inlinable @inline(__always)
    init(vertical: CGFloat, horizontal: CGFloat) {
        self.init(top: vertical, leading: horizontal, bottom: vertical, trailing: horizontal)
    }
    
    /// Creates an edge insets structure with the specified common inset.
    ///
    ///     let padding = NSDirectionalEdgeInsets(inset: 8)
    ///     // NSDirectionalEdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8)
    ///
    @inlinable @inline(__always)
    init(inset: CGFloat) {
        self.init(top: inset, leading: inset, bottom: inset, trailing: inset)
    }
    
    
    // MARK: Operators
    
    @inlinable @inline(__always)
    static prefix func - (insets: NSDirectionalEdgeInsets) -> NSDirectionalEdgeInsets {
        return NSDirectionalEdgeInsets(
            top: -insets.top,
            leading: -insets.leading,
            bottom: -insets.bottom,
            trailing: -insets.trailing
        )
    }
    
}

#endif

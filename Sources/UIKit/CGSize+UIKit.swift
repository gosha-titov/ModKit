#if canImport(UIKit)

import UIKit

public extension CGSize {
    
    /// Returns a new size by subtracting the specified edge insets from the size's dimensions.
    ///
    ///     let contentInsets = UIEdgeInsets(horizontal: 16, vertical: 8)
    ///     let containerSize = CGSize(width: 100, height: 50)
    ///     let contentSize = containerSize.inset(by: contentInsets)
    ///     // CGSize(width: 68, height: 34)
    ///
    @inlinable @inline(__always)
    func inset(by insets: UIEdgeInsets) -> CGSize {
        return CGSize(
            width: width - insets.horizontal,
            height: height - insets.vertical
        )
    }
    
    /// Returns a new size by subtracting the specified edge insets from the size's dimensions.
    ///
    ///     let contentInsets = NSDirectionalEdgeInsets(horizontal: 16, vertical: 8)
    ///     let containerSize = CGSize(width: 100, height: 50)
    ///     let contentSize = containerSize.inset(by: contentInsets)
    ///     // CGSize(width: 68, height: 34)
    ///
    @inlinable @inline(__always)
    func inset(by insets: NSDirectionalEdgeInsets) -> CGSize {
        return CGSize(
            width: width - insets.horizontal,
            height: height - insets.vertical
        )
    }
    
}

#endif

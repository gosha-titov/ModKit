#if canImport(UIKit)

import UIKit

public extension UICollectionReusableView {
    
    /// A String value describing `self`.
    ///
    ///     class SomeCell: UICollectionViewCell {}
    ///
    ///     SomeCell.reuseIdentifier // "SomeCell"
    ///
    @inlinable @inline(__always)
    static var reuseIdentifier: String {
        return String(describing: self)
    }
    
}

#endif

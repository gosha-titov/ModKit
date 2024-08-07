#if canImport(UIKit)

import UIKit

public extension UICollectionReusableView {
    
    /// A String value describing `self`.
    ///
    ///     class SomeCell: UICollectionViewCell {}
    ///
    ///     SomeCell.reuseIdentifier // "SomeCell"
    ///
    @inlinable static var reuseIdentifier: String {
        return String(describing: self)
    }
    
}

#endif

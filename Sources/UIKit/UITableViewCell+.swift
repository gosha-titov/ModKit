#if canImport(UIKit)

import UIKit

public extension UITableViewCell {
    
    /// A String value describing `self`.
    ///
    ///     class SomeCell: UITableViewCell {}
    ///
    ///     SomeCell.reuseIdentifier // "SomeCell"
    ///
    @inlinable static var reuseIdentifier: String {
        return String(describing: self)
    }
    
}

#endif

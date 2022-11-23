#if canImport(UIKit)

import UIKit

public extension UIView {
    
    // MARK: Properties
    
    /// A view controller that owns this view; otherwise, `nil`.
    var viewController: UIViewController? {
        var parentResponder: UIResponder? = self.next
        while parentResponder != nil {
            if let viewController = parentResponder as? UIViewController {
                return viewController
            }
            parentResponder = parentResponder?.next
        }
        return nil
    }
    
    
    // MARK: Methods
    
    /// Shows this view.
    ///
    /// Use this method as an alternative for the following code:
    ///
    ///     view.isHidden = false
    ///
    func show() -> Void { isHidden = false }
    
    /// Hides this view.
    ///
    /// Use this method as an alternative for the following code:
    ///
    ///     view.isHidden = true
    ///
    func hide() -> Void { isHidden = true }
    
    /// Adds the views to the receiver’s list of subviews.
    ///
    ///     view.addSubviews(label, button, textField)
    ///
    func addSubviews(_ views: UIView...) -> Void {
        views.forEach { addSubview($0) }
    }
    
}

#endif

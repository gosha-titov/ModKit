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
    
    
    /// Adds the views to the receiver’s list of subviews.
    ///
    ///     view.addSubviews(label, button, textField)
    ///
    func addSubviews(_ views: UIView...) -> Void {
        views.forEach { addSubview($0) }
    }
    
    /// Unlinks all subview of this view and its window, and removes them from the responder chain.
    func removeAllSubviews() -> Void {
        subviews.forEach { $0.removeFromSuperview() }
    }
    
}

#endif

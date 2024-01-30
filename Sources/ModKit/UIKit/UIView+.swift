#if canImport(UIKit)

import UIKit

public extension UIView {
    
    /// Returns a view that has a horizontal-spacer behaviour.
    static var horizontalSpacer: UIView {
        let view = UIView()
        view.setContentCompressionResistancePriority(.fittingSizeLevel, for: .horizontal)
        view.setContentHuggingPriority(.fittingSizeLevel, for: .horizontal)
        view.isUserInteractionEnabled = false
        return view
    }
    
    /// Returns a view that has a vertical-spacer behaviour.
    static var verticalSpacer: UIView {
        let view = UIView()
        view.setContentCompressionResistancePriority(.fittingSizeLevel, for: .vertical)
        view.setContentHuggingPriority(.fittingSizeLevel, for: .vertical)
        view.isUserInteractionEnabled = false
        return view
    }
    
    /// Returns a view controller that owns this view; otherwise, `nil`.
    var viewController: UIViewController? {
        var parentResponder: UIResponder? = next
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
    
    /// Removes all constraints from this view.
    func removeAllConstraints() -> Void {
        removeConstraints(constraints)
    }
    
}

#endif

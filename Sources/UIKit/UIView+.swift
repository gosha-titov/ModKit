#if canImport(UIKit)

import UIKit

public extension UIView {
    
    /// Creates a view that has a horizontal-spacer behavior: low hugging and compression resistance priorites.
    ///
    ///     let stackView = UIStackView(arrangedSubviews: [
    ///         label, .horizontalSpacer, button
    ///     ])
    ///     stackView.axis = .horizontal
    ///     // this spacer will expand to push 'label' to the left
    ///     // and 'button' to the right, filling space between them
    ///
    @inlinable @inline(__always)
    static var horizontalSpacer: UIView {
        let view = UIView()
        view.setContentCompressionResistancePriority(.fittingSizeLevel, for: .horizontal)
        view.setContentHuggingPriority(.fittingSizeLevel, for: .horizontal)
        view.isUserInteractionEnabled = false
        return view
    }
    
    /// Creates a view that has a vertical-spacer behavior: low hugging and compression resistance priorites.
    ///
    ///     let stackView = UIStackView(arrangedSubviews: [
    ///         label, .verticalSpacer, button
    ///     ])
    ///     stackView.axis = .vertical
    ///     // this spacer will expand to push 'label' to the top
    ///     // and 'button' to the bottom, filling space between them
    ///
    @inlinable @inline(__always)
    static var verticalSpacer: UIView {
        let view = UIView()
        view.setContentCompressionResistancePriority(.fittingSizeLevel, for: .vertical)
        view.setContentHuggingPriority(.fittingSizeLevel, for: .vertical)
        view.isUserInteractionEnabled = false
        return view
    }
    
    
    /// Returns a view controller that owns this view; otherwise, `nil`.
    @inlinable @inline(__always)
    var viewController: UIViewController? {
        var parentResponder: UIResponder? = next
        while parentResponder.hasValue {
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
    @inlinable @inline(__always)
    func addSubviews(_ views: UIView...) {
        views.forEach { addSubview($0) }
    }
    
    /// Unlinks all subview of this view and its window, and removes them from the responder chain.
    @inlinable @inline(__always)
    func removeAllSubviews() {
        subviews.forEach { $0.removeFromSuperview() }
    }
    
    /// Removes all constraints from this view.
    @inlinable @inline(__always)
    func removeAllConstraints() {
        removeConstraints(constraints)
    }
    
}

#endif

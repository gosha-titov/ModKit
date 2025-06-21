#if canImport(UIKit)

import UIKit

public extension NSLayoutConstraint {
    
    /// Stores this constraint in the specified property and then returns this constraint.
    ///
    ///     NSLayoutConstraint.activate([
    ///         shapeView.heightAnchor.constraint(equalToConstant: 100)
    ///             .stored(in: &shapeViewHeightConstraint)
    ///     ])
    @inlinable @inline(__always)
    func stored(in container: inout NSLayoutConstraint?) -> NSLayoutConstraint {
        container = self
        return self
    }
    
    
    /// Returns a new constraint with the current multiplier updated.
    ///
    ///     NSLayoutConstraint.activate([
    ///         trackView.trailingAnchor.constraint(equalTo: trailingAnchor)
    ///             .stored(in: &trackViewTrailingConstraint)
    ///             .withMultiplier(0.75)
    ///     ])@inline(__always)
    func withMultiplier(_ multiplier: CGFloat) -> NSLayoutConstraint {
        return NSLayoutConstraint(
            item: firstItem as Any,
            attribute: firstAttribute,
            relatedBy: relation,
            toItem: secondItem,
            attribute: secondAttribute,
            multiplier: multiplier,
            constant: constant
        )
    }
    
    /// Returns a new constraint with the current priority updated.
    ///
    ///     NSLayoutConstraint.activate([
    ///         textField.bottomAnchor.constraint(equalTo: keyboardLayoutGuide.topAnchor)
    ///             .withPriority(.defaultHigh)
    ///     ])
    @inlinable @inline(__always)
    func withPriority(_ priority: UILayoutPriority) -> NSLayoutConstraint {
        self.priority = priority
        return self
    }
    
    /// Returns a new constraint with the current priority updated.
    ///
    ///     NSLayoutConstraint.activate([
    ///         textField.bottomAnchor.constraint(equalTo: keyboardLayoutGuide.topAnchor)
    ///             .withPriority(500)
    ///     ])
    @inlinable @inline(__always)
    func withPriority(_ priority: Float) -> NSLayoutConstraint {
        self.priority = UILayoutPriority(priority)
        return self
    }
    
    
    // MARK: Init
    
    /// Creates a constraint that defines the relationship between the specified attributes of the given views.
    @inlinable
    convenience init(
        item view1: Any,
        attribute attribute1: Attribute,
        relatedBy relation: Relation,
        toItem view2: Any?,
        attribute attribute2: Attribute,
        multiplier: CGFloat,
        constant: CGFloat,
        priority: UILayoutPriority
    ) {
        self.init(
        item: view1,
        attribute: attribute1,
        relatedBy: relation,
        toItem: view2,
        attribute: attribute2,
        multiplier: multiplier,
        constant: constant
        )
        self.priority = priority
    }
    
}

#endif

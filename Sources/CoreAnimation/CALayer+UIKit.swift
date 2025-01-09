#if canImport(UIKit)

import UIKit

public extension CALayer {
    
    // MARK: Round Corners
    
    /// Rounds specific corners using a bezier path with the specified radius.
    /// - Note: This method changes the value of the `mask` property.
    @inlinable func roundCorners(withRadius radius: CGFloat, corners: UIRectCorner = [.allCorners]) {
        roundCorners(by: UIBezierPath(
            roundedRect: bounds, byRoundingCorners: corners,
            cornerRadii: CGSize(dimension: radius)
        ))
    }
    
    /// Rounds specific corners using a bezier path with the specified radii.
    /// - Note: This method changes the value of the `mask` property.
    @inlinable func roundCorners(topLeftRadius: CGFloat, topRightRadius: CGFloat, bottomLeftRadius: CGFloat, bottomRightRadius: CGFloat) {
        roundCorners(by: UIBezierPath(
            roundedRect: bounds,
            topLeftCornerRadius: topLeftRadius, topRightCornerRadius: topRightRadius,
            bottomLeftCornerRadius: bottomLeftRadius, bottomRightCornerRadius: bottomRightRadius
        ))
    }
    
    /// Rounds specific corners using a bezier path with the specified radii.
    /// - Note: This method changes the value of the `mask` property.
    @inlinable func roundCorners(topLeftRadius: CGSize, topRightRadius: CGSize, bottomLeftRadius: CGSize, bottomRightRadius: CGSize) {
        roundCorners(by: UIBezierPath(
            roundedRect: bounds,
            topLeftCornerRadius: topLeftRadius, topRightCornerRadius: topRightRadius,
            bottomLeftCornerRadius: bottomLeftRadius, bottomRightCornerRadius: bottomRightRadius
        ))
    }
    
    
    // MARK: Shape Shadow
    
    /// Shapes shadow layer for specific corners rounded using a bezier path with the specified radius.
    /// - Note: This method changes the value of the `shadowPath` property.
    @inlinable func shapeShadow(withRadius radius: CGFloat, corners: UIRectCorner = [.allCorners]) {
        shapeShadow(by: UIBezierPath(
            roundedRect: bounds, byRoundingCorners: corners,
            cornerRadii: CGSize(dimension: radius)
        ))
    }
    
    /// Shapes shadow layer for specific corners rounded using a bezier path with the specified radii.
    /// - Note: This method changes the value of the `shadowPath` property.
    @inlinable func shapeShadow(topLeftRadius: CGFloat, topRightRadius: CGFloat, bottomLeftRadius: CGFloat, bottomRightRadius: CGFloat) {
        shapeShadow(by: UIBezierPath(
            roundedRect: bounds,
            topLeftCornerRadius: topLeftRadius, topRightCornerRadius: topRightRadius,
            bottomLeftCornerRadius: bottomLeftRadius, bottomRightCornerRadius: bottomRightRadius
        ))
    }
    
    /// Shapes shadow layer for specific corners rounded using a bezier path with the specified radii.
    /// - Note: This method changes the value of the `shadowPath` property.
    @inlinable func shapeShadow(topLeftRadius: CGSize, topRightRadius: CGSize, bottomLeftRadius: CGSize, bottomRightRadius: CGSize) {
        shapeShadow(by: UIBezierPath(
            roundedRect: bounds,
            topLeftCornerRadius: topLeftRadius, topRightCornerRadius: topRightRadius,
            bottomLeftCornerRadius: bottomLeftRadius, bottomRightCornerRadius: bottomRightRadius
        ))
    }
    
}


internal extension CALayer {
    
    @usableFromInline func roundCorners(by bezierPath: UIBezierPath) {
        let maskLayer = CAShapeLayer()
        maskLayer.path = bezierPath.cgPath
        mask = maskLayer
    }
    
    @usableFromInline func shapeShadow(by bezierPath: UIBezierPath) {
        shadowPath = bezierPath.cgPath
    }
    
}

#endif

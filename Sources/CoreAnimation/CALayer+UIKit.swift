#if canImport(UIKit)

import UIKit

public extension CALayer {
    
    // MARK: Round Corners
    
    /// Rounds specific corners using a bezier path with the specified radius.
    @inlinable func roundCorners(withRadius radius: CGFloat, corners: UIRectCorner = [.allCorners]) {
        roundCorners(by: UIBezierPath(
            roundedRect: bounds, byRoundingCorners: corners,
            cornerRadii: CGSize(dimension: radius)
        ))
    }
    
    
    /// Rounds specific corner sides using a bezier path with the specified radii.
    @inlinable func roundCorners(leftRadii: CGFloat, rightRadii: CGFloat) {
        roundCorners(topLeftRadius: leftRadii, topRightRadius: rightRadii, bottomLeftRadius: leftRadii, bottomRightRadius: rightRadii)
    }
    
    /// Rounds specific corner sides using a bezier path with the specified radii.
    @inlinable func roundCorners(topRadii: CGFloat, bottomRadii: CGFloat) {
        roundCorners(topLeftRadius: topRadii, topRightRadius: topRadii, bottomLeftRadius: bottomRadii, bottomRightRadius: bottomRadii)
    }
    
    /// Rounds specific corners using a bezier path with the specified radii.
    @inlinable func roundCorners(topLeftRadius: CGFloat, topRightRadius: CGFloat, bottomLeftRadius: CGFloat, bottomRightRadius: CGFloat) {
        roundCorners(by: UIBezierPath(
            roundedRect: bounds,
            topLeftRadius: topLeftRadius, topRightRadius: topRightRadius,
            bottomLeftRadius: bottomLeftRadius, bottomRightRadius: bottomRightRadius
        ))
    }
    
    
    /// Rounds specific corner sides using a bezier path with the specified radii.
    @inlinable func roundCorners(leftRadii: CGSize, rightRadii: CGSize) {
        roundCorners(topLeftRadius: leftRadii, topRightRadius: rightRadii, bottomLeftRadius: leftRadii, bottomRightRadius: rightRadii)
    }
    
    /// Rounds specific corner sides using a bezier path with the specified radii.
    @inlinable func roundCorners(topRadii: CGSize, bottomRadii: CGSize) {
        roundCorners(topLeftRadius: topRadii, topRightRadius: topRadii, bottomLeftRadius: bottomRadii, bottomRightRadius: bottomRadii)
    }
    
    /// Rounds specific corners using a bezier path with the specified radii.
    @inlinable func roundCorners(topLeftRadius: CGSize, topRightRadius: CGSize, bottomLeftRadius: CGSize, bottomRightRadius: CGSize) {
        roundCorners(by: UIBezierPath(
            roundedRect: bounds,
            topLeftRadius: topLeftRadius, topRightRadius: topRightRadius,
            bottomLeftRadius: bottomLeftRadius, bottomRightRadius: bottomRightRadius
        ))
    }
    
    
    // MARK: Shape Shadow
    
    /// Shapes shadow layer for specific corners rounded using a bezier path with the specified radius.
    @inlinable func shapeShadow(withRadius radius: CGFloat, corners: UIRectCorner = [.allCorners]) {
        shapeShadow(by: UIBezierPath(
            roundedRect: bounds, byRoundingCorners: corners,
            cornerRadii: CGSize(dimension: radius)
        ))
    }
    
    /// hapes shadow layer for specific corner sides rounded using a bezier path with the specified radii.
    @inlinable func shapeShadow(leftRadii: CGFloat, rightRadii: CGFloat) {
        shapeShadow(topLeftRadius: leftRadii, topRightRadius: rightRadii, bottomLeftRadius: leftRadii, bottomRightRadius: rightRadii)
    }
    
    /// hapes shadow layer for specific corner sides rounded using a bezier path with the specified radii.
    @inlinable func shapeShadow(topRadii: CGFloat, bottomRadii: CGFloat) {
        shapeShadow(topLeftRadius: topRadii, topRightRadius: topRadii, bottomLeftRadius: bottomRadii, bottomRightRadius: bottomRadii)
    }
    
    /// Shapes shadow layer for specific corners rounded using a bezier path with the specified radii.
    @inlinable func shapeShadow(topLeftRadius: CGFloat, topRightRadius: CGFloat, bottomLeftRadius: CGFloat, bottomRightRadius: CGFloat) {
        shapeShadow(by: UIBezierPath(
            roundedRect: bounds,
            topLeftRadius: topLeftRadius, topRightRadius: topRightRadius,
            bottomLeftRadius: bottomLeftRadius, bottomRightRadius: bottomRightRadius
        ))
    }
    
    
    /// hapes shadow layer for specific corner sides rounded using a bezier path with the specified radii.
    @inlinable func shapeShadow(leftRadii: CGSize, rightRadii: CGSize) {
        shapeShadow(topLeftRadius: leftRadii, topRightRadius: rightRadii, bottomLeftRadius: leftRadii, bottomRightRadius: rightRadii)
    }
    
    /// hapes shadow layer for specific corner sides rounded using a bezier path with the specified radii.
    @inlinable func shapeShadow(topRadii: CGSize, bottomRadii: CGSize) {
        shapeShadow(topLeftRadius: topRadii, topRightRadius: topRadii, bottomLeftRadius: bottomRadii, bottomRightRadius: bottomRadii)
    }
    
    /// Shapes shadow layer for specific corners rounded using a bezier path with the specified radii.
    @inlinable func shapeShadow(topLeftRadius: CGSize, topRightRadius: CGSize, bottomLeftRadius: CGSize, bottomRightRadius: CGSize) {
        shapeShadow(by: UIBezierPath(
            roundedRect: bounds,
            topLeftRadius: topLeftRadius, topRightRadius: topRightRadius,
            bottomLeftRadius: bottomLeftRadius, bottomRightRadius: bottomRightRadius
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

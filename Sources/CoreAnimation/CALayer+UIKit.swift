#if canImport(UIKit)

import UIKit

public extension CALayer {
    
    /// Rounds specific corners using a bezier path with the given radius.
    @inlinable func roundCornersByBezierPath(withRadius radius: CGFloat, corners: UIRectCorner = [.allCorners]) -> Void {
        let size = CGSize(side: radius)
        let bezierPath = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: size)
        let maskLayer = CAShapeLayer()
        maskLayer.path = bezierPath.cgPath
        mask = maskLayer
    }
    
    /// Shapes shadows for specific corners using a bezier path with the given radius.
    @inlinable func shapeShadowsByBezierPath(withRadius radius: CGFloat, corners: UIRectCorner = [.allCorners]) -> Void {
        let size = CGSize(side: radius)
        let bezierPath = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: size)
        shadowPath = bezierPath.cgPath
    }
    
}

#endif

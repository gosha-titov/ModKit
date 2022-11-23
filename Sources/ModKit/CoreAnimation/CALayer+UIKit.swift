#if canImport(UIKit)

import UIKit

public extension CALayer {
    
    /// Rounds corners using a bezier path with the given radius.
    func roundCornersByBezierPath(withRadius radius: CGFloat) -> Void {
        let bezierPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: radius)
        let maskLayer = CAShapeLayer()
        maskLayer.path = bezierPath.cgPath
        mask = maskLayer
    }
    
}

#endif

#if canImport(UIKit)

import UIKit

public extension UIBezierPath {
    
    /// Creates and returns a new Bézier path object with a rounded rectangular path.
    /// - Parameter rect: The rectangle that defines the basic shape of the path.
    /// - Parameter topLeftCornerRadius: The radius of the top-left corner oval.
    /// - Parameter topRightCornerRadius: The radius of the top-right corner oval.
    /// - Parameter bottomLeftCornerRadius: The radius of the bottom-left corner oval.
    /// - Parameter bottomRigthCornerRadius: The radius of the bottom-right corner oval.
    @inlinable @inline(__always)
    convenience init(
        roundedRect rect: CGRect,
        topLeftCornerRadius: CGFloat, topRightCornerRadius: CGFloat,
        bottomLeftCornerRadius: CGFloat, bottomRightCornerRadius: CGFloat
    ) {
        self.init(
            roundedRect: rect,
            topLeftCornerRadius: CGSize(dimension: topLeftCornerRadius),
            topRightCornerRadius: CGSize(dimension: topRightCornerRadius),
            bottomLeftCornerRadius: CGSize(dimension: bottomLeftCornerRadius),
            bottomRightCornerRadius: CGSize(dimension: bottomRightCornerRadius)
        )
    }
    
    
    /// Creates and returns a new Bézier path object with a rounded rectangular path.
    /// - Parameter rect: The rectangle that defines the basic shape of the path.
    /// - Parameter topLeftCornerRadius: The radius of the top-left corner oval.
    /// - Parameter topRightCornerRadius: The radius of the top-right corner oval.
    /// - Parameter bottomLeftCornerRadius: The radius of the bottom-left corner oval.
    /// - Parameter bottomRigthCornerRadius: The radius of the bottom-right corner oval.
    @inlinable
    convenience init(
        roundedRect rect: CGRect,
        topLeftCornerRadius radius1: CGSize, topRightCornerRadius radius2: CGSize,
        bottomLeftCornerRadius radius4: CGSize, bottomRightCornerRadius radius3: CGSize
    ) {
        self.init()
        let path = CGMutablePath()
        
        //     1 ───── 2
        //     │       │
        //     │       │
        //     │       │
        //     4 ───── 3

        let point1 = rect.topLeftPoint
        let point2 = rect.topRightPoint
        let point3 = rect.bottomRightPoint
        let point4 = rect.bottomLeftPoint
        
        path.move(to: point1.withY(offsetBy: radius1.height))
        if radius1 != .zero {
            let endPoint = point1.withX(offsetBy: radius1.width)
            path.addCurve(to: endPoint, control1: point1, control2: endPoint)
        }
        
        path.addLine(to: point2.withX(offsetBy: -radius2.width))
        if radius2 != .zero {
            let endPoint = point2.withY(offsetBy: radius2.height)
            path.addCurve(to: endPoint, control1: point2, control2: endPoint)
        }

        path.addLine(to: point3.withY(offsetBy: -radius3.height))
        if radius3 != .zero {
            let endPoint = point3.withX(offsetBy: -radius3.width)
            path.addCurve(to: endPoint, control1: point3, control2: endPoint)
        }
        
        path.addLine(to: point4.withX(offsetBy: radius4.width))
        if radius4 != .zero {
            let endPoint = point4.withY(offsetBy: -radius4.height)
            path.addCurve(to: endPoint, control1: point4, control2: endPoint)
        }
        
        path.addLine(to: point1.withY(offsetBy: radius1.height))

        path.closeSubpath()
        cgPath = path
    }
    
}

#endif

#if canImport(UIKit)

import UIKit

public extension UIBezierPath {
    
    /// Creates and returns a new Bézier path object with a rounded rectangular path.
    @inlinable convenience init(
        roundedRect rect: CGRect,
        topLeftRadius: CGFloat,
        topRightRadius: CGFloat,
        bottomLeftRadius: CGFloat,
        bottomRightRadius: CGFloat
    ) {
        self.init(
            roundedRect: rect,
            topLeftRadius: CGSize(dimension: topLeftRadius),
            topRightRadius: CGSize(dimension: topRightRadius),
            bottomLeftRadius: CGSize(dimension: bottomLeftRadius),
            bottomRightRadius: CGSize(dimension: bottomRightRadius)
        )
    }
    
    
    /// Creates and returns a new Bézier path object with a rounded rectangular path.
    @inlinable convenience init(
        roundedRect rect: CGRect,
        topLeftRadius radius1: CGSize, topRightRadius radius2: CGSize,
        bottomLeftRadius radius4: CGSize, bottomRightRadius radius3: CGSize
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

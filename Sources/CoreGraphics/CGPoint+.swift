import CoreGraphics

public extension CGPoint {
    
    /// A distance between two points.
    @inlinable static func distance(from point1: CGPoint, to point2: CGPoint) -> CGFloat {
        return sqrt(pow(point2.x - point1.x, 2) + pow(point2.y - point1.y, 2))
    }
    
    /// A distance between this point and another point.
    @inlinable func distance(to point: CGPoint) -> CGFloat {
        return CGPoint.distance(from: self, to: point)
    }
    
    
    // MARK: Operations
    
    @inlinable static func + (lhs: CGPoint, rhs: CGPoint) -> CGPoint {
        return CGPoint(x: lhs.x + rhs.x, y: lhs.y + rhs.y)
    }
    
    @inlinable static func - (lhs: CGPoint, rhs: CGPoint) -> CGPoint {
        return CGPoint(x: lhs.x - rhs.x, y: lhs.y - rhs.y)
    }

    @inlinable static func * (point: CGPoint, scalar: CGFloat) -> CGPoint {
        return CGPoint(x: point.x * scalar, y: point.y * scalar)
    }
    
    @inlinable static func * (scalar: CGFloat, point: CGPoint) -> CGPoint {
        return CGPoint(x: point.x * scalar, y: point.y * scalar)
    }
    
    @inlinable static func += (lhs: inout CGPoint, rhs: CGPoint) -> Void {
        lhs = lhs + rhs
    }

    @inlinable static func -= (lhs: inout CGPoint, rhs: CGPoint) -> Void {
        lhs = lhs - rhs
    }
    
    @inlinable static func *= (point: inout CGPoint, scalar: CGFloat) -> Void {
        point = point * scalar
    }
    
}

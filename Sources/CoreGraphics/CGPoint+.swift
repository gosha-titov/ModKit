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
    
    
    // MARK: Methods
    
    /// Returns a new point replacing the current X-position with the specified one.
    ///
    ///     // Short way
    ///     let newPoint = point.withX(newX)
    ///
    ///     // Manual way
    ///     let newPoint = CGPoint(
    ///         x: newX,
    ///         y: point.y
    ///     )
    @inlinable func withX(_ newX: CGFloat) -> CGPoint {
        return CGPoint(x: newX, y: y)
    }
    
    /// Returns a new point with the current X-position updated.
    ///
    ///     // Short way
    ///     let newPoint = point.withX { $0 + 16 }
    ///
    ///     // Manual way
    ///     let newPoint = CGPoint(
    ///         x: point.x + 16,
    ///         y: point.y
    ///     )
    @inlinable func withX(update: (CGFloat) -> CGFloat) -> CGPoint {
        return withX(update(x))
    }
    
    /// Returns a new point offsetting the current X-position by the specified value.
    ///
    ///     // Short way
    ///     let newPoint = point.withX(offsetedBy: 16)
    ///
    ///     // Manual way
    ///     let newPoint = CGPoint(
    ///         x: point.x + 16,
    ///         y: point.y
    ///     )
    @inlinable func withX(offsetBy xOffset: CGFloat) -> CGPoint {
        return withX(x + xOffset)
    }
    
    /// Returns a new point replacing the current Y-position with the specified one.
    ///
    ///     // Short way
    ///     let newPoint = point.withY(newY)
    ///
    ///     // Manual way
    ///     let newPoint = CGPoint(
    ///         x: point.x,
    ///         y: newY
    ///     )
    @inlinable func withY(_ newY: CGFloat) -> CGPoint {
        return CGPoint(x: x, y: newY)
    }
    
    /// Returns a new point with the current Y-position updated.
    ///
    ///     // Short way
    ///     let newPoint = point.withY { $0 + 16 }
    ///
    ///     // Manual way
    ///     let newPoint = CGPoint(
    ///         x: point.x,
    ///         y: point.y + 16
    ///     )
    @inlinable func withY(update: (CGFloat) -> CGFloat) -> CGPoint {
        return withY(update(y))
    }
    
    /// Returns a new point offsetting the current Y-position by the specified value.
    ///
    ///     // Short way
    ///     let newPoint = point.withY(offsetedBy: 16)
    ///
    ///     // Manual way
    ///     let newPoint = CGPoint(
    ///         x: point.x,
    ///         y: point.y + 16
    ///     )
    @inlinable func withY(offsetBy yOffset: CGFloat) -> CGPoint {
        return withY(y + yOffset)
    }
    
}

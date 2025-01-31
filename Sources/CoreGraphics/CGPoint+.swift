#if canImport(CoreGraphics)

import CoreGraphics

public extension CGPoint {
    
    /// A distance between two points.
    @inlinable @inline(__always)
    static func distance(from point1: CGPoint, to point2: CGPoint) -> CGFloat {
        return sqrt(pow(point2.x - point1.x, 2) + pow(point2.y - point1.y, 2))
    }
    
    /// A distance between this point and another point.
    @inlinable @inline(__always)
    func distance(to point: CGPoint) -> CGFloat {
        return CGPoint.distance(from: self, to: point)
    }
    
    
    // MARK: Methods
    
    /// Returns a new point offsetting the current X- and Y- positions by the specified values.
    ///
    ///     // Short way
    ///     let newPoint = point.offsetBy(dx: 8, dy: 16)
    ///
    ///     // Manual way
    ///     let newPoint = CGPoint(
    ///         x: point.x + 8,
    ///         y: point.y + 16
    ///     )
    @inlinable @inline(__always)
    func offsetBy(dx: CGFloat, dy: CGFloat) -> CGPoint {
        return CGPoint(x: x + dx, y: y + dy)
    }
    
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
    @inlinable @inline(__always)
    func withX(_ newX: CGFloat) -> CGPoint {
        return CGPoint(x: newX, y: y)
    }
    
    /// Returns a new point with the current X-position updated.
    ///
    ///     // Short way
    ///     let newPoint = point.withX { $0 * 2 }
    ///
    ///     // Manual way
    ///     let newPoint = CGPoint(
    ///         x: point.x * 2,
    ///         y: point.y
    ///     )
    @inlinable @inline(__always)
    func withX(update: (CGFloat) -> CGFloat) -> CGPoint {
        return withX(update(x))
    }
    
    /// Returns a new point offsetting the current X-position by the specified value.
    ///
    ///     // Short way
    ///     let newPoint = point.withX(offsetBy: 16)
    ///
    ///     // Manual way
    ///     let newPoint = CGPoint(
    ///         x: point.x + 16,
    ///         y: point.y
    ///     )
    @inlinable @inline(__always)
    func withX(offsetBy dx: CGFloat) -> CGPoint {
        return withX(x + dx)
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
    @inlinable @inline(__always)
    func withY(_ newY: CGFloat) -> CGPoint {
        return CGPoint(x: x, y: newY)
    }
    
    /// Returns a new point with the current Y-position updated.
    ///
    ///     // Short way
    ///     let newPoint = point.withY { $0 * 2 }
    ///
    ///     // Manual way
    ///     let newPoint = CGPoint(
    ///         x: point.x,
    ///         y: point.y * 2
    ///     )
    @inlinable @inline(__always)
    func withY(update: (CGFloat) -> CGFloat) -> CGPoint {
        return withY(update(y))
    }
    
    /// Returns a new point offsetting the current Y-position by the specified value.
    ///
    ///     // Short way
    ///     let newPoint = point.withY(offsetBy: 16)
    ///
    ///     // Manual way
    ///     let newPoint = CGPoint(
    ///         x: point.x,
    ///         y: point.y + 16
    ///     )
    @inlinable @inline(__always)
    func withY(offsetBy dy: CGFloat) -> CGPoint {
        return withY(y + dy)
    }
    
}

#endif

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
    ///     // Modern way
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
    
    /// Returns a new point offsetting the current X- and Y- positions by the specified radius and angle of the circle centered on this point.
    ///
    ///     let point = CGPoint(x: 100, y: 50)
    ///     let newPoint = point.offsetBy(angle: .pi / 2, radius: 25)
    ///     // CGPoint(x: 100, y: 75)
    ///
    ///     // ▲ y     .pi / 2
    ///     // ├      ╭───●───╮
    ///     // │      │   │   │
    ///     // ├  .pi ┤   ○╶─ ┼ 0
    ///     // │      │       │
    ///     // │      ╰───┬───╯
    ///     // │     .pi * 3 / 2
    ///     // │
    ///     // ┼──────────┴─────▶ x
    ///
    /// - Parameter angle: The angle in radians.
    /// - Note: This method offsets the point within the normal coordinate system, rather than in the Apple's one where Y- axis increases downwards.
    @inlinable @inline(__always)
    func offsetBy(angle: CGFloat, radius: CGFloat) -> CGPoint {
        return offsetBy(
            dx: radius * cos(angle),
            dy: radius * sin(angle)
        )
    }
    
    /// Returns a new point replacing the current X-position with the specified one.
    ///
    ///     // Modern way
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
    ///     // Modern way
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
    ///     // Modern way
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
    ///     // Modern way
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
    ///     // Modern way
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
    ///     // Modern way
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

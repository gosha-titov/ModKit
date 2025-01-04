#if canImport(CoreGraphics)

import CoreGraphics

public extension CGRect {
    
    /// The area of this rectangle.
    ///
    ///     let rect = CGRect(width: 15.0, height: 2.0)
    ///     rect.area // 30.0
    ///
    @inlinable var area: CGFloat {
        return width * height
    }
    
    /// The point associated with the origin of this rectangle, settable.
    ///
    ///     let rect = CGRect(x: 0.0, y: 0.0, width: 100.0, height: 200.0)
    ///     rect.topLeftPoint // CGPoint(x: 0.0, y: 0.0)
    ///
    ///     ●───────┐
    ///     │       │
    ///     │       │
    ///     │       │
    ///     └───────┘
    ///
    @inlinable var topLeftPoint: CGPoint {
        get { origin }
        set { origin = newValue}
    }
    
    /// The point associated with the top-middle point of this rectangle, settable.
    ///
    ///     let rect = CGRect(x: 0.0, y: 0.0, width: 100.0, height: 200.0)
    ///     rect.topPoint // CGPoint(x: 50.0, y: 0.0)
    ///
    ///     ┌───●───┐
    ///     │       │
    ///     │       │
    ///     │       │
    ///     └───────┘
    ///
    @inlinable var topPoint: CGPoint {
        get { return CGPoint(x: midX, y: minY) }
        set {
            origin = CGPoint(
                x: newValue.x - width  / 2.0,
                y: newValue.y
            )
        }
    }
    
    /// The point associated with the top-right point of this rectangle, settable.
    ///
    ///     let rect = CGRect(x: 0.0, y: 0.0, width: 100.0, height: 200.0)
    ///     rect.topRightPoint // CGPoint(x: 100.0, y: 0.0)
    ///
    ///     ┌───────●
    ///     │       │
    ///     │       │
    ///     │       │
    ///     └───────┘
    ///
    @inlinable var topRightPoint: CGPoint {
        get { return CGPoint(x: maxX, y: minY) }
        set {
            origin = CGPoint(
                x: newValue.x - width,
                y: newValue.y
            )
        }
    }
    
    /// The point associated with the middle-left point of this rectangle, settable.
    ///
    ///     let rect = CGRect(x: 0.0, y: 0.0, width: 100.0, height: 200.0)
    ///     rect.leftPoint // CGPoint(x: 0.0, y: 100.0)
    ///
    ///     ┌───────┐
    ///     │       │
    ///     ●       │
    ///     │       │
    ///     └───────┘
    ///
    @inlinable var leftPoint: CGPoint {
        get { return CGPoint(x: minX, y: midY) }
        set {
            origin = CGPoint(
                x: newValue.x,
                y: newValue.y - height / 2.0
            )
        }
    }
    
    /// The point associated with the center of this rectangle, settable.
    ///
    ///     let rect = CGRect(x: 0.0, y: 0.0, width: 100.0, height: 200.0)
    ///     rect.center // CGPoint(x: 50.0, y: 100.0)
    ///
    ///     ┌───────┐
    ///     │       │
    ///     │   ●   │
    ///     │       │
    ///     └───────┘
    ///
    @inlinable var center: CGPoint {
        get { return CGPoint(x: midX, y: midY) }
        set {
            origin = CGPoint(
                x: newValue.x - width  / 2.0,
                y: newValue.y - height / 2.0
            )
        }
    }
    
    /// The point associated with the middle-right point of this rectangle, settable.
    ///
    ///     let rect = CGRect(x: 0.0, y: 0.0, width: 100.0, height: 200.0)
    ///     rect.rightPoint // CGPoint(x: 100.0, y: 100.0)
    ///
    ///     ┌───────┐
    ///     │       │
    ///     │       ●
    ///     │       │
    ///     └───────┘
    ///
    @inlinable var rightPoint: CGPoint {
        get { return CGPoint(x: maxX, y: midY) }
        set {
            origin = CGPoint(
                x: newValue.x - width,
                y: newValue.y - height / 2.0
            )
        }
    }
    
    /// The point associated with the bottom-left point of this rectangle, settable.
    ///
    ///     let rect = CGRect(x: 0.0, y: 0.0, width: 100.0, height: 200.0)
    ///     rect.bottomLeftPoint // CGPoint(x: 0.0, y: 200.0)
    ///
    ///     ┌───────┐
    ///     │       │
    ///     │       │
    ///     │       │
    ///     ●───────┘
    ///
    @inlinable var bottomLeftPoint: CGPoint {
        get { return CGPoint(x: minX, y: maxY) }
        set {
            origin = CGPoint(
                x: newValue.x,
                y: newValue.y - height
            )
        }
    }
    
    /// The point associated with the bottom-middle point of this rectangle, settable.
    ///
    ///     let rect = CGRect(x: 0.0, y: 0.0, width: 100.0, height: 200.0)
    ///     rect.bottomPoint // CGPoint(x: 50.0, y: 200.0)
    ///
    ///     ┌───────┐
    ///     │       │
    ///     │       │
    ///     │       │
    ///     └───●───┘
    ///
    @inlinable var bottomPoint: CGPoint {
        get { return CGPoint(x: midX, y: maxY) }
        set {
            origin = CGPoint(
                x: newValue.x - width  / 2.0,
                y: newValue.y - height
            )
        }
    }
    
    /// The point associated with the bottom-right point of this rectangle, settable.
    ///
    ///     let rect = CGRect(x: 0.0, y: 0.0, width: 100.0, height: 200.0)
    ///     rect.bottomRightPoint // CGPoint(x: 100.0, y: 200.0)
    ///
    ///     ┌───────┐
    ///     │       │
    ///     │       │
    ///     │       │
    ///     └───────●
    ///
    @inlinable var bottomRightPoint: CGPoint {
        get { return CGPoint(x: maxX, y: maxY) }
        set {
            origin = CGPoint(
                x: newValue.x - width,
                y: newValue.y - height
            )
        }
    }
    
    
    // MARK: Methods
    
    /// Returns a new rectangle replacing the current origin with the specified one.
    ///
    ///     // Short way
    ///     let newRect = rect.withOrigin(newOrigin)
    ///
    ///     // Manual way
    ///     let newRect = CGRect(
    ///         origin: newOrigin,
    ///         size: size
    ///     )
    @inlinable func withOrigin(_ newOrigin: CGPoint) -> CGRect {
        return CGRect(origin: newOrigin, size: size)
    }
    
    /// Returns a new rectangle with the current origin updated.
    ///
    ///     // Short way
    ///     let newRect = rect.withOrigin { $0.withY(.zero) }
    ///
    ///     // Manual way
    ///     let newRect = CGRect(
    ///         origin: CGPoint(
    ///             x: rect.origin.x,
    ///             y: .zero
    ///         ),
    ///         size: size
    ///     )
    @inlinable func withOrigin(update: (CGPoint) -> CGPoint) -> CGRect {
        return withOrigin(update(origin))
    }
    
    
    /// Returns a new rectangle replacing the current size with the specified one.
    ///
    ///     // Short way
    ///     let newRect = rect.withSize(newSize)
    ///
    ///     // Manual way
    ///     let newRect = CGRect(
    ///         origin: rect.origin,
    ///         size: newSize
    ///     )
    @inlinable func withSize(_ newSize: CGSize) -> CGRect {
        return CGRect(origin: origin, size: newSize)
    }
    
    /// Returns a new rectangle with the current width updated.
    ///
    ///     // Short way
    ///     let newRect = rect.withSize { $0.scaled(by: 1.5) }
    ///
    ///     // Manual way
    ///     let newRect = CGRect(
    ///         origin: rect.origin,
    ///         size: rect.size.scaled(by: 1.5)
    ///     )
    @inlinable func withSize(update: (CGSize) -> CGSize) -> CGRect {
        return withSize(update(size))
    }
    
    
    /// Returns a new rectangle replacing the current width with the specified one.
    ///
    ///     // Short way
    ///     let newRect = rect.withWidth(newWidth)
    ///
    ///     // Manual way
    ///     let newRect = CGRect(
    ///         origin: rect.origin,
    ///         size: CGSize(
    ///             width: newWidth,
    ///             height: rect.height
    ///         )
    ///     )
    @inlinable func withWidth(_ newWidth: CGFloat) -> CGRect {
        return CGRect(origin: origin, size: size.withWidth(newWidth))
    }
    
    /// Returns a new rectangle with the current width updated.
    ///
    ///     // Short way
    ///     let newRect = rect.withWidth { $0 * 1.5 }
    ///
    ///     // Manual way
    ///     let newRect = CGRect(
    ///         origin: rect.origin,
    ///         size: CGSize(
    ///             width: rect.width * 1.5,
    ///             height: rect.height
    ///         )
    ///     )
    @inlinable func withWidth(update: (CGFloat) -> CGFloat) -> CGRect {
        return withWidth(update(width))
    }
    
    
    /// Returns a new rectangle replacing the current height with the specified one.
    ///
    ///     // Short way
    ///     let newRect = rect.withHeight(newHeight)
    ///
    ///     // Manual way
    ///     let newRect = CGRect(
    ///         origin: rect.origin,
    ///         size: CGSize(
    ///             width: rect.width,
    ///             height: newHeight
    ///         )
    ///     )
    @inlinable func withHeight(_ newHeight: CGFloat) -> CGRect {
        return CGRect(origin: origin, size: size.withHeight(newHeight))
    }
    
    /// Returns a new rectangle with the current height updated.
    ///
    ///     // Short way
    ///     let newRect = rect.withHeight { $0 * 1.5 }
    ///
    ///     // Manual way
    ///     let newRect = CGRect(
    ///         origin: rect.origin,
    ///         size: CGSize(
    ///             width: rect.width,
    ///             height: rect.height * 1.5
    ///         )
    ///     )
    @inlinable func withHeight(update: (CGFloat) -> CGFloat) -> CGRect {
        return withHeight(update(height))
    }
    
    
    // MARK: Init
    
    /// Creates a rectangle with dimensions specified as CGFloat values and the origin at zero.
    @inlinable init(width: CGFloat, height: CGFloat) {
        let size = CGSize(width: width, height: height)
        self.init(origin: .zero, size: size)
    }
    
    /// Creates a rectangle with the specified center and size.
    @inlinable init(center: CGPoint, size: CGSize) {
        let origin = CGPoint(
            x: center.x - size.width / 2.0,
            y: center.y - size.height / 2.0
        )
        self.init(origin: origin, size: size)
    }
    
    /// Creates a rectangle with the origin at zero and the specified size.
    @inlinable init(size: CGSize) {
        self.init(origin: .zero, size: size)
    }
    
}

#endif

import CoreGraphics

public extension CGRect {
    
    // MARK: Properties
    
    /// The area of this rectangle.
    ///
    ///     let rect = CGRect(width: 15.0, height: 2.0)
    ///     rect.area // 30.0
    ///
    var area: CGFloat {
        return width * height
    }
    
    /// The point associated with the origin of this rectangle, settable.
    ///
    ///     let rect = CGRect(x: 0.0, y: 0.0, width: 100.0, height: 200.0)
    ///     rect.topLeftPoint // CGPoint(x: 0.0, y: 0.0)
    ///
    ///     A- - -+
    ///     |     |
    ///     |     |
    ///     |     |
    ///     +– – –+
    ///
    var topLeftPoint: CGPoint {
        get { origin }
        set { origin = newValue}
    }
    
    /// The point associated with the top-middle point of this rectangle, settable.
    ///
    ///     let rect = CGRect(x: 0.0, y: 0.0, width: 100.0, height: 200.0)
    ///     rect.topPoint // CGPoint(x: 50.0, y: 0.0)
    ///
    ///     +- A -+
    ///     |     |
    ///     |     |
    ///     |     |
    ///     +– – –+
    ///
    var topPoint: CGPoint {
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
    ///     +- - -A
    ///     |     |
    ///     |     |
    ///     |     |
    ///     +– – –+
    ///
    var topRightPoint: CGPoint {
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
    ///     +- - -+
    ///     |     |
    ///     A     |
    ///     |     |
    ///     +– – –+
    ///
    var leftPoint: CGPoint {
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
    ///     +- - -+
    ///     |     |
    ///     |  A  |
    ///     |     |
    ///     +– – –+
    ///
    var center: CGPoint {
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
    ///     +- - -+
    ///     |     |
    ///     |     A
    ///     |     |
    ///     +– – –+
    ///
    var rightPoint: CGPoint {
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
    ///     +- - -+
    ///     |     |
    ///     |     |
    ///     |     |
    ///     A– – –+
    ///
    var bottomLeftPoint: CGPoint {
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
    ///     +- - -+
    ///     |     |
    ///     |     |
    ///     |     |
    ///     +– A –+
    ///
    var bottomPoint: CGPoint {
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
    ///     +- - -+
    ///     |     |
    ///     |     |
    ///     |     |
    ///     +– – –A
    ///
    var bottomRightPoint: CGPoint {
        get { return CGPoint(x: maxX, y: maxY) }
        set {
            origin = CGPoint(
                x: newValue.x - width,
                y: newValue.y - height
            )
        }
    }
    
    
    // MARK: Init
    
    /// Creates a rectangle with dimensions specified as CGFloat values and the origin at zero.
    init(width: CGFloat, height: CGFloat) {
        let size = CGSize(width: width, height: height)
        self.init(origin: .zero, size: size)
    }
    
    /// Creates a rectangle with the specified center and size.
    init(center: CGPoint, size: CGSize) {
        let origin = CGPoint(
            x: center.x - size.width / 2.0,
            y: center.y - size.height / 2.0
        )
        self.init(origin: origin, size: size)
    }
    
    /// Creates a rectangle with the origin at zero and the specified size.
    init(size: CGSize) {
        self.init(origin: .zero, size: size)
    }
    
}

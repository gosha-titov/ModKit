import CoreGraphics

public extension CGRect {
    
    // MARK: Properties
    
    /// The point associated with the origin of this rectangle.
    var topLeftPoint: CGPoint {
        get { origin }
        set { origin = newValue}
    }
    
    /// The point associated with the top-middle point of this rectangle.
    var topPoint: CGPoint {
        get { return CGPoint(x: midX, y: minY) }
        set {
            let x = newValue.x - width  / 2.0
            let y = newValue.y
            origin = CGPoint(x: x, y: y)
        }
    }
    
    /// The point associated with the top-right point of this rectangle.
    var topRightPoint: CGPoint {
        get { return CGPoint(x: maxX, y: minY) }
        set {
            let x = newValue.x - width
            let y = newValue.y
            origin = CGPoint(x: x, y: y)
        }
    }
    
    /// The point associated with the middle-left point of this rectangle.
    var leftPoint: CGPoint {
        get { return CGPoint(x: minX, y: midY) }
        set {
            let x = newValue.x
            let y = newValue.y - height / 2.0
            origin = CGPoint(x: x, y: y)
        }
    }
    
    /// The point associated with the center of this rectangle.
    var center: CGPoint {
        get { return CGPoint(x: midX, y: midY) }
        set {
            let x = newValue.x - width  / 2.0
            let y = newValue.y - height / 2.0
            origin = CGPoint(x: x, y: y)
        }
    }
    
    /// The point associated with the middle-right point of this rectangle.
    var rightPoint: CGPoint {
        get { return CGPoint(x: maxX, y: midY) }
        set {
            let x = newValue.x - width
            let y = newValue.y - height / 2.0
            origin = CGPoint(x: x, y: y)
        }
    }
    
    /// The point associated with the bottom-left point of this rectangle.
    var bottomLeftPoint: CGPoint {
        get { return CGPoint(x: minX, y: maxY) }
        set {
            let x = newValue.x
            let y = newValue.y - height
            origin = CGPoint(x: x, y: y)
        }
    }
    
    /// The point associated with the bottom-middle point of this rectangle.
    var bottomPoint: CGPoint {
        get { return CGPoint(x: midX, y: maxY) }
        set {
            let x = newValue.x - width  / 2.0
            let y = newValue.y - height
            origin = CGPoint(x: x, y: y)
        }
    }
    
    /// The point associated with the bottom-right point of this rectangle.
    var bottomRightPoint: CGPoint {
        get { return CGPoint(x: maxX, y: maxY) }
        set {
            let x = newValue.x - width
            let y = newValue.y - height
            origin = CGPoint(x: x, y: y)
        }
    }
    
    
    // MARK: Init
    
    /// Creates a rectangle with dimensions specified as CGFloat values and the origin at zero.
    init(width: CGFloat, height: CGFloat) {
        let size = CGSize(width: width, height: height)
        self.init(origin: .zero, size: size)
    }
    
    /// Creates a rectangle with the origin at zero and the specified size.
    init(size: CGSize) {
        self.init(origin: .zero, size: size)
    }
    
}

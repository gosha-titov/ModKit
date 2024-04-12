import CoreGraphics

public extension CGSize {
    
    /// Max dimension between width and height.
    @inlinable var maxDimension: CGFloat { max(width, height) }
    
    /// Min dimension between width and height.
    @inlinable var minDimension: CGFloat { min(width, height) }
    
    
    // MARK: Init
    
    /// Creates a size with the dimension specified as CGFloat value.
    ///
    ///     let size = CGSize(side: 100.0)
    ///     size.width  // 100.0
    ///     size.height // 100.0
    ///
    @inlinable init(side: CGFloat) {
        self.init(width: side, height: side)
    }
    
    
    // MARK: Operators
    
    @inlinable static func + (lhs: CGSize, rhs: CGSize) -> CGSize {
        return CGSize(width: lhs.width + rhs.width, height: lhs.height + rhs.height)
    }

    @inlinable static func - (lhs: CGSize, rhs: CGSize) -> CGSize {
        return CGSize(width: lhs.width - rhs.width, height: lhs.height - rhs.height)
    }

    @inlinable static func * (lhs: CGSize, rhs: CGSize) -> CGSize {
        return CGSize(width: lhs.width * rhs.width, height: lhs.height * rhs.height)
    }

    @inlinable static func * (lhs: CGSize, scalar: CGFloat) -> CGSize {
        return CGSize(width: lhs.width * scalar, height: lhs.height * scalar)
    }

    @inlinable static func * (scalar: CGFloat, rhs: CGSize) -> CGSize {
        return CGSize(width: scalar * rhs.width, height: scalar * rhs.height)
    }
    
    @inlinable static func += (lhs: inout CGSize, rhs: CGSize) {
        lhs.width += rhs.width
        lhs.height += rhs.height
    }
    
    @inlinable static func -= (lhs: inout CGSize, rhs: CGSize) {
        lhs.width -= rhs.width
        lhs.height -= rhs.height
    }

    @inlinable static func *= (lhs: inout CGSize, rhs: CGSize) {
        lhs.width *= rhs.width
        lhs.height *= rhs.height
    }

    @inlinable static func *= (lhs: inout CGSize, scalar: CGFloat) {
        lhs.width *= scalar
        lhs.height *= scalar
    }
    
}

import CoreGraphics

public extension CGSize {
    
    /// Maximum dimension between this size width and its height.
    ///
    ///     size.width // 200
    ///     size.height // 50
    ///     size.maximumDimension // 200
    ///
    @inlinable var maximumDimension: CGFloat { max(width, height) }
    
    /// Minimum dimension between this size width and its height.
    ///
    ///     size.width // 200
    ///     size.height // 50
    ///     size.minimumDimension // 50
    ///
    @inlinable var minimumDimension: CGFloat { min(width, height) }
    
    /// Returns a value corresponding to the ratio of this size width to its height.
    ///
    ///     size // CGSize(width: 200, height: 100)
    ///     size.widthToHeightRatio // 2.0
    ///
    ///     // Usage example:
    ///     view.widthAnchor.constraint(
    ///         equalTo: view.heightAnchor,
    ///         multiplier: size.widthToHeightRatio
    ///     )
    @inlinable var widthToHeightRatio: CGFloat {
        return width / height
    }
    
    /// Returns a value corresponding to the ratio of this size height to its width.
    ///
    ///     size // CGSize(width: 200, height: 100)
    ///     size.heightToWidthRatio // 0.5
    ///
    ///     // Usage example:
    ///     view.heightAnchor.constraint(
    ///         equalTo: view.widthAnchor,
    ///         multiplier: size.heightToWidthRatio
    ///     )
    @inlinable var heightToWidthRatio: CGFloat {
        return height / width
    }
    
    
    // MARK: Init
    
    /// Creates a size with the specified dimension for the width and height properties.
    ///
    ///     let size = CGSize(dimension: 100.0)
    ///     size.width  // 100.0
    ///     size.height // 100.0
    ///
    @inlinable init(dimension: CGFloat) {
        self.init(width: dimension, height: dimension)
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

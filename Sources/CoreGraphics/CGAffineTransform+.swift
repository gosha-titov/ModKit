import CoreGraphics

public extension CGAffineTransform {
    
    /// Returns an affine transformation matrix constructed from the scaling value you provide.
    /// - Parameter scale: The factor by which to scale the x-axis and y-axis of the coordinate system.
    /// - Returns: A new affine transformation matrix.
    @inlinable init(scale: CGFloat) {
        self.init(scaleX: scale, y: scale)
    }
    
}

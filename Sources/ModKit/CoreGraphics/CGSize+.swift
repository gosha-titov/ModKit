import CoreGraphics

public extension CGSize {
    
    // MARK: Properties
    
    /// Max dimension between width and height.
    var maxDimension: CGFloat { max(width, height) }
    
    /// Min dimension between width and height.
    var minDimension: CGFloat { min(width, height) }
    
    
    // MARK: Init
    
    /// Creates a size with the dimension specified as CGFloat value.
    init(side: CGFloat) {
        self.init(width: side, height: side)
    }
    
}

#if canImport(CoreGraphics)

import CoreGraphics

public extension CGSize {
    
    /// Maximum dimension between this size width and its height.
    ///
    ///     size.width // 200
    ///     size.height // 50
    ///     size.maxDimension // 200
    ///
    @inlinable var maxDimension: CGFloat { max(width, height) }
    
    /// Minimum dimension between this size width and its height.
    ///
    ///     size.width // 200
    ///     size.height // 50
    ///     size.minDimension // 50
    ///
    @inlinable var minDimension: CGFloat { min(width, height) }
    
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
    
    
    // MARK: Methods
    
    /// Returns a new size with the width and height scaled so that it can fit the specified size, while maintaining the source aspect ratio.
    ///
    ///     let size = CGSize(width: 100, height: 50)
    ///
    ///     size.scaledToFit(to: CGSize(width: 80, height: 80)
    ///     // CGSize(width: 80, height: 40)
    ///
    ///     size.scaledToFit(to: CGSize(width: 120, height: 120)
    ///     // CGSize(width: 120, height: 60)
    ///
    /// - Note: The result's dimensions are not greater than the corresponding dimensions of the specified size.
    @inlinable func scaledToFit(to boundingSize: CGSize) -> CGSize {
        let widthRatio = boundingSize.width / width
        let heightRatio = boundingSize.height / height
        // In order to avoid inaccuracy like 99.99999 instead of 100.0
        if widthRatio < heightRatio {
            return CGSize(width: boundingSize.width, height: height * widthRatio)
        } else if heightRatio < widthRatio {
            return CGSize(width: width * heightRatio, height: boundingSize.height)
        } else {
            return boundingSize
        }
    }
    
    /// Returns a new size with the width and height scaled so that it can fill the specified size, while maintaining the source aspect ratio.
    ///
    ///     let size = CGSize(width: 100, height: 50)
    ///
    ///     size.scaledToFit(to: CGSize(width: 80, height: 80)
    ///     // CGSize(width: 160, height: 80)
    ///
    ///     size.scaledToFit(to: CGSize(width: 120, height: 120)
    ///     // CGSize(width: 240, height: 120)
    ///
    /// - Note: The result's dimensions are not less than the corresponding dimensions of the specified size.
    @inlinable func scaledToFill(to boundingSize: CGSize) -> CGSize {
        let widthRatio = boundingSize.width / width
        let heightRatio = boundingSize.height / height
        // In order to avoid inaccuracy like 99.99999 instead of 100.0
        if widthRatio > heightRatio {
            return CGSize(width: boundingSize.width, height: height * widthRatio)
        } else if heightRatio > widthRatio {
            return CGSize(width: width * heightRatio, height: boundingSize.height)
        } else {
            return boundingSize
        }
    }
    
    /// Returns a new size with the width and height multiplied by the specified scale factor.
    ///
    ///     let size = CGSize(width: 100, height: 50)
    ///     let newSize = size.scaled(by: 1.5)
    ///     // CGSize(width: 150, height: 75)
    ///
    @inlinable func scaled(by scale: CGFloat) -> CGSize {
        return CGSize(width: width * scale, height: height * scale)
    }
    
    
    /// Returns a new size replacing the current width with the specified one.
    ///
    ///     // Short way
    ///     let newSize = size.withWidth(newWidth)
    ///
    ///     // Manual way
    ///     let newSize = CGSize(
    ///         width: newWidth,
    ///         height: size.height
    ///     )
    @inlinable func withWidth(_ newWidth: CGFloat) -> CGSize {
        return CGSize(width: newWidth, height: height)
    }
    
    /// Returns a new size with the current width updated.
    ///
    ///     // Short way
    ///     let newSize = size.withWidth { $0 * 1.5 }
    ///
    ///     // Manual way
    ///     let newSize = CGSize(
    ///         width: size.width * 1.5,
    ///         height: size.height
    ///     )
    @inlinable func withWidth(update: (CGFloat) -> CGFloat) -> CGSize {
        return withWidth(update(width))
    }
    
    
    /// Returns a new size replacing the current height with the specified one.
    ///
    ///     // Short way
    ///     let newSize = size.withHeight(newHeight)
    ///
    ///     // Manual way
    ///     let newSize = CGSize(
    ///         width: size.width,
    ///         height: newHeight
    ///     )
    @inlinable func withHeight(_ newHeight: CGFloat) -> CGSize {
        return CGSize(width: width, height: newHeight)
    }
    
    /// Returns a new size with the current height updated.
    ///
    ///     // Short way
    ///     let newSize = size.withHeight { $0 * 1.5 }
    ///
    ///     // Manual way
    ///     let newSize = CGSize(
    ///         width: size.width,
    ///         height: size.height * 1.5
    ///     )
    @inlinable func withHeight(update: (CGFloat) -> CGFloat) -> CGSize {
        return withHeight(update(height))
    }
    
    
    // MARK: Init
    
    /// Creates a size with the specified dimension for the width and height properties.
    ///
    ///     let size = CGSize(dimension: 100)
    ///
    ///     // The same as
    ///     let size = CGSize(width: 100, height: 100)
    ///
    @inlinable init(dimension: CGFloat) {
        self.init(width: dimension, height: dimension)
    }
    
}

#endif

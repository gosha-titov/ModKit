#if canImport(UIKit)

import UIKit

public extension UIImage {
    
    /// Returns a value corresponding to the ratio of this image width to its height.
    ///
    ///     image.size // CGSize(width: 200, height: 100)
    ///     image.widthToHeightRatio // 2.0
    ///
    ///     // Usage example:
    ///     imageView.widthAnchor.constraint(
    ///         equalTo: imageView.heightAnchor,
    ///         multiplier: image.widthToHeightRatio
    ///     )
    ///
    @inlinable var widthToHeightRatio: CGFloat {
        return size.width / size.height
    }
    
    /// Returns a value corresponding to the ratio of this image height to its width.
    ///
    ///     image.size // CGSize(width: 200, height: 100)
    ///     image.heightToWidthRatio // 0.5
    ///
    ///     // Usage example:
    ///     imageView.heightAnchor.constraint(
    ///         equalTo: imageView.widthAnchor,
    ///         multiplier: image.heightToWidthRatio
    ///     )
    ///
    @inlinable var heightToWidthRatio: CGFloat {
        return size.height / size.width
    }
    
    
    // MARK: Methods
    
    /// Returns a created image fully filled with the specified color.
    ///
    ///     let image: UIImage = .filled(withColor: .red)
    ///
    @inlinable static func filled(withColor color: UIColor, size: CGSize = CGSize(side: 1)) -> UIImage {
        return UIGraphicsImageRenderer(size: size).image { rendererContext in
            color.setFill()
            rendererContext.fill(CGRect(origin: .zero, size: size))
        }
    }
    
}

#endif

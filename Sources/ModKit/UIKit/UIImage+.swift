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
    var widthToHeightRatio: CGFloat {
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
    var heightToWidthRatio: CGFloat {
        return size.height / size.width
    }
    
}

#endif

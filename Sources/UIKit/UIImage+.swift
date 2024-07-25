#if canImport(UIKit)

import UIKit

public extension UIImage {
    
    // MARK: Methods
    
    /// Returns a created image fully filled with the specified color.
    ///
    ///     let image: UIImage = .filled(withColor: .red)
    ///
    @inlinable static func filled(withColor color: UIColor, size: CGSize = CGSize(dimension: 1)) -> UIImage {
        return UIGraphicsImageRenderer(size: size).image { rendererContext in
            color.setFill()
            rendererContext.fill(CGRect(origin: .zero, size: size))
        }
    }
    
    /// Returns a new version of the current image with the specified insets.
    @inlinable func withInsets(_ insets: UIEdgeInsets) -> UIImage {
        let newSize = CGSize(
            width: size.width + insets.left + insets.right,
            height: size.height + insets.top + insets.bottom
        )
        return UIGraphicsImageRenderer(size: newSize).image { rendererContext in
            let origin = CGPoint(x: insets.left, y: insets.top)
            draw(at: origin)
        }
    }
    
}

#endif

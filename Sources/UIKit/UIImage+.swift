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
    
}

#endif

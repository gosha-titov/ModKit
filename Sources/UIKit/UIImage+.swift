#if canImport(UIKit)

import UIKit

public extension UIImage {
    
    // MARK: Methods
    
    /// Returns a created image with the specific gradient.
    ///
    ///     let image: UIImage = .gradient(
    ///         size: frame.size,
    ///         colors: [.red, .blue, .yellow]
    ///     )
    ///
    /// - Parameter size: The size of a result image.
    /// - Parameter colors: The array of colors for each gradient stop.
    /// - Parameter startPoint: The start point of the gradient when drawn in the layer’s coordinate space.
    /// - Parameter endPoint: The end point of the gradient when drawn in the layer’s coordinate space.
    /// - Note: The points are defined in the unit coordinate space (0...1) and are then mapped to the result rectangle when drawn.
    @inlinable static func gradient(size: CGSize, colors: [UIColor], startPoint: CGPoint = CGPoint(x: 0.5, y: 0.0), endPoint: CGPoint = CGPoint(x: 0.5, y: 1.0)) -> UIImage {
        guard size != .zero, colors.isEmpty == false else { return UIImage() }
        let format = UIGraphicsImageRendererFormat.default()
        format.opaque = true
        let renderer = UIGraphicsImageRenderer(size: size, format: format)
        return renderer.image { context in
            let colorSpace = CGColorSpaceCreateDeviceRGB()
            let options = CGGradientDrawingOptions()
            let colors = colors.map(\.cgColor) as NSArray
            let gradient = CGGradient(colorsSpace: colorSpace, colors: colors, locations: nil)!
            let startPoint = CGPoint(
                x: size.width * startPoint.x,
                y: size.height * startPoint.y
            )
            let endPoint = CGPoint(
                x: size.width * endPoint.x,
                y: size.height * endPoint.y
            )
            context.cgContext.drawLinearGradient(gradient, start: startPoint, end: endPoint, options: options)
        }
    }
    
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

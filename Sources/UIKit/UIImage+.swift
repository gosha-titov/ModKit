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
        
    /// Returns an average color of this image.
    @inlinable func averageColor() -> UIColor? {
        guard let ciImage = ciImage ?? CIImage(image: self) else { return nil }
        let parameters = [kCIInputImageKey: ciImage, kCIInputExtentKey: CIVector(cgRect: ciImage.extent)]
        let filter = CIFilter(name: "CIAreaAverage", parameters: parameters)
        guard let outputImage = filter?.outputImage else { return nil }
        var bitmap = [UInt8](repeating: 0, count: 4)
        let workingColorSpace: Any = cgImage?.colorSpace ?? NSNull()
        let context = CIContext(options: [.workingColorSpace: workingColorSpace])
        let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
        context.render(
            outputImage, toBitmap: &bitmap, rowBytes: 4,
            bounds: rect, format: .RGBA8, colorSpace: nil
        )
        return UIColor(
            red:   CGFloat(bitmap[0]) / 255.0,
            green: CGFloat(bitmap[1]) / 255.0,
            blue:  CGFloat(bitmap[2]) / 255.0,
            alpha: CGFloat(bitmap[3]) / 255.0
        )
    }
    
    
    /// Returns a new version of the current image with rounded corners
    /// - Parameter radius: The radius of each corner. A value of 0 results in an image without rounded corners.
    ///   Values larger than half the rectangle’s width or height are clamped appropriately to half the width or height.
    ///   If `nil` is specified, the maximum possible radius is used to round corners.
    @inlinable func withRoundedCorners(ofRadius radius: CGFloat? = nil) -> UIImage {
        let maxRadius = size.minDimension / 2
        let radius = if let radius { radius.clamped(to: 0...maxRadius) } else { maxRadius }
        guard radius > 0 else { return self }
        let rect = CGRect(origin: .zero, size: size)
        let bezierPath = UIBezierPath(roundedRect: rect, cornerRadius: radius)
        let format = UIGraphicsImageRendererFormat.default()
        format.scale = scale
        let renderer = UIGraphicsImageRenderer(size: size, format: format)
        return renderer.image { _ in
            bezierPath.addClip()
            draw(in: rect)
        }
    }
    
    /// Returns a new version of the current image with the specified insets.
    @inlinable func withInsets(_ insets: UIEdgeInsets) -> UIImage {
        let newSize = CGSize(
            width: size.width + insets.left + insets.right,
            height: size.height + insets.top + insets.bottom
        )
        return UIGraphicsImageRenderer(size: newSize).image { _ in
            let origin = CGPoint(x: insets.left, y: insets.top)
            draw(at: origin)
        }
    }
    
    
    // MARK: Inits
    
    /// Creates an image fully filled with the specified color.
    ///
    ///     let image = UIImage(color: .red)
    ///
    /// - Parameter color: The color that will fill an entire result image.
    /// - Parameter size: The size of a result image.
    @inlinable convenience init(color: UIColor, size: CGSize = CGSize(dimension: 1)) {
        let format = UIGraphicsImageRendererFormat.default()
        format.scale = 1
        let renderer = UIGraphicsImageRenderer(size: size, format: format)
        let image = renderer.image { context in
            color.setFill()
            context.fill(context.format.bounds)
        }
        guard let cgImage = image.cgImage else {
            self.init()
            return
        }
        self.init(cgImage: cgImage)
    }
    
}

#endif

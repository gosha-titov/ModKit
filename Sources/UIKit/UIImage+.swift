#if canImport(UIKit)

import UIKit

public extension UIImage {
    
    // MARK: Methods
    
    /// Returns a created image with the specific gradient.
    ///
    ///     let image: UIImage = .gradient(
    ///         size: frame.size,
    ///         colors: [.white, .blue, .red]
    ///     )
    ///
    /// - Parameter size: The size of a result image.
    /// - Parameter colors: The array of colors for each gradient stop.
    /// - Parameter startPoint: The start point of the gradient when drawn in the layer’s coordinate space.
    /// - Parameter endPoint: The end point of the gradient when drawn in the layer’s coordinate space.
    /// - Note: The points are defined in the unit coordinate space (0...1) and are then mapped to the result rectangle when drawn.
    @inlinable
    static func gradient(size: CGSize, colors: [UIColor], startPoint: CGPoint = CGPoint(x: 0.5, y: 0.0), endPoint: CGPoint = CGPoint(x: 0.5, y: 1.0)) -> UIImage {
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
    @inlinable
    func averageColor() -> UIColor? {
        guard let ciImage = ciImage ?? CIImage(image: self) else { return nil }
        let parameters = [kCIInputImageKey: ciImage, kCIInputExtentKey: CIVector(cgRect: ciImage.extent)]
        let filter = CIFilter(name: "CIAreaAverage", parameters: parameters)
        guard let outputImage = filter?.outputImage else { return nil }
        var bitmap = [UInt8](repeating: 0, count: 4)
        let workingColorSpace: Any = cgImage?.colorSpace ?? NSNull()
        let context = CIContext(options: [.workingColorSpace: workingColorSpace])
        let rect = CGRect(width: 1, height: 1)
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
    
    
    /// Returns a new image with a size scaled so that it can fit the specified size, while maintaining the source aspect ratio.
    /// - Note: The result image’s dimensions are not greater than the corresponding dimensions of the specified size.
    @inlinable
    func scaledToFit(to availableSize: CGSize) -> UIImage {
        let newSize = size.scaledToFit(to: availableSize)
        let renderer = UIGraphicsImageRenderer(size: newSize)
        return renderer.image { _ in
            draw(in: CGRect(size: newSize))
        }
    }
    
    /// Returns a new image with a size scaled so that it can fill the specified size, while maintaining the source aspect ratio.
    /// - Note: The result image’s dimensions are not less than the corresponding dimensions of the specified size.
    @inlinable
    func scaledToFill(to availableSize: CGSize) -> UIImage {
        let newSize = size.scaledToFill(to: availableSize)
        let renderer = UIGraphicsImageRenderer(size: newSize)
        return renderer.image { _ in
            draw(in: CGRect(size: newSize))
        }
    }
    
    /// Returns a new image cropped to the specified size from the center.
    /// - Parameter size: The size of the result image.
    ///   If `nil` is specified, the image will be cropped to a maximum fitting square.
    @inlinable
    func cropped(to newSize: CGSize? = nil) -> UIImage {
        let newSize = newSize.orElse(CGSize(dimension: size.minimumDimension))
        let renderer = UIGraphicsImageRenderer(size: newSize)
        return renderer.image { _ in
            let origin = CGPoint(
                x: -(size.width - newSize.width) / 2,
                y: -(size.height - newSize.height) / 2
            )
            draw(at: origin)
        }
    }
    
    /// Returns a new image cropped to the specified rectangle.
    @inlinable
    func cropped(to rect: CGRect) -> UIImage {
        let renderer = UIGraphicsImageRenderer(size: rect.size)
        return renderer.image { context in
            let origin = CGPoint(
                x: -rect.origin.x,
                y: -rect.origin.y
            )
            draw(at: origin)
        }
    }
    
    /// Returns a new image with rounded corners.
    /// - Parameter radius: The radius of each corner. A value of 0 results in an image without rounded corners.
    ///   Values larger than half the rectangle’s width or height are clamped appropriately to half the width or height.
    ///   If `nil` is specified, the maximum possible radius is used to round corners.
    @inlinable
    func rounded(withRadius radius: CGFloat? = nil) -> UIImage {
        let maxRadius = size.minimumDimension / 2
        let radius = radius
            .map { $0.clamped(to: 0...maxRadius) }
            .orElse(maxRadius)
        guard radius > 0 else { return self }
        let rect = CGRect(size: size)
        let bezierPath = UIBezierPath(roundedRect: rect, cornerRadius: radius)
        let renderer = UIGraphicsImageRenderer(size: size)
        return renderer.image { _ in
            bezierPath.addClip()
            draw(in: rect)
        }
    }
    
    /// Returns a new image with a border added.
    /// - Parameter color: The color of the border.
    /// - Parameter width: The width of the border.
    /// - Parameter radius: The radius of each corner.
    ///   Values larger than half the rectangle’s width or height are clamped appropriately to half the width or height.
    ///   If `nil` is specified, the maximum possible radius is used to round corners.
    @inlinable
    func bordered(withColor color: UIColor, width: CGFloat, radius: CGFloat? = nil) -> UIImage {
        let maxRadius = size.minimumDimension / 2
        let radius = radius
            .map { $0.clamped(to: 0...maxRadius) }
            .orElse(maxRadius)
        let rect = CGRect(size: size)
        let lineRect = rect.insetBy(dx: width / 2, dy: width / 2)
        let bezierPath = if radius > .zero {
            UIBezierPath(roundedRect: lineRect, cornerRadius: radius)
        } else {
            UIBezierPath(rect: lineRect)
        }
        bezierPath.lineWidth = width
        let renderer = UIGraphicsImageRenderer(size: size)
        return renderer.image { context in
            draw(in: rect)
            context.cgContext.setStrokeColor(color.cgColor)
            bezierPath.stroke()
        }
    }
    
    /// Returns a new image with the specified margins.
    @inlinable
    func withMargins(_ margins: UIEdgeInsets) -> UIImage {
        let newSize = CGSize(
            width: size.width + margins.left + margins.right,
            height: size.height + margins.top + margins.bottom
        )
        return UIGraphicsImageRenderer(size: newSize).image { _ in
            let origin = CGPoint(x: margins.left, y: margins.top)
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
    @inlinable @inline(__always)
    convenience init(size: CGSize = CGSize(dimension: 1), color: UIColor) {
        let renderer = UIGraphicsImageRenderer(size: size)
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

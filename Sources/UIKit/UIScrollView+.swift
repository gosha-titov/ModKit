#if canImport(UIKit)

import UIKit

public extension UIScrollView {
    
    /// Scrolls to top by setting the content offset to zero.
    /// - Parameter animated: Specify `true` to animate scroll transition, or `false` if you do not want the scroll transition to be animated.
    /// The default value is `true`.
    @inlinable func scrollToTop(animated: Bool = true) {
        setContentOffset(.zero, animated: animated)
    }
    
    /// Scrolls to bottom by setting the content offset to the bottom point.
    /// - Parameter animated: Specify `true` to animate scroll transition, or `false` if you do not want the scroll transition to be animated.
    /// The default value is `true`.
    @inlinable func scrollToBottom(animated: Bool = true) {
        let yOffset: CGFloat = contentSize.height - bounds.size.height
        guard yOffset > 0 else { return }
        let offset = CGPoint(x: 0, y: yOffset)
        setContentOffset(offset, animated: animated)
    }
    
    /// Zooms to a specific point of the content so that it’s visible in the scroll view.
    /// - Parameter point: A point to zoom. The point should be in the coordinate space of the view.
    /// - Parameter animated: `True` if the scrolling should be animated, `false` if it should be immediate.
    @inlinable func zoom(to point: CGPoint, animated: Bool) {
        let minScale = minimumZoomScale
        let maxScale = maximumZoomScale
        let currentScale = zoomScale
        guard ((minScale == maxScale) && (minScale > 1)) == false else { return }
        let scale = (currentScale == minScale) ? maxScale : minScale
        let size = CGSize(
            width:  bounds.size.width  / scale,
            height: bounds.size.height / scale
        )
        let origin = CGPoint(
            x: point.x - (size.width  / 2),
            y: point.y - (size.height / 2)
        )
        zoom(to: CGRect(origin: origin, size: size), animated: animated)
    }
    
}

#endif

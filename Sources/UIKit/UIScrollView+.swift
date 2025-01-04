#if canImport(UIKit)

import UIKit

public extension UIScrollView {
    
    /// Scrolls to top by setting the content offset to the top point.
    /// - Parameter animated: Specify `true` to animate the transition at a constant
    ///   velocity to the new offset, `false` to make the transition immediate.
    @inlinable func scrollToTop(animated: Bool = true) {
        let topPoint = CGPoint(x: contentOffset.x, y: .zero)
        setContentOffset(topPoint, animated: animated)
    }
    
    /// Scrolls to left by setting the content offset to the left point.
    /// - Parameter animated: Specify `true` to animate the transition at a constant
    ///   velocity to the new offset, `false` to make the transition immediate.
    @inlinable func scrollToLeft(animated: Bool = true) {
        let leftPoint = CGPoint(x: .zero, y: contentOffset.y)
        setContentOffset(leftPoint, animated: animated)
    }
    
    /// Scrolls to bottom by setting the content offset to the bottom point.
    /// - Parameter animated: Specify `true` to animate the transition at a constant
    ///   velocity to the new offset, `false` to make the transition immediate.
    @inlinable func scrollToBottom(animated: Bool = true) {
        let yOffset: CGFloat = contentSize.height - bounds.size.height
        guard yOffset > 0 else { return }
        let bottomPoint = CGPoint(x: contentOffset.x, y: yOffset)
        setContentOffset(bottomPoint, animated: animated)
    }
    
    /// Scrolls to bottom by setting the content offset to the bottom point.
    /// - Parameter animated: Specify `true` to animate the transition at a constant
    ///   velocity to the new offset, `false` to make the transition immediate.
    @inlinable func scrollToRight(animated: Bool = true) {
        let xOffset: CGFloat = contentSize.width - bounds.size.width
        guard xOffset > 0 else { return }
        let rightPoint = CGPoint(x: xOffset, y: contentOffset.y)
        setContentOffset(rightPoint, animated: animated)
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

#if canImport(UIKit)

import UIKit

public extension UIScrollView {
    
    /// Scrolls to top by setting the content offset to zero.
    /// - Parameter animated: Specify `true` to animate scroll transition, or `false` if you do not want the scroll transition to be animated.
    /// The default value is `true`.
    func scrollToTop(animated: Bool = true) -> Void {
        setContentOffset(.zero, animated: animated)
    }
    
    /// Scrolls to bottom by setting the content offset to the bottom point.
    /// - Parameter animated: Specify `true` to animate scroll transition, or `false` if you do not want the scroll transition to be animated.
    /// The default value is `true`.
    func scrollToBottom(animated: Bool = true) -> Void {
        let yOffset: CGFloat = contentSize.height - bounds.size.height
        guard yOffset > 0 else { return }
        let offset = CGPoint(x: 0, y: yOffset)
        setContentOffset(offset, animated: animated)
    }
    
}

#endif

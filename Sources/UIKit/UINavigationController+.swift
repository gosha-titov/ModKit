#if canImport(UIKit)

import UIKit

public extension UINavigationController {
    
    /// Pushes a view controller onto the receiver’s stack and updates the display.
    @inlinable @inline(__always)
    func pushViewController(_ viewController: UIViewController, animated: Bool = true, completion: @escaping () -> Void) {
        CATransaction.begin()
        CATransaction.setCompletionBlock(completion)
        pushViewController(viewController, animated: animated)
        CATransaction.commit()
    }
    
    /// Pops the top view controller from the navigation stack and updates the display.
    @inlinable @inline(__always) @discardableResult
    func popViewController(animated: Bool = true, completion: @escaping () -> Void) -> UIViewController? {
        CATransaction.begin()
        CATransaction.setCompletionBlock(completion)
        let viewController = popViewController(animated: animated)
        CATransaction.commit()
        return viewController
    }
    
    /// Pops view controllers until the specified view controller is at the top of the navigation stack.
    @inlinable @inline(__always) @discardableResult
    func popToViewController(_ viewController: UIViewController, animated: Bool, completion: (() -> Void)?) -> [UIViewController]? {
        CATransaction.begin()
        CATransaction.setCompletionBlock(completion)
        let viewControllers = popToViewController(viewController, animated: animated)
        CATransaction.commit()
        return viewControllers
    }
    
    /// Pops all the view controllers on the stack except the root view controller and updates the display.
    @inlinable @inline(__always) @discardableResult
    func popToRootViewController(animated: Bool = true, completion: @escaping () -> Void) -> [UIViewController]? {
        CATransaction.begin()
        CATransaction.setCompletionBlock(completion)
        let viewControllers = popToRootViewController(animated: animated)
        CATransaction.commit()
        return viewControllers
    }
}

#endif

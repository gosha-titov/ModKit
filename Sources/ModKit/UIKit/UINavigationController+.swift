#if canImport(UIKit)

import UIKit

public extension UINavigationController {
    
    /// Pushes a view controller onto the receiver’s stack and updates the display.
    func pushViewController(_ viewController: UIViewController, animated: Bool = true, completion: @escaping () -> Void) -> Void {
        CATransaction.begin()
        CATransaction.setCompletionBlock(completion)
        pushViewController(viewController, animated: animated)
        CATransaction.commit()
    }
    
    /// Pops the top view controller from the navigation stack and updates the display.
    func popViewController(animated: Bool = true, completion: @escaping () -> Void) -> UIViewController? {
        CATransaction.begin()
        CATransaction.setCompletionBlock(completion)
        let viewController = popViewController(animated: animated)
        CATransaction.commit()
        return viewController
    }
    
    /// Pops all the view controllers on the stack except the root view controller and updates the display.
    func popToRootViewController(animated: Bool = true, completion: @escaping () -> Void) -> [UIViewController]? {
        CATransaction.begin()
        CATransaction.setCompletionBlock(completion)
        let viewControllers = popToRootViewController(animated: animated)
        CATransaction.commit()
        return viewControllers
    }
}

#endif

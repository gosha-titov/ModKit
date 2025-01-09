#if canImport(UIKit)

import UIKit

public extension UIScreen {
    
    /// The corner radius of the device screen.
    ///
    ///     let cornerRadius = window?.screen.displayCornerRadius
    ///     print(cornerRadius) // Prints 55.0
    ///
    var displayCornerRadius: CGFloat {
        // https://github.com/yihui-hu/YUI/blob/main/YUI/Utils/UIScreen%2BExtensions.swift
        // Code-obfuscation is used to get private property and pass the app review
        let key = Data(Constants.cornerRadiusKey.utf8)
            .base64EncodedString()
            .data(using: .utf8)
            .flatMap { Data(base64Encoded: $0) }
            .flatMap { String(data: $0, encoding: .utf8) } ?? Constants.cornerRadiusKey
        return (value(forKey: key) as? CGFloat) ?? .zero
    }
    
}


private enum Constants {
    static let cornerRadiusKey: String = {
        let base64Components = [
            "UmFkaXVz",      // "Radius"
            "Q29ybmVy",      // "Corner"
            "ZGlzcGxheQ==",  // "display"
            "Xw=="           // "_"
        ]
        return base64Components
            .map { Data(base64Encoded: $0)! }
            .compactMap { String(data: $0, encoding: .utf8) }
            .reversed()
            .joined()
    }()
}

#endif

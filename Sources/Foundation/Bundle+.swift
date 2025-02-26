#if canImport(Foundation)

import Foundation

public extension Bundle {
    
    /// The displayed name of the application.
    @inlinable @inline(__always)
    var appName: String {
        return infoDictionary?["CFBundleDisplayName"] as? String ?? ""
    }

    /// The version of the application.
    ///
    ///     print(Bundle.main.appVersion) // "1.0.4"
    ///     print(Bundle.main.appBuild)   // "1.0.4.32"
    ///
    @inlinable @inline(__always)
    var appVersion: String {
        return infoDictionary?["CFBundleShortVersionString"] as? String ?? ""
    }

    /// The build number of the application, that is used for development and testing
    ///
    ///     print(Bundle.main.appVersion) // "1.0.4"
    ///     print(Bundle.main.appBuild)   // "1.0.4.32"
    ///
    @inlinable @inline(__always)
    var appBuild: String {
        return infoDictionary?["CFBundleVersion"] as? String ?? ""
    }
    
    /// The code of the language in which the system runs the application.
    @inlinable @inline(__always)
    var appLanguage: String {
        return preferredLocalizations.first ?? "en"
    }
    
}

#endif

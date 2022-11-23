public extension Optional {
    
    // MARK: Properties
    
    /// A Boolean value that indicates whether this optional object is `nil`.
    ///
    ///     var age: Int?
    ///     age.isNil // true
    ///
    var isNil: Bool { self == nil }
    
    /// A Boolean value that indicates whether this optional object is not `nil`.
    ///
    ///     var name: String? = "gosha"
    ///     name.hasValue // true
    ///
    var hasValue: Bool { self != nil }
    
    
    // MARK: Methods
    
    /// Returns the unwrapped value of this instance or the given default value.
    ///
    ///     var score: Int? = nil
    ///     score.unwrapped(or: 10) // 10
    ///
    ///     score = 50
    ///     score.unwrapped(or: 10) // 50
    ///
    func unwrapped(or defaultValue: Wrapped) -> Wrapped {
        return self ?? defaultValue
    }
    
    /// Executes the given code if `self` is not `nil`.
    ///
    ///     var name: String? = "gosha"
    ///     name.executeSafely {
    ///         print("Hello, \($0)!")
    ///     }
    ///     // prints "Hello, gosha!"
    ///
    /// - Parameter code: A closure that takes the unwrapped value as a parameter.
    ///
    func executeSafely(_ code: (Wrapped) -> Void) -> Void {
        if let value = self { code(value) }
    }
    
}


public extension Optional where Wrapped: Collection {
    
    /// A Boolean value that indicates whether the optional object is empty or `nil`.
    ///
    ///     var str: String? = nil
    ///     str.isEmptyOrNil // true
    ///
    ///     var array: [Int]? = []
    ///     array.isEmptyOrNil // true
    ///
    ///     var dict: [Int: String]? = [12: "34"]
    ///     dict.isEmptyOrNil // false
    ///
    var isEmptyOrNil: Bool {
        return self?.isEmpty ?? true
    }
    
}

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

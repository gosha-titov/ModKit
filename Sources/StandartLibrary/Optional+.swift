public extension Optional {
    
    /// A boolean value that indicates whether this optional object is not `nil`.
    ///
    ///     var name: String? = "gosha"
    ///     name.hasValue // true
    ///
    @inlinable var hasValue: Bool { self != nil }
    
}


public extension Optional where Wrapped: Collection {
    
    /// A boolean value that indicates whether the optional object is empty or `nil`.
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
    @inlinable var isEmptyOrNil: Bool {
        return self?.isEmpty ?? true
    }
    
}

public extension Optional {
    
    /// A boolean value that indicates whether this optional object is not `nil`.
    ///
    ///     var project: String? = "modkit"
    ///     project.hasValue // true
    ///
    @inlinable @inline(__always)
    var hasValue: Bool { self != nil }
    
    
    // MARK: Methods
    
    /// Returns the unwrapped value; otherwise, provides the default value.
    ///
    ///     let text = maybeData
    ///         .map { String(data: $0, encoding: .utf8) }
    ///         .orElse(.empty)
    ///
    @inlinable @inline(__always)
    func orElse(_ defaultValue: @autoclosure () throws -> Wrapped) rethrows -> Wrapped {
        return if let value = self { value } else { try defaultValue() }
    }
    
    /// Returns the unwrapped value; otherwise, throws an error.
    ///
    ///     let text = try maybeData
    ///         .map { String(data: $0, encoding: .utf8) }
    ///         .orThrow(DecodingError.invalidData)
    ///
    @inlinable @inline(__always)
    func orThrow(_ error: @autoclosure () -> Error) throws -> Wrapped {
        if let value = self { return value } else { throw error() }
    }
    
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
    @inlinable @inline(__always)
    var isEmptyOrNil: Bool {
        return self?.isEmpty ?? true
    }
    
}

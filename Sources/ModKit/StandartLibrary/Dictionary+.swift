public extension Dictionary {
    
    /// Returns a Boolean value that indicates whether the given key exists in this dictionary.
    ///
    ///     let dict = [0: "a", 1: "b", 2: "c"]
    ///     dict.hasKey(2) // true
    ///     dict.hasKey(3) // false
    ///
    func hasKey(_ key: Key) -> Bool { self[key].hasValue }
    
}


public extension Dictionary where Value: Equatable {
    
    /// Returns a key of the given value; otherwise, `nil`.
    ///
    ///     let dict = ["a": 1, "b": 2, "c": 3]
    ///     dict.key(byValue: 2) // "b"
    ///     dict.key(byValue: 0) // nil
    ///
    func key(byValue value: Value) -> Key? {
        return first { $1 == value }?.key
    }
    
}

public extension Dictionary where Value: AnyObject {
    
    /// Returns a key where its value and the given one are the same reference; otherwise, `nil`.
    ///
    ///     class T {}
    ///     let t0 = T(), t1 = T(), t2 = T()
    ///     let dict = [0: t0, 1: t1]
    ///     dict.key(byReference: t1) // 1
    ///     dict.key(byReference: t2) // nil
    ///
    func key(byReference value: Value) -> Key? {
        return first { $1 === value }?.key
    }
    
}

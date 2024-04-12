public extension Dictionary {
    
    /// Returns a Boolean value that indicates whether the given key exists in this dictionary.
    ///
    ///     let dict = [0: "a", 1: "b", 2: "c"]
    ///     dict.hasKey(2) // true
    ///     dict.hasKey(3) // false
    ///
    @inlinable func hasKey(_ key: Key) -> Bool { self[key].hasValue }
    
}


public extension Dictionary where Value: Equatable {
    
    /// Returns a key of the given value; otherwise, `nil`.
    ///
    ///     let dict = ["a": 1, "b": 2, "c": 3]
    ///     dict.key(byValue: 2) // "b"
    ///     dict.key(byValue: 0) // nil
    ///
    @inlinable func key(byValue value: Value) -> Key? {
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
    @inlinable func key(byReference value: Value) -> Key? {
        return first { $1 === value }?.key
    }
    
}


public extension Dictionary.Keys {
    
    /// Returns an array consisting of keys.
    ///
    /// Unfortunately, you can't get the array of keys directly.
    /// Therefore, we have to use such "hacks":
    ///
    ///     let dict = ["a": 1, "b": 2]
    ///     let keys: [String] = dict.keys.toArray // ["a", "b"]
    ///
    @inlinable var toArray: [Key] { Array(self) }
    
}


public extension Dictionary.Values {
    
    /// Returns an array consisting of values.
    ///
    /// Unfortunately, you can't get the array of values directly.
    /// Therefore, we have to use such "hacks":
    ///
    ///     let dict = ["a": 1, "b": 2]
    ///     let values: [Int] = dict.values.toArray // [1, 2]
    ///
    @inlinable var toArray: [Value] { Array(self) }
    
}

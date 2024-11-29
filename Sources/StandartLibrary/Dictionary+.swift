public extension Dictionary {
    
    /// Creates a dictionary that has no key-value pairs.
    ///
    /// It's often used when you need to specify the empty dictionary as an argument:
    ///
    ///     let c = Configuration(attributes: .empty)
    ///
    @inlinable static var empty: Self { [:] }
    
    
    // MARK: Methods
    
    /// Returns a Boolean value that indicates whether the given key exists in this dictionary.
    ///
    ///     let dict = [0: "a", 1: "b", 2: "c"]
    ///     dict.hasKey(2) // true
    ///     dict.hasKey(3) // false
    ///
    @inlinable func hasKey(_ key: Key) -> Bool { self[key].hasValue }
    
    /// Returns a new dictionary that is a copy of this one with the specified value added.
    ///
    ///     let values = sourceValues.adding(newValue, forKey: key)
    ///
    @inlinable func adding(_ value: Value, forKey key: Key) -> Self {
        var mutableSelf = self
        mutableSelf[key] = value
        return mutableSelf
    }
    
    /// Returns a new dictionary that is a copy of this one but a value for the specified key removed.
    ///
    ///     let values = sourceValues.removingValue(forKey: key)
    ///
    @inlinable func removingValue(forKey key: Key) -> Self {
        var mutableSelf = self
        mutableSelf.removeValue(forKey: key)
        return mutableSelf
    }
    
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

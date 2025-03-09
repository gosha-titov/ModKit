public extension Dictionary {
    
    /// Creates a dictionary that has no key-value pairs.
    @inlinable @inline(__always)
    static var empty: Self { [:] }
    
    
    // MARK: Methods
    
    /// Returns a Boolean value that indicates whether the given key exists in this dictionary.
    ///
    ///     let dict = [0: "a", 1: "b", 2: "c"]
    ///     dict.hasKey(2) // true
    ///     dict.hasKey(3) // false
    ///
    @inlinable @inline(__always)
    func hasKey(_ key: Key) -> Bool {
        return self[key].hasValue
    }
    
    
    /// Returns a new dictionary that is a copy of this one with the value updated or added for the specified key.
    ///
    ///     let dict = [0: "a", 1: "b"]
    ///     dict.adding("c", forKey: 2) // [0: "a", 1: "b", 2: "c"]
    ///
    @inlinable @inline(__always)
    func adding(_ value: Value, forKey key: Key) -> Self {
        return mutating(self) { $0.updateValue(value, forKey: key) }
    }
    
    /// Returns a new dictionary that is a copy of this one but a value for the specified key removed.
    ///
    ///     let dict = [0: "a", 1: "b", 2: "c"]
    ///     dict.removingValue(forKey: 1) // [0: "a", 2: "c"]
    ///
    @inlinable @inline(__always)
    func removingValue(forKey oldKey: Key) -> Self {
        return mutating(self) { $0.removeValue(forKey: oldKey) }
    }
    
    /// Returns a new dictionary that is a copy of this one but values for the specified keys removed.
    ///
    ///     let dict = [0: "a", 1: "b", 2: "c"]
    ///     dict.removingValues(forKeys: [0, 1]) // [2: "c"]
    ///
    @inlinable @inline(__always)
    func removingValues(forKeys oldKeys: any Sequence<Key>) -> Self {
        return mutating(self) { $0.removeValues(forKeys: oldKeys) }
    }
    
    /// Removes the specified keys and their associated value from the dictionary.
    ///
    ///     var dict = [0: "a", 1: "b", 2: "c"]
    ///     dict.removeValues(forKeys: [0, 1]) // [2: "c"]
    ///
    @inlinable @inline(__always)
    mutating func removeValues(forKeys oldKeys: any Sequence<Key>) {
        oldKeys.forEach { removeValue(forKey: $0) }
    }
    
    
    /// Removes all the key-value pairs that satisfy the given predicate.
    ///
    ///     var dict = [0: "a", 1: "", 2: "c"]
    ///     dict.removeValues(where: \.isEmpty) // [0: "a", 2: "c"]
    ///
    @inlinable @inline(__always)
    mutating func removeValues(where shouldBeRemoved: (Value) -> Bool) {
        self = removingValues(where: shouldBeRemoved)
    }
    
    /// Returns a new dictionary with removed key-value pairs satisfying the given predicate.
    ///
    ///     let dict = [0: "a", 1: "", 2: "c"]
    ///     dict.removingValues(where: \.isEmpty) // [0: "a", 2: "c"]
    ///
    @inlinable @inline(__always)
    func removingValues(where shouldBeRemoved: (Value) -> Bool) -> Self {
        return filter { !shouldBeRemoved($0.value) }
    }
    
}


public extension Dictionary where Value: Equatable {
    
    /// Returns an array of keys whose corresponding values equal to the specified value.
    ///
    ///     let dict = [0: "a", 1: "b", 2: "c"]
    ///     dict.keys(forValue: "b") // [1]
    ///     dict.keys(forValue: "e") // []
    ///
    @inlinable @inline(__always)
    func keys(forValue value: Value) -> [Key] {
        return filter { $0.value == value }.map(\.key)
    }
    
}


public extension Dictionary where Value: AnyObject {
    
    /// Returns an array of keys whose corresponding values and the specified value are the same objects.
    ///
    ///     class T {}
    ///     let t0 = T(), t1 = T(), t2 = T()
    ///     let dict = [0: t0, 1: t1]
    ///     dict.keys(forReference: t1) // [1]
    ///     dict.keys(forReference: t2) // []
    ///
    @inlinable @inline(__always)
    func keys(forReference value: Value) -> [Key] {
        return filter { $0.value === value }.map(\.key)
    }
    
}

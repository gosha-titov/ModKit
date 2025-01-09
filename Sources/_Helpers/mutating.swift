/// Returns a copy of the specified value making some changes
///
///     let array = [1, 2, 3]
///     let mutatedArray = mutating(array) {
///         $0.append(4)
///     }
///     print(mutatedArray)
///     // Prints [1, 2, 3, 4]
///
/// - Note: This method allows you use `mutating` methods over a copy of some constant value.
@usableFromInline
internal func mutating<V>(_ value: V, mutate: (inout V) -> Void) -> V {
    var value = value
    mutate(&value)
    return value
}

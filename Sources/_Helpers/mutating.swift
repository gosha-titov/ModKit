/// Returns a copy of the specified value with making some changes
///
///     let mutatedArray = mutating(array) {
///         $0.append(element)
///     }
///
@usableFromInline
internal func mutating<V>(_ value: V, mutate: (inout V) -> Void) -> V {
    var value = value
    mutate(&value)
    return value
}

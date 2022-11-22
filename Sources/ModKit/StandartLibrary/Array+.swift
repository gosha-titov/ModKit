public extension Array {
    
    /// Returns an array containing all elements but an element was rearranged from one specific position to another.
    ///
    ///     let array = [0, 1, 2, 3]
    ///     array.rearrangedElement(from: 3, to: 1) // [0, 3, 1, 2]
    ///
    func rearrangedElement(from indexToRemove: Int, to indexToInsert: Int) -> [Element] {
        var array = self
        let element = array.remove(at: indexToRemove)
        array.insert(element, at: indexToInsert)
        return array
    }
    
    /// Rearranges an element from one specific position to another.
    ///
    ///     var array = [0, 1, 2, 3]
    ///     array.rearrangeElement(from: 3, to: 1) // [0, 3, 1, 2]
    ///
    mutating func rearrangeElement(from indexToRemove: Int, to indexToInsert: Int) -> Void {
        self = rearrangedElement(from: indexToRemove, to: indexToInsert)
    }
    
    /// Returns the first K elements of this array.
    ///
    ///     let arr = [1, 2, 3, 4, 5]
    ///     arr.first(3) // [1, 2, 3]
    ///
    func first(_ k: Int) -> [Element] {
        let k = k > count ? count : k
        var first = [Element]()
        for i in 0..<k {
            first.append(self[i])
        }
        return first
    }
    
    /// Returns the last K elements of this array.
    ///
    ///     let arr = [1, 2, 3, 4, 5]
    ///     arr.last(3) // [3, 4, 5]
    ///
    func last(_ k: Int) -> [Element] {
        let k = k > count ? count : k
        var last = [Element]()
        for i in (count - k)..<count {
            last.append(self[i])
        }
        return last
    }
    
}

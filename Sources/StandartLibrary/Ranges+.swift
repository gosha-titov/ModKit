public extension Range {
    
    /// Returns a Boolean value indicating whether `self` is a subrange of other.
    ///
    ///     let range = 5..<8
    ///     range.isSubrange(of: 3..<9) // true
    ///     range.isSubrange(of: 6..<8) // false
    ///
    @inlinable @inline(__always)
    func isSubrange(of range: Range<Bound>) -> Bool {
        return range.lowerBound <= lowerBound && upperBound <= range.upperBound
    }
    
    /// Returns a Boolean value indicating whether `self` is a subrange of other.
    ///
    ///     let range = 5..<8
    ///     range.isSubrange(of: 3...) // true
    ///     range.isSubrange(of: 6...) // false
    ///
    @inlinable @inline(__always)
    func isSubrange(of range: PartialRangeFrom<Bound>) -> Bool {
        return range.lowerBound <= lowerBound
    }
    
}



public extension ClosedRange {
    
    /// Returns a Boolean value indicating whether `self` is a subrange of other.
    ///
    ///     let range = 5...8
    ///     range.isSubrange(of: 3..<9) // true
    ///     range.isSubrange(of: 6..<8) // false
    ///
    @inlinable @inline(__always)
    func isSubrange(of range: Range<Bound>) -> Bool {
        return range.lowerBound <= lowerBound && upperBound < range.upperBound
    }
    
    /// Returns a Boolean value indicating whether `self` is a subrange of other.
    ///
    ///     let range = 5...8
    ///     range.isSubrange(of: 3...9) // true
    ///     range.isSubrange(of: 6...8) // false
    ///
    @inlinable @inline(__always)
    func isSubrange(of range: ClosedRange<Bound>) -> Bool {
        return range.lowerBound <= lowerBound && upperBound <= range.upperBound
    }
    
    /// Returns a Boolean value indicating whether `self` is a subrange of other.
    ///
    ///     let range = 5...8
    ///     range.isSubrange(of: 3...) // true
    ///     range.isSubrange(of: 6...) // false
    ///
    @inlinable @inline(__always)
    func isSubrange(of range: PartialRangeFrom<Bound>) -> Bool {
        return range.lowerBound <= lowerBound
    }
    
    /// Returns a Boolean value indicating whether `self` is a subrange of other.
    ///
    ///     let range = 5...8
    ///     range.isSubrange(of: ...9) // true
    ///     range.isSubrange(of: ...7) // false
    ///
    @inlinable @inline(__always)
    func isSubrange(of range: PartialRangeThrough<Bound>) -> Bool {
        return upperBound <= range.upperBound
    }
    
}



public extension PartialRangeFrom {
    
    /// Returns a Boolean value indicating whether `self` is a subrange of other.
    ///
    ///     let range = 5...
    ///     range.isSubrange(of: 3...) // true
    ///     range.isSubrange(of: 6...) // false
    ///
    @inlinable @inline(__always)
    func isSubrange(of range: PartialRangeFrom<Bound>) -> Bool {
        return range.lowerBound <= lowerBound
    }
    
}



public extension PartialRangeThrough {
    
    /// Returns a Boolean value indicating whether `self` is a subrange of other.
    ///
    ///     let range = ...8
    ///     range.isSubrange(of: ...9) // true
    ///     range.isSubrange(of: ...7) // false
    ///
    @inlinable @inline(__always)
    func isSubrange(of range: PartialRangeThrough<Bound>) -> Bool {
        return upperBound <= range.upperBound
    }
    
}

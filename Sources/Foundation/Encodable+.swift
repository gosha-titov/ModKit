#if canImport(Foundation)

import Foundation

public extension Encodable {
    
    /// Returns a JSON-encoded representation of this value.
    ///
    ///     // Usage example:
    ///     let data = configuration
    ///         .adding(options)
    ///         .encoded(using: encoder)
    ///
    /// - Returns: A new `Data` value containing the encoded JSON data.
    /// - Throws: `EncodingError.invalidValue` if a non-conforming floating-point value is encountered during encoding, and the encoding strategy is `.throw`.
    /// - Throws: An error if any value throws an error during encoding.
    @inlinable @inline(__always)
    func encoded(using encoder: JSONEncoder) throws -> Data {
        return try encoder.encode(self)
    }
    
    /// Returns a property list that represents an encoded version of the value you supply.
    ///
    ///     // Usage example:
    ///     let data = configuration
    ///         .adding(options)
    ///         .encoded(using: encoder)
    ///
    /// - Returns: A new `Data` value containing the encoded JSON data.
    /// - Throws: `EncodingError.invalidValue` if a non-conforming floating-point value is encountered during encoding, and the encoding strategy is `.throw`.
    /// - Throws: An error if any value throws an error during encoding.
    @inlinable @inline(__always)
    func encoded(using encoder: PropertyListEncoder) throws -> Data {
        return try encoder.encode(self)
    }
    
}

#endif

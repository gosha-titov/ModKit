import Foundation

public extension Encodable {
    
    /// Returns a JSON-encoded representation of this value.
    ///
    ///     // Usage example:
    ///     userDefaults.standard.set(
    ///         try configuration.encoded(using: encoder),
    ///         forKey: Keys.configuration
    ///     )
    ///
    /// - Returns: A new `Data` value containing the encoded JSON data.
    /// - Throws: `EncodingError.invalidValue` if a non-conforming floating-point value is encountered during encoding, and the encoding strategy is `.throw`.
    /// - Throws: An error if any value throws an error during encoding.
    @inlinable func encoded(using encoder: JSONEncoder) throws -> Data {
        return try encoder.encode(self)
    }
    
}

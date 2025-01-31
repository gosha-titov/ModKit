#if canImport(Foundation)

import Foundation

public extension SingleValueDecodingContainer {
    
    /// Decodes a single value of the given type.
    ///
    ///     // This method with system-provided type
    ///     self.userName = try container.decode()
    ///
    ///     // Original method with manual-provided type
    ///     self.userName = try container.decode(String.self)
    ///
    /// - Returns: A value of the requested type.
    /// - Throws: `DecodingError.typeMismatch` if the encountered encoded value cannot be converted to the requested type.
    /// - Throws: `DecodingError.valueNotFound` if the encountered encoded value is null.
    @inlinable @inline(__always)
    func decode<T: Decodable>() throws -> T {
        return try decode(T.self)
    }
    
}


public extension KeyedDecodingContainer {
    
    /// Decodes a value of the given type for the given key.
    ///
    ///     // This method with system-provided type
    ///     self.firstName = try container.decode(forKey: .firstName)
    ///
    ///     // Original method with manual-provided type
    ///     self.firstName = try container.decode(String.self, forKey: .firstName)
    ///
    /// - Parameter key: The key that the decoded value is associated with.
    /// - Returns: A value of the requested type, if present for the given key and convertible to the requested type.
    /// - Throws: `DecodingError.typeMismatch` if the encountered encoded value is not convertible to the requested type.
    /// - Throws: `DecodingError.keyNotFound` if `self` does not have an entry for the given key.
    /// - Throws: `DecodingError.valueNotFound` if `self` has a null entry for the given key.
    @inlinable @inline(__always)
    func decode<T: Decodable>(forKey key: Key) throws -> T {
        return try decode(T.self, forKey: key)
    }
    
    /// Decodes a value of the given type for the given key, if present.
    ///
    ///     // This method with system-provided type
    ///     self.secondName = try container.decodeIfPresent(forKey: .secondName)
    ///
    ///     // Original method with manual-provided type
    ///     self.secondName = try container.decodeIfPresent(String.self, forKey: .secondName)
    ///
    /// This method returns `nil` if the container does not have a value associated with key, or if the value is null.
    /// The difference between these states can be distinguished with a `contains(_:)` call.
    /// - Parameter key: The key that the decoded value is associated with.
    /// - Returns: A decoded value of the requested type, or `nil` if the `Decoder` does not have an entry associated with the given key, or if the value is a null value.
    /// - Throws: `DecodingError.typeMismatch` if the encountered encoded value is not convertible to the requested type.
    @inlinable @inline(__always)
    func decodeIfPresent<T: Decodable>(forKey key: Key) throws -> T? {
        return try decodeIfPresent(T.self, forKey: key)
    }
    
}

#endif

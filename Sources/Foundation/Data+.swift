#if canImport(Foundation)

import Foundation

public extension Data {
    
    /// Returns a value of the type you specify, decoded from a JSON object.
    ///
    ///     // Usage example:
    ///     let configuration = try UserDefaults.standard
    ///         .data(forKey: Keys.configuration)?
    ///         .decoded(Configuration.self, using: decoder)
    ///
    /// - Parameter type: The type of the value to decode from the supplied JSON object.
    /// - Parameter decoder: The object to decode this data.
    /// - Returns: A value of the requested type.
    /// - Throws: `DecodingError.dataCorrupted` if values requested from the payload are corrupted, or if the given data is not valid JSON.
    /// - Throws: An error if any value throws an error during decoding.
    @inlinable @inline(__always)
    func decoded<T: Decodable>(_ type: T.Type, using decoder: JSONDecoder) throws -> T {
        return try decoder.decode(T.self, from: self)
    }
    
    /// Returns a value of the type you specify, decoded from a JSON object.
    ///
    ///     // Usage example:
    ///     self.configuration = try UserDefaults.standard
    ///         .data(forKey: Keys.configuration)?
    ///         .decoded(using: decoder)
    ///
    /// - Parameter decoder: The object to decode this data.
    /// - Returns: A value of the requested type.
    /// - Throws: `DecodingError.dataCorrupted` if values requested from the payload are corrupted, or if the given data is not valid JSON.
    /// - Throws: An error if any value throws an error during decoding.
    @inlinable @inline(__always)
    func decoded<T: Decodable>(using decoder: JSONDecoder) throws -> T {
        return try decoder.decode(T.self, from: self)
    }
    
    
    /// Returns a decoded top-level value of the given type from the given property list representation.
    ///
    ///     // Usage example:
    ///     let configuration = try file.read()
    ///         .decoded(Configuration.self, using: decoder)
    ///
    /// - Parameter type: The type of the value to decode.
    /// - Parameter decoder: The object to decode this data.
    /// - Returns: A value of the requested type.
    /// - Throws: `DecodingError.dataCorrupted` if values requested from the payload are corrupted, or if the given data is not a valid property list.
    /// - Throws: An error if any value throws an error during decoding.
    @inlinable @inline(__always)
    func decoded<T: Decodable>(_ type: T.Type, using decoder: PropertyListDecoder) throws -> T {
        return try decoder.decode(T.self, from: self)
    }
    
    /// Returns a decoded top-level value of the given type from the given property list representation.
    ///
    ///     // Usage example:
    ///     self.configuration = try file.read()
    ///         .decoded(using: decoder)
    ///
    /// - Parameter decoder: The object to decode this data.
    /// - Returns: A value of the requested type.
    /// - Throws: `DecodingError.dataCorrupted` if values requested from the payload are corrupted, or if the given data is not a valid property list.
    @inlinable @inline(__always)
    func decoded<T: Decodable>(using decoder: PropertyListDecoder) throws -> T {
        return try decoder.decode(T.self, from: self)
    }
    
}

#endif

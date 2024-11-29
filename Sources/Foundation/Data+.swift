import Foundation

public extension Data {
    
    /// Returns a value of the type you specify, decoded from a JSON object.
    ///
    ///     // Usage example:
    ///     let configuration = try UserDefaults.standard
    ///         .data(forKey: Keys.configuration)?
    ///         .decode(Configuration.self, using: decoder)
    ///
    /// - Parameter type: The type of the value to decode from the supplied JSON object.
    /// - Parameter decoder: The object to decode this data.
    /// - Returns: A value of the requested type.
    /// - Throws: `DecodingError.dataCorrupted` if values requested from the payload are corrupted, or if the given data is not valid JSON.
    /// - Throws: An error if any value throws an error during decoding.
    @inlinable func decode<T: Decodable>(_ type: T.Type, using decoder: JSONDecoder = .init()) throws -> T {
        return try decoder.decode(T.self, from: self)
    }
    
    /// Returns a value of the type you specify, decoded from a JSON object.
    ///
    ///     // Usage example:
    ///     self.configuration = try UserDefaults.standard
    ///         .data(forKey: Keys.configuration)?
    ///         .decode(using: decoder)
    ///
    /// - Parameter decoder: The object to decode this data.
    /// - Returns: A value of the requested type.
    /// - Throws: `DecodingError.dataCorrupted` if values requested from the payload are corrupted, or if the given data is not valid JSON.
    /// - Throws: An error if any value throws an error during decoding.
    @inlinable func decode<T: Decodable>(using decoder: JSONDecoder = .init()) throws -> T {
        return try decoder.decode(T.self, from: self)
    }
    
}

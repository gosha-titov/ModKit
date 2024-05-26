#if canImport(NaturalLanguage)

import NaturalLanguage

public extension String {
    
    /// A boolean value that indicates whether this string has left-to-right dominant language.
    ///
    ///     let text = "Hello"
    ///     print(text.hasLTRDominantLanguage)
    ///     // Prints true
    ///
    @inlinable var hasLTRDominantLanguage: Bool {
        return hasRTLDominantLanguage == false
    }
    
    /// A boolean value that indicates whether this string has right-to-left dominant language.
    ///
    ///     let text = "أهلاً"
    ///     print(text.hasRTLDominantLanguage)
    ///     // Prints true
    ///
    @inlinable var hasRTLDominantLanguage: Bool {
        return NLLanguageRecognizer.dominantLanguage(for: self)?.isRTL ?? false
    }
    
}

#endif

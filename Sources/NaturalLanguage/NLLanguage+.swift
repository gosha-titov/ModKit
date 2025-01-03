#if canImport(NaturalLanguage)

import NaturalLanguage

public extension NLLanguage {
    
    /// Returns the array of all default languages.
    /// - Important: This array does not contain the `.undetermined` language case.
    @inlinable static var allLanguages: [NLLanguage] {
        let kazakh = if #available(iOS 16.0, *) {
            NLLanguage.kazakh
        } else {
            NLLanguage("kk")
        }
        return [
            .amharic, .arabic, .armenian,
            .bengali, .bulgarian, .burmese,
            .catalan, .cherokee, .croatian, .czech,
            .danish, .dutch,
            .english,
            .finnish, .french,
            .georgian, .german, .greek, .gujarati,
            .hebrew, .hindi, .hungarian,
            .icelandic, .indonesian, .italian,
            .japanese,
            .kannada, kazakh, .khmer, .korean,
            .lao,
            .malay, .malayalam, .marathi, .mongolian,
            .norwegian,
            .oriya,
            .persian, .polish, .portuguese, .punjabi,
            .romanian, .russian,
            .simplifiedChinese, .sinhalese, .slovak, .spanish, .swedish,
            .tamil, .telugu, .thai, .tibetan, .traditionalChinese, .turkish,
            .ukrainian, .urdu,
            .vietnamese
        ]
    }
    
    /// Returns the array of all left-to-right default languages.
    @inlinable static var ltrLanguages: [NLLanguage] {
        return allLanguages.removing(rtlLanguages)
    }
    
    /// Returns the array of all right-to-left default languages.
    @inlinable static var rtlLanguages: [NLLanguage] {
        return [.arabic, .hebrew, .persian, .urdu]
    }
    
    /// The boolean value that indicates whether this language is left-to-right.
    ///
    ///     let language: NLLanguage = .english
    ///     print(language.isLTR)
    ///     // Prints true
    ///
    @inlinable var isLTR: Bool {
        return isRTL == false
    }
    
    /// The boolean value that indicates whether this language is right-to-left.
    ///
    ///     let language: NLLanguage = .arabic
    ///     print(language.isRTL)
    ///     // Prints true
    ///
    @inlinable var isRTL: Bool {
        return NLLanguage.rtlLanguages.contains(self)
    }
    
}

#endif

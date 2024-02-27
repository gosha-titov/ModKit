import Foundation

public extension Date {
    
    /// Returns a date instance that represents the date and time of almost tomorrow, at the moment of access.
    ///
    ///     Date.now           // "28 Feb 2024 at 9:02:27 AM"
    ///     Date.untilTomorrow // "28 Feb 2024 at 11:59:59 PM"
    ///
    ///     // Usage example:
    ///     storage.save(image, expirationDate: .untilTomorrow)
    ///
    static var untilTomorrow: Date {
        return Date().endOfDay
    }
    
    /// Returns a date instance that represents the yesterday relative to this date.
    ///
    ///     let now = Date.now // "28 Feb 2024 at 9:02:27 AM"
    ///     now.yesterday      // "27 Feb 2024 at 9:02:27 AM"
    ///
    var yesterday: Date {
        return Calendar.current.date(byAdding: .day, value: -1, to: self)!
    }
    
    /// Returns a date instance that represents the tomorrow relative to this date.
    ///
    ///     let now = Date.now // "28 Feb 2024 at 9:02:27 AM"
    ///     now.tomorrow       // "29 Feb 2024 at 9:02:27 AM"
    ///
    var tomorrow: Date {
        return Calendar.current.date(byAdding: .day, value: 1, to: self)!
    }
    
    /// Returns the first moment of this date.
    ///
    ///     let now = Date.now // "28 Feb 2024 at 9:02:27 AM"
    ///     now.startOfDay     // "28 Feb 2024 at 12:00:00 AM"
    ///
    var startOfDay: Date {
        return Calendar.current.startOfDay(for: self)
    }
    
    /// Returns the almost last moment of this date.
    ///
    ///     let now = Date.now // "28 Feb 2024 at 9:02:27 AM"
    ///     now.endOfDay       // "28 Feb 2024 at 11:59:59 PM"
    ///
    var endOfDay: Date {
        return tomorrow.startOfDay.addingTimeInterval(-1)
    }
    
}

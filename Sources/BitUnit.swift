import Foundation

/// Utility to convert and format units of information
public enum BitUnit: UInt64 {
    
    /// Bit unit representing one bit.
    case Bit  = 1
    /// A bit unit representing 1000 bits.
    case Kilobit = 1000
    /// A bit unit representing 1000 kilobits.
    case Megabit = 1000000
    /// A bit unit representing 1000 megabits.
    case Gigabit = 1000000000
    /// A bit unit representing 1000 gigabits.
    case Terabit = 1000000000000
    /// A bit unit representing 1000 terabits.
    case Petabit = 1000000000000000
    
    /// Bit unit representing one byte.
    case Byte  = 8
    /// A bit unit representing 1000 bytes.
    case Kilobyte = 8000
    /// A bit unit representing 1000 kilobytes.
    case Megabyte = 8000000
    /// A bit unit representing 1000 megabytes.
    case Gigabyte = 8000000000
    /// A bit unit representing 1000 gigabytes.
    case Terabyte = 8000000000000
    /// A bit unit representing 1000 terabytes.
    case Petabyte = 8000000000000000
    
    /// A bit unit representing 1024 bits.
    case Kibibit = 1024
    /// A bit unit representing 1024 kibibits.
    case Mebibit = 1048576
    /// A bit unit representing 1024 mebibits.
    case Gibibit = 1073741824
    /// A bit unit representing 1024 gibibits.
    case Tebibit = 1099511627776
    /// A bit unit representing 1024 tebibits.
    case Pebibit = 1125899906842624
    
    /// A bit unit representing 1024 bytes.
    case Kibibyte = 8192
    /// A bit unit representing 1024 kibibytes.
    case Mebibyte = 8388608
    /// A bit unit representing 1024 mebibytes.
    case Gibibyte = 8589934592
    /// A bit unit representing 1024 gibibytes.
    case Tebibyte = 8796093022208
    /// A bit unit representing 1024 tebibytes.
    case Pebibyte = 9007199254740992
    
    ///  - returns: the BitUnitType of the BitUnit
    public var type: BitUnitType {
        switch self {
        case .Bit, .Kilobit, .Megabit, .Gigabit, .Terabit, .Petabit:
            return .DecimalBitUnit
        case .Kibibit, .Mebibit, .Gibibit, .Tebibit, .Pebibit:
            return .BinaryBitUnit
        case .Byte, .Kilobyte, .Megabyte, .Gigabyte, .Terabyte, .Petabyte:
            return .DecimalByteUnit
        case .Kibibyte, .Mebibyte, .Gibibyte, .Tebibyte, .Pebibyte:
            return .BinaryByteUnit
        }
    }
    
    
    
    /// Converts between the different BitUnits
    ///
    /// - parameter amount: The amount of the sourceUnit to be formatted.
    /// - parameter from: The unit of the amount.
    /// - parameter to: The unit you want to convert the amount to.
    /// - returns: The converted amount.
    public static func convert(amount: UInt64, from: BitUnit, to: BitUnit) -> UInt64 {
        if from.rawValue < to.rawValue {
            return amount / (to.rawValue / from.rawValue)
        }
        else if from.rawValue > to.rawValue {
            return amount * (from.rawValue / to.rawValue)
        } else {
            return amount
        }
    }
    
    /// Converts between the different BitUnits
    ///
    /// - parameter amount: The amount of the sourceUnit to be formatted.
    /// - parameter from: The unit of the amount.
    /// - parameter to: The unit you want to convert the amount to.
    /// - returns: An optional of the converted amount, only nil if amount < 0.
    public static func convert(amount: Int, from: BitUnit, to: BitUnit) -> UInt64? {
        guard amount >= 0 else {
            return nil
        }
        return convert(UInt64(amount), from: from, to: to)
    }
    
    /// Converts between the different BitUnits
    ///
    /// - parameter amount: The amount of the sourceUnit to be formatted.
    /// - parameter from: The unit of the amount.
    /// - parameter to: The unit you want to convert the amount to.
    /// - returns: The converted amount.
    public static func convert(amount: UInt, from: BitUnit, to: BitUnit) -> UInt64 {
        return convert(UInt64(amount), from: from, to: to)
    }
    
}

//MARK: - Formatting

extension BitUnit {
    
    ///  - returns: the abbreviation of the BitUnit
    public var abbreviation: String {
        switch (self) {
        case Bit:     return "b"
        case Kilobit: return "kb"
        case Megabit: return "Mb"
        case Gigabit: return "Gb"
        case Terabit: return "Tb"
        case Petabit: return "Pb"
            
        case Byte:     return "B"
        case Kilobyte: return "kB"
        case Megabyte: return "MB"
        case Gigabyte: return "GB"
        case Terabyte: return "TB"
        case Petabyte: return "PB"
            
        case Kibibit: return "Kib"
        case Mebibit: return "Mib"
        case Gibibit: return "Gib"
        case Tebibit: return "Tib"
        case Pebibit: return "Pib"
            
        case Kibibyte: return "KiB"
        case Mebibyte: return "MiB"
        case Gibibyte: return "GiB"
        case Tebibyte: return "TiB"
        case Pebibyte: return "PiB"
        }
    }
    
    /// Converts the input to human readable output.
    ///
    /// - parameter amount: The amount of the sourceUnit to be formatted.
    /// - parameter sourceUnit: The sourceUnit of the input.
    /// - parameter targetUnitType: The targetUnitType, i.e. whether you want Mb, Mib, MB or MiB, default is Mb.
    /// - parameter formatter: Pass a custom NSNumberFormatter for additional formatting, default is 0-2 fraction digits.
    /// - returns: The formatted String
    public static func format(amount: UInt64, sourceUnit: BitUnit = .Bit, targetUnitType: BitUnitType = .DecimalBitUnit, formatter: NSNumberFormatter = defaultFormatter) -> String {
        let gcUnit = greatestCommonUnit(sourceUnit, targetUnitType)
        let unitArray = targetUnitType.units
        var unitIndex = unitArray.indexOf(gcUnit)!
        
        var remainder = Double(convert(amount, from: sourceUnit, to: gcUnit))
        
        while remainder >= targetUnitType.stepSize && unitIndex < unitArray.count - 1 {
            remainder /= targetUnitType.stepSize
            unitIndex += 1
        }
        
        return "\(formatter.stringFromNumber(NSNumber(double: remainder))!) \(unitArray[unitIndex].abbreviation)"
    }
    
    /// Converts the input to human readable output.
    ///
    /// - parameter amount: The amount of the sourceUnit to be formatted.
    /// - parameter sourceUnit: The sourceUnit of the input.
    /// - parameter targetUnitType: The targetUnitType, i.e. whether you want Mb, Mib, MB or MiB, default is Mb.
    /// - parameter formatter: Pass a custom NSNumberFormatter for additional formatting, default is 0-2 fraction digits.
    /// - returns: The formatted String
    public static func format(amount: Int, sourceUnit: BitUnit = .Bit, targetUnitType: BitUnitType = .DecimalBitUnit, formatter: NSNumberFormatter = defaultFormatter) -> String? {
        guard amount >= 0 else {
            return nil
        }
        return format(UInt64(amount), sourceUnit: sourceUnit, targetUnitType: targetUnitType, formatter: formatter)
    }
    
    /// Converts the input to human readable output.
    ///
    /// - parameter amount: The amount of the sourceUnit to be formatted.
    /// - parameter sourceUnit: The sourceUnit of the input.
    /// - parameter targetUnitType: The targetUnitType, i.e. whether you want Mb, Mib, MB or MiB, default is Mb.
    /// - parameter formatter: Pass a custom NSNumberFormatter for additional formatting, default is 0-2 fraction digits.
    /// - returns: The formatted String
    public static func format(amount: UInt, sourceUnit: BitUnit = .Bit, targetUnitType: BitUnitType = .DecimalBitUnit, formatter: NSNumberFormatter = defaultFormatter) -> String {
        return format(UInt64(amount), sourceUnit: sourceUnit, targetUnitType: targetUnitType, formatter: formatter)
    }
    
    /// :nodoc:
    private static func greatestCommonUnit(sourceUnit: BitUnit, _ targetUnitType: BitUnitType) -> BitUnit {
        if sourceUnit.type == targetUnitType {
            return sourceUnit
        } else {
            if targetUnitType == .BinaryByteUnit || targetUnitType == .DecimalByteUnit {
                return .Byte
            } else {
                return .Bit
            }
        }
    }
    
    /// :nodoc:
    private static var defaultFormatter: NSNumberFormatter {
        let formatter = NSNumberFormatter()
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 2
        return formatter
    }

}

import Foundation

enum BitUnit: UInt {
    case Bit  = 1
    case Kilobit = 1000
    case Megabit = 1000000
    case Gigabit = 1000000000
    case Terabit = 1000000000000
    case Petabit = 1000000000000000
    
    case Byte  = 8
    case Kilobyte = 8000
    case Megabyte = 8000000
    case Gigabyte = 8000000000
    case Terabyte = 8000000000000
    case Petabyte = 8000000000000000
    
    case Kibibit = 1024
    case Mebibit = 1048576
    case Gibibit = 1073741824
    case Tebibit = 1099511627776
    case Pebibit = 1125899906842624
    
    case Kibibyte = 8192
    case Mebibyte = 8388608
    case Gibibyte = 8589934592
    case Tebibyte = 8796093022208
    case Pebibyte = 9007199254740992
    
    var type: BitUnitType {
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
    
    private static var defaultFormatter: NSNumberFormatter {
        let formatter = NSNumberFormatter()
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 2
        return formatter
    }
    
    static func convert(count: UInt, from: BitUnit, to: BitUnit) -> UInt {
        if from.rawValue < to.rawValue {
            return count / (to.rawValue / from.rawValue)
        }
        else if from.rawValue > to.rawValue {
            return count * (from.rawValue / to.rawValue)
        } else {
            return count
        }
    }
    
    //TODO Think about returning an optional here
    static func convert(count: Int, from: BitUnit, to: BitUnit) -> UInt? {
        guard count >= 0 else {
            return nil
        }
        return convert(UInt(count), from: from, to: to)
    }
    
}

//MARK: - Formatting

extension BitUnit {
    
    var abbreviation: String {
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
    
    static func format(count: UInt, sourceUnit: BitUnit = .Bit, targetUnitType: BitUnitType = .DecimalBitUnit, formatter: NSNumberFormatter = defaultFormatter) -> String {
        let gcUnit = greatestCommonUnit(sourceUnit, targetUnitType)
        var unitArray = targetUnitType.units
        let unitIndex = unitArray.indexOf(gcUnit)!

        //remove all the units we don't need
        unitArray.removeFirst(unitIndex)
        
        var remainder = Double(convert(count, from: sourceUnit, to: gcUnit))
        var generator = unitArray.generate()
        var unit = generator.next()
        while unit != nil && remainder >= targetUnitType.stepSize {
            remainder /= targetUnitType.stepSize
            unit = generator.next()
        }
        
        return "\(formatter.stringFromNumber(remainder)!) \(unit!.abbreviation)"
    }
    
    static func format(count: Int, sourceUnit: BitUnit = .Bit, targetUnitType: BitUnitType = .DecimalBitUnit, formatter: NSNumberFormatter = defaultFormatter) -> String? {
        guard count >= 0 else {
            return nil
        }
        return format(UInt(count), sourceUnit: sourceUnit, targetUnitType: targetUnitType, formatter: formatter)
    }
    
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

}


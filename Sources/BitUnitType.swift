enum BitUnitType {
    case DecimalBitUnit, DecimalByteUnit
    case BinaryBitUnit, BinaryByteUnit
    
    var stepSize: Double {
        switch self {
        case .DecimalBitUnit, .DecimalByteUnit:
            return 1000
        case .BinaryBitUnit, .BinaryByteUnit:
            return 1024
        }
    }
    
    var units: [BitUnit] {
        switch self {
        case .DecimalBitUnit:
            return [.Bit,  .Kilobit,  .Megabit,  .Gigabit,  .Terabit,  .Petabit]
        case .BinaryBitUnit:
            return [.Bit,  .Kibibit,  .Mebibit,  .Gibibit,  .Tebibit,  .Pebibit]
        case .DecimalByteUnit:
            return [.Byte, .Kilobyte, .Megabyte, .Gigabyte, .Terabyte, .Petabyte]
        case .BinaryByteUnit:
            return [.Byte, .Kibibyte, .Mebibyte, .Gibibyte, .Tebibyte, .Pebibyte]
        }
    }
}

enum BitUnit: UInt {
    //TODO: Try to do this with 1024^x etc
    case Bit  = 1
    case kbit = 1000
    case Mbit = 1000000
    case Gbit = 1000000000
    case Tbit = 1000000000000
    case Pbit = 1000000000000000

    case Byte  = 8
    case kByte = 8000
    case MByte = 8000000
    case GByte = 8000000000
    case TByte = 8000000000000
    case PByte = 8000000000000000

    case KiBit = 1024
    case MiBit = 1048576
    case GiBit = 1073741824
    case TiBit = 1099511627776
    case PiBit = 1125899906842624

    case KiByte = 8192
    case MiByte = 8388608
    case GiByte = 8589934592
    case TiByte = 8796093022208
    case PiByte = 9007199254740992

    static func convert(count: UInt, from: BitUnit, to: BitUnit) -> UInt {
      if (from.rawValue < to.rawValue) {
        return count / (to.rawValue / from.rawValue)
      }
      else if (from.rawValue > to.rawValue) {
        return count * (from.rawValue / to.rawValue)
      } else {
        return count
      }
    }

    static func convert(count: Int, from: BitUnit, to: BitUnit) -> UInt {
      assert(count >= 0, "No negative numbers permitted.")
      return convert(UInt(count), from: from, to: to)
    }

}

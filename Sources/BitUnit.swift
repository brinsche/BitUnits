enum BitUnit: UInt {
    //TODO: Try to do this with 1024^x etc
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

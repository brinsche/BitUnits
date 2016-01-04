import XCTest
@testable import ByteUnits

class Tests: XCTestCase, XCTestCaseProvider {
  var allTests : [(String, () -> Void)] {
        return [
            ("testRawValues", testRawValues),
            ("testBitConversions", testBitConversions),
            ("testBinaryConversions", testBinaryConversions)
            // Other tests go here
        ]
    }

  func testRawValues() {
    XCTAssertEqual(1, BitUnit.Bit.rawValue)
    XCTAssertEqual(BitUnit.Bit.rawValue * 1000, BitUnit.Kilobit.rawValue)
    XCTAssertEqual(BitUnit.Kilobit.rawValue * 1000, BitUnit.Megabit.rawValue)
    XCTAssertEqual(BitUnit.Megabit.rawValue * 1000, BitUnit.Gigabit.rawValue)
    XCTAssertEqual(BitUnit.Gigabit.rawValue * 1000, BitUnit.Terabit.rawValue)
    XCTAssertEqual(BitUnit.Terabit.rawValue * 1000, BitUnit.Petabit.rawValue)

    XCTAssertEqual(BitUnit.Bit.rawValue * 8, BitUnit.Byte.rawValue)
    XCTAssertEqual(BitUnit.Byte.rawValue * 1000, BitUnit.Kilobyte.rawValue)
    XCTAssertEqual(BitUnit.Kilobyte.rawValue * 1000, BitUnit.Megabyte.rawValue)
    XCTAssertEqual(BitUnit.Megabyte.rawValue * 1000, BitUnit.Gigabyte.rawValue)
    XCTAssertEqual(BitUnit.Gigabyte.rawValue * 1000, BitUnit.Terabyte.rawValue)
    XCTAssertEqual(BitUnit.Terabyte.rawValue * 1000, BitUnit.Petabyte.rawValue)

    XCTAssertEqual(BitUnit.Bit.rawValue * 1024, BitUnit.Kibibit.rawValue)
    XCTAssertEqual(BitUnit.Kibibit.rawValue * 1024, BitUnit.Mebibit.rawValue)
    XCTAssertEqual(BitUnit.Mebibit.rawValue * 1024, BitUnit.Gibibit.rawValue)
    XCTAssertEqual(BitUnit.Gibibit.rawValue * 1024, BitUnit.Tebibit.rawValue)
    XCTAssertEqual(BitUnit.Tebibit.rawValue * 1024, BitUnit.Pebibit.rawValue)

    XCTAssertEqual(BitUnit.Byte.rawValue * 1024, BitUnit.Kibibyte.rawValue)
    XCTAssertEqual(BitUnit.Kibibyte.rawValue * 1024, BitUnit.Mebibyte.rawValue)
    XCTAssertEqual(BitUnit.Mebibyte.rawValue * 1024, BitUnit.Gibibyte.rawValue)
    XCTAssertEqual(BitUnit.Gibibyte.rawValue * 1024, BitUnit.Tebibyte.rawValue)
    XCTAssertEqual(BitUnit.Tebibyte.rawValue * 1024, BitUnit.Pebibyte.rawValue)
  }

  func testBitConversions() {
    for i: UInt in 0...999 {
      XCTAssertEqual(i / 8, BitUnit.convert(i, from: .Bit, to: .Byte))
      XCTAssertEqual(i / 1000, BitUnit.convert(i, from: .Bit, to: .Kilobit))
      XCTAssertEqual(i / 1000000, BitUnit.convert(i, from: .Bit, to: .Megabit))
      XCTAssertEqual(i / 1000000000, BitUnit.convert(i, from: .Bit, to: .Gigabit))
      XCTAssertEqual(i / 1000000000000, BitUnit.convert(i, from: .Bit, to: .Terabit))
      XCTAssertEqual(i / 1000000000000000, BitUnit.convert(i, from: .Bit, to: .Petabit))

      XCTAssertEqual(i * 125, BitUnit.convert(i, from: .Kilobit, to: .Byte))
      XCTAssertEqual(i * 1000, BitUnit.convert(i, from: .Kilobit, to: .Bit))
      XCTAssertEqual(i / 1000, BitUnit.convert(i, from: .Kilobit, to: .Megabit))
      XCTAssertEqual(i / 1000000, BitUnit.convert(i, from: .Kilobit, to: .Gigabit))
      XCTAssertEqual(i / 1000000000, BitUnit.convert(i, from: .Kilobit, to: .Terabit))
      XCTAssertEqual(i / 1000000000000, BitUnit.convert(i, from: .Kilobit, to: .Petabit))

      XCTAssertEqual(i * 125000, BitUnit.convert(i, from: .Megabit, to: .Byte))
      XCTAssertEqual(i * 1000000, BitUnit.convert(i, from: .Megabit, to: .Bit))
      XCTAssertEqual(i * 1000, BitUnit.convert(i, from: .Megabit, to: .Kilobit))
      XCTAssertEqual(i / 1000, BitUnit.convert(i, from: .Megabit, to: .Gigabit))
      XCTAssertEqual(i / 1000000, BitUnit.convert(i, from: .Megabit, to: .Terabit))
      XCTAssertEqual(i / 1000000000, BitUnit.convert(i, from: .Megabit, to: .Petabit))

      XCTAssertEqual(i * 125000000, BitUnit.convert(i, from: .Gigabit, to: .Byte))
      XCTAssertEqual(i * 1000000000, BitUnit.convert(i, from: .Gigabit, to: .Bit))
      XCTAssertEqual(i * 1000000, BitUnit.convert(i, from: .Gigabit, to: .Kilobit))
      XCTAssertEqual(i * 1000, BitUnit.convert(i, from: .Gigabit, to: .Megabit))
      XCTAssertEqual(i / 1000, BitUnit.convert(i, from: .Gigabit, to: .Terabit))
      XCTAssertEqual(i / 1000000, BitUnit.convert(i, from: .Gigabit, to: .Petabit))

      XCTAssertEqual(i * 125000000000, BitUnit.convert(i, from: .Terabit, to: .Byte))
      XCTAssertEqual(i * 1000000000000, BitUnit.convert(i, from: .Terabit, to: .Bit))
      XCTAssertEqual(i * 1000000000, BitUnit.convert(i, from: .Terabit, to: .Kilobit))
      XCTAssertEqual(i * 1000000, BitUnit.convert(i, from: .Terabit, to: .Megabit))
      XCTAssertEqual(i * 1000, BitUnit.convert(i, from: .Terabit, to: .Gigabit))
      XCTAssertEqual(i / 1000, BitUnit.convert(i, from: .Terabit, to: .Petabit))

      XCTAssertEqual(i * 125000000000000, BitUnit.convert(i, from: .Petabit, to: .Byte))
      XCTAssertEqual(i * 1000000000000000, BitUnit.convert(i, from: .Petabit, to: .Bit))
      XCTAssertEqual(i * 1000000000000, BitUnit.convert(i, from: .Petabit, to: .Kilobit))
      XCTAssertEqual(i * 1000000000, BitUnit.convert(i, from: .Petabit, to: .Megabit))
      XCTAssertEqual(i * 1000000, BitUnit.convert(i, from: .Petabit, to: .Gigabit))
      XCTAssertEqual(i * 1000, BitUnit.convert(i, from: .Petabit, to: .Terabit))
    }
  }

  func testBinaryConversions() {
    for i: UInt in 0...999 {
      XCTAssertEqual(i / 1024, BitUnit.convert(i, from: .Byte, to: .Kibibyte))
      XCTAssertEqual(i / 1048576, BitUnit.convert(i, from: .Byte, to: .Mebibyte))
      XCTAssertEqual(i / 1073741824, BitUnit.convert(i, from: .Byte, to: .Gibibyte))
      XCTAssertEqual(i / 1099511627776, BitUnit.convert(i, from: .Byte, to: .Tebibyte))
      XCTAssertEqual(i / 1125899906842624, BitUnit.convert(i, from: .Byte, to: .Pebibyte))

      XCTAssertEqual(i * 1024, BitUnit.convert(i, from: .Kibibyte, to: .Byte))
      XCTAssertEqual(i / 1024, BitUnit.convert(i, from: .Kibibyte, to: .Mebibyte))
      XCTAssertEqual(i / 1048576, BitUnit.convert(i, from: .Kibibyte, to: .Gibibyte))
      XCTAssertEqual(i / 1073741824, BitUnit.convert(i, from: .Kibibyte, to: .Tebibyte))
      XCTAssertEqual(i / 1099511627776, BitUnit.convert(i, from: .Kibibyte, to: .Pebibyte))

      XCTAssertEqual(i * 1048576, BitUnit.convert(i, from: .Mebibyte, to: .Byte))
      XCTAssertEqual(i * 1024, BitUnit.convert(i, from: .Mebibyte, to: .Kibibyte))
      XCTAssertEqual(i / 1024, BitUnit.convert(i, from: .Mebibyte, to: .Gibibyte))
      XCTAssertEqual(i / 1048576, BitUnit.convert(i, from: .Mebibyte, to: .Tebibyte))
      XCTAssertEqual(i / 1073741824, BitUnit.convert(i, from: .Mebibyte, to: .Pebibyte))

      XCTAssertEqual(i * 1073741824, BitUnit.convert(i, from: .Gibibyte, to: .Byte))
      XCTAssertEqual(i * 1048576, BitUnit.convert(i, from: .Gibibyte, to: .Kibibyte))
      XCTAssertEqual(i * 1024, BitUnit.convert(i, from: .Gibibyte, to: .Mebibyte))
      XCTAssertEqual(i / 1024, BitUnit.convert(i, from: .Gibibyte, to: .Tebibyte))
      XCTAssertEqual(i / 1048576, BitUnit.convert(i, from: .Gibibyte, to: .Pebibyte))

      XCTAssertEqual(i * 1099511627776, BitUnit.convert(i, from: .Tebibyte, to: .Byte))
      XCTAssertEqual(i * 1073741824, BitUnit.convert(i, from: .Tebibyte, to: .Kibibyte))
      XCTAssertEqual(i * 1048576, BitUnit.convert(i, from: .Tebibyte, to: .Mebibyte))
      XCTAssertEqual(i * 1024, BitUnit.convert(i, from: .Tebibyte, to: .Gibibyte))
      XCTAssertEqual(i / 1024, BitUnit.convert(i, from: .Tebibyte, to: .Pebibyte))

      XCTAssertEqual(i * 1125899906842624, BitUnit.convert(i, from: .Pebibyte, to: .Byte))
      XCTAssertEqual(i * 1099511627776, BitUnit.convert(i, from: .Pebibyte, to: .Kibibyte))
      XCTAssertEqual(i * 1073741824, BitUnit.convert(i, from: .Pebibyte, to: .Mebibyte))
      XCTAssertEqual(i * 1048576, BitUnit.convert(i, from: .Pebibyte, to: .Gibibyte))
      XCTAssertEqual(i * 1024, BitUnit.convert(i, from: .Pebibyte, to: .Tebibyte))
    }
  }

}

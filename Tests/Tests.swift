import XCTest
@testable import ByteUnits

class Tests: XCTestCase {

  func testRawValues() {
    XCTAssertEqual(1, BitUnit.Bit.rawValue)
    XCTAssertEqual(BitUnit.Bit.rawValue * 1000, BitUnit.kbit.rawValue)
    XCTAssertEqual(BitUnit.kbit.rawValue * 1000, BitUnit.Mbit.rawValue)
    XCTAssertEqual(BitUnit.Mbit.rawValue * 1000, BitUnit.Gbit.rawValue)
    XCTAssertEqual(BitUnit.Gbit.rawValue * 1000, BitUnit.Tbit.rawValue)
    XCTAssertEqual(BitUnit.Tbit.rawValue * 1000, BitUnit.Pbit.rawValue)

    XCTAssertEqual(BitUnit.Bit.rawValue * 8, BitUnit.Byte.rawValue)
    XCTAssertEqual(BitUnit.Byte.rawValue * 1000, BitUnit.kByte.rawValue)
    XCTAssertEqual(BitUnit.kByte.rawValue * 1000, BitUnit.MByte.rawValue)
    XCTAssertEqual(BitUnit.MByte.rawValue * 1000, BitUnit.GByte.rawValue)
    XCTAssertEqual(BitUnit.GByte.rawValue * 1000, BitUnit.TByte.rawValue)
    XCTAssertEqual(BitUnit.TByte.rawValue * 1000, BitUnit.PByte.rawValue)

    XCTAssertEqual(BitUnit.Bit.rawValue * 1024, BitUnit.KiBit.rawValue)
    XCTAssertEqual(BitUnit.KiBit.rawValue * 1024, BitUnit.MiBit.rawValue)
    XCTAssertEqual(BitUnit.MiBit.rawValue * 1024, BitUnit.GiBit.rawValue)
    XCTAssertEqual(BitUnit.GiBit.rawValue * 1024, BitUnit.TiBit.rawValue)
    XCTAssertEqual(BitUnit.TiBit.rawValue * 1024, BitUnit.PiBit.rawValue)

    XCTAssertEqual(BitUnit.Byte.rawValue * 1024, BitUnit.KiByte.rawValue)
    XCTAssertEqual(BitUnit.KiByte.rawValue * 1024, BitUnit.MiByte.rawValue)
    XCTAssertEqual(BitUnit.MiByte.rawValue * 1024, BitUnit.GiByte.rawValue)
    XCTAssertEqual(BitUnit.GiByte.rawValue * 1024, BitUnit.TiByte.rawValue)
    XCTAssertEqual(BitUnit.TiByte.rawValue * 1024, BitUnit.PiByte.rawValue)
  }

  func testBitConversions() {
    for i: UInt in 0...999 {
      XCTAssertEqual(i / 8, BitUnit.convert(i, from: .Bit, to: .Byte))
      XCTAssertEqual(i / 1000, BitUnit.convert(i, from: .Bit, to: .kbit))
      XCTAssertEqual(i / 1000000, BitUnit.convert(i, from: .Bit, to: .Mbit))
      XCTAssertEqual(i / 1000000000, BitUnit.convert(i, from: .Bit, to: .Gbit))
      XCTAssertEqual(i / 1000000000000, BitUnit.convert(i, from: .Bit, to: .Tbit))
      XCTAssertEqual(i / 1000000000000000, BitUnit.convert(i, from: .Bit, to: .Pbit))

      XCTAssertEqual(i * 125, BitUnit.convert(i, from: .kbit, to: .Byte))
      XCTAssertEqual(i * 1000, BitUnit.convert(i, from: .kbit, to: .Bit))
      XCTAssertEqual(i / 1000, BitUnit.convert(i, from: .kbit, to: .Mbit))
      XCTAssertEqual(i / 1000000, BitUnit.convert(i, from: .kbit, to: .Gbit))
      XCTAssertEqual(i / 1000000000, BitUnit.convert(i, from: .kbit, to: .Tbit))
      XCTAssertEqual(i / 1000000000000, BitUnit.convert(i, from: .kbit, to: .Pbit))

      XCTAssertEqual(i * 125000, BitUnit.convert(i, from: .Mbit, to: .Byte))
      XCTAssertEqual(i * 1000000, BitUnit.convert(i, from: .Mbit, to: .Bit))
      XCTAssertEqual(i * 1000, BitUnit.convert(i, from: .Mbit, to: .kbit))
      XCTAssertEqual(i / 1000, BitUnit.convert(i, from: .Mbit, to: .Gbit))
      XCTAssertEqual(i / 1000000, BitUnit.convert(i, from: .Mbit, to: .Tbit))
      XCTAssertEqual(i / 1000000000, BitUnit.convert(i, from: .Mbit, to: .Pbit))

      XCTAssertEqual(i * 125000000, BitUnit.convert(i, from: .Gbit, to: .Byte))
      XCTAssertEqual(i * 1000000000, BitUnit.convert(i, from: .Gbit, to: .Bit))
      XCTAssertEqual(i * 1000000, BitUnit.convert(i, from: .Gbit, to: .kbit))
      XCTAssertEqual(i * 1000, BitUnit.convert(i, from: .Gbit, to: .Mbit))
      XCTAssertEqual(i / 1000, BitUnit.convert(i, from: .Gbit, to: .Tbit))
      XCTAssertEqual(i / 1000000, BitUnit.convert(i, from: .Gbit, to: .Pbit))

      XCTAssertEqual(i * 125000000000, BitUnit.convert(i, from: .Tbit, to: .Byte))
      XCTAssertEqual(i * 1000000000000, BitUnit.convert(i, from: .Tbit, to: .Bit))
      XCTAssertEqual(i * 1000000000, BitUnit.convert(i, from: .Tbit, to: .kbit))
      XCTAssertEqual(i * 1000000, BitUnit.convert(i, from: .Tbit, to: .Mbit))
      XCTAssertEqual(i * 1000, BitUnit.convert(i, from: .Tbit, to: .Gbit))
      XCTAssertEqual(i / 1000, BitUnit.convert(i, from: .Tbit, to: .Pbit))

      XCTAssertEqual(i * 125000000000000, BitUnit.convert(i, from: .Pbit, to: .Byte))
      XCTAssertEqual(i * 1000000000000000, BitUnit.convert(i, from: .Pbit, to: .Bit))
      XCTAssertEqual(i * 1000000000000, BitUnit.convert(i, from: .Pbit, to: .kbit))
      XCTAssertEqual(i * 1000000000, BitUnit.convert(i, from: .Pbit, to: .Mbit))
      XCTAssertEqual(i * 1000000, BitUnit.convert(i, from: .Pbit, to: .Gbit))
      XCTAssertEqual(i * 1000, BitUnit.convert(i, from: .Pbit, to: .Tbit))
    }
  }

  func testBinaryConversions() {
    for i: UInt in 0...999 {
      XCTAssertEqual(i / 1024, BitUnit.convert(i, from: .Byte, to: .KiByte))
      XCTAssertEqual(i / 1048576, BitUnit.convert(i, from: .Byte, to: .MiByte))
      XCTAssertEqual(i / 1073741824, BitUnit.convert(i, from: .Byte, to: .GiByte))
      XCTAssertEqual(i / 1099511627776, BitUnit.convert(i, from: .Byte, to: .TiByte))
      XCTAssertEqual(i / 1125899906842624, BitUnit.convert(i, from: .Byte, to: .PiByte))

      XCTAssertEqual(i * 1024, BitUnit.convert(i, from: .KiByte, to: .Byte))
      XCTAssertEqual(i / 1024, BitUnit.convert(i, from: .KiByte, to: .MiByte))
      XCTAssertEqual(i / 1048576, BitUnit.convert(i, from: .KiByte, to: .GiByte))
      XCTAssertEqual(i / 1073741824, BitUnit.convert(i, from: .KiByte, to: .TiByte))
      XCTAssertEqual(i / 1099511627776, BitUnit.convert(i, from: .KiByte, to: .PiByte))

      XCTAssertEqual(i * 1048576, BitUnit.convert(i, from: .MiByte, to: .Byte))
      XCTAssertEqual(i * 1024, BitUnit.convert(i, from: .MiByte, to: .KiByte))
      XCTAssertEqual(i / 1024, BitUnit.convert(i, from: .MiByte, to: .GiByte))
      XCTAssertEqual(i / 1048576, BitUnit.convert(i, from: .MiByte, to: .TiByte))
      XCTAssertEqual(i / 1073741824, BitUnit.convert(i, from: .MiByte, to: .PiByte))

      XCTAssertEqual(i * 1073741824, BitUnit.convert(i, from: .GiByte, to: .Byte))
      XCTAssertEqual(i * 1048576, BitUnit.convert(i, from: .GiByte, to: .KiByte))
      XCTAssertEqual(i * 1024, BitUnit.convert(i, from: .GiByte, to: .MiByte))
      XCTAssertEqual(i / 1024, BitUnit.convert(i, from: .GiByte, to: .TiByte))
      XCTAssertEqual(i / 1048576, BitUnit.convert(i, from: .GiByte, to: .PiByte))

      XCTAssertEqual(i * 1099511627776, BitUnit.convert(i, from: .TiByte, to: .Byte))
      XCTAssertEqual(i * 1073741824, BitUnit.convert(i, from: .TiByte, to: .KiByte))
      XCTAssertEqual(i * 1048576, BitUnit.convert(i, from: .TiByte, to: .MiByte))
      XCTAssertEqual(i * 1024, BitUnit.convert(i, from: .TiByte, to: .GiByte))
      XCTAssertEqual(i / 1024, BitUnit.convert(i, from: .TiByte, to: .PiByte))

      XCTAssertEqual(i * 1125899906842624, BitUnit.convert(i, from: .PiByte, to: .Byte))
      XCTAssertEqual(i * 1099511627776, BitUnit.convert(i, from: .PiByte, to: .KiByte))
      XCTAssertEqual(i * 1073741824, BitUnit.convert(i, from: .PiByte, to: .MiByte))
      XCTAssertEqual(i * 1048576, BitUnit.convert(i, from: .PiByte, to: .GiByte))
      XCTAssertEqual(i * 1024, BitUnit.convert(i, from: .PiByte, to: .TiByte))
    }
  }

}

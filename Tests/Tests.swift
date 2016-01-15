import XCTest
@testable import BitUnits

class Tests: XCTestCase, XCTestCaseProvider {
    var allTests : [(String, () -> Void)] {
        return [
            ("testRawValues", testRawValues),
            ("testBitConversions", testBitConversions),
            ("testBinaryConversions", testBinaryConversions),
            ("testStringFormatting", testStringFormatting),
            ("testAbbreviations", testAbbreviations)
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
        for i: UInt64 in 0...999 {
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
        
        XCTAssertNil(BitUnit.convert(-1, from: .Petabit, to: .Terabit))
    }
    
    func testBinaryConversions() {
        for i: UInt64 in 0...999 {
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
        XCTAssertNil(BitUnit.convert(-1, from: .Pebibyte, to: .Tebibyte))
    }
    
    func testStringFormatting() {
        //TODO test all units
        let formatter = NSNumberFormatter()
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 1
        formatter.locale = NSLocale(localeIdentifier: "en_US")
        
        XCTAssertEqual("0 b", BitUnit.format(0, formatter: formatter))
        XCTAssertEqual("1 b", BitUnit.format(1, formatter: formatter))
        XCTAssertEqual("1 kb", BitUnit.format(1000, formatter: formatter))
        XCTAssertEqual("1 kb", BitUnit.format(1001, formatter: formatter))
        XCTAssertEqual("16 kb", BitUnit.format(16_000, formatter: formatter))
        XCTAssertEqual("1.2 Mb", BitUnit.format(1_177_171, formatter: formatter))
        XCTAssertEqual("1.2 Gb", BitUnit.format(1_200_000_000, formatter: formatter))
        XCTAssertEqual("18446.7 Pb", BitUnit.format(UInt64.max, formatter: formatter))
        XCTAssertEqual("3 Mb", BitUnit.format(3000, sourceUnit: .Kilobit, formatter: formatter))
        
        XCTAssertEqual("0 b", BitUnit.format(0, targetUnitType: .BinaryBitUnit, formatter: formatter))
        XCTAssertEqual("1 b", BitUnit.format(1, targetUnitType: .BinaryBitUnit, formatter: formatter))
        XCTAssertEqual("1 Kib", BitUnit.format(1024, targetUnitType: .BinaryBitUnit, formatter: formatter))
        XCTAssertEqual("1 Kib", BitUnit.format(1025, targetUnitType: .BinaryBitUnit, formatter: formatter))
        XCTAssertEqual("16 Kib", BitUnit.format(16_384, targetUnitType: .BinaryBitUnit, formatter: formatter))
        XCTAssertEqual("1.2 Mib", BitUnit.format(1_258_290, targetUnitType: .BinaryBitUnit, formatter: formatter))
        XCTAssertEqual("1.2 Gib", BitUnit.format(1_288_488_960, targetUnitType: .BinaryBitUnit, formatter: formatter))
        XCTAssertEqual("16384 Pib", BitUnit.format(UInt64.max, targetUnitType: .BinaryBitUnit, formatter: formatter))
        XCTAssertEqual("3 Mib", BitUnit.format(3072, sourceUnit: .Kibibit, targetUnitType: .BinaryBitUnit, formatter: formatter))
        
        XCTAssertEqual("0 B", BitUnit.format(0, targetUnitType: .DecimalByteUnit, formatter: formatter))
        XCTAssertEqual("0 B", BitUnit.format(7, targetUnitType: .DecimalByteUnit, formatter: formatter))
        XCTAssertEqual("1 B", BitUnit.format(8, targetUnitType: .DecimalByteUnit, formatter: formatter))
        XCTAssertEqual("1 kB", BitUnit.format(8000, targetUnitType: .DecimalByteUnit, formatter: formatter))
        XCTAssertEqual("1 kB", BitUnit.format(8007, targetUnitType: .DecimalByteUnit, formatter: formatter))
        XCTAssertEqual("16 kB", BitUnit.format(128_000, targetUnitType: .DecimalByteUnit, formatter: formatter))
        XCTAssertEqual("1.2 MB", BitUnit.format(9_417_368, targetUnitType: .DecimalByteUnit, formatter: formatter))
        XCTAssertEqual("1.2 GB", BitUnit.format(9_600_000_000, targetUnitType: .DecimalByteUnit, formatter: formatter))
        XCTAssertEqual("2305.8 PB", BitUnit.format(UInt64.max, targetUnitType: .DecimalByteUnit, formatter: formatter))
        XCTAssertEqual("3 MB", BitUnit.format(24_000, sourceUnit: .Kilobit, targetUnitType: .DecimalByteUnit, formatter: formatter))
        
        XCTAssertEqual("0 B", BitUnit.format(0, targetUnitType: .BinaryByteUnit, formatter: formatter))
        XCTAssertEqual("0 B", BitUnit.format(7, targetUnitType: .BinaryByteUnit, formatter: formatter))
        XCTAssertEqual("1 B", BitUnit.format(8, targetUnitType: .BinaryByteUnit, formatter: formatter))
        XCTAssertEqual("1 KiB", BitUnit.format(8192, targetUnitType: .BinaryByteUnit, formatter: formatter))
        XCTAssertEqual("1 KiB", BitUnit.format(8199, targetUnitType: .BinaryByteUnit, formatter: formatter))
        XCTAssertEqual("16 KiB", BitUnit.format(131_072, targetUnitType: .BinaryByteUnit, formatter: formatter))
        XCTAssertEqual("1.2 MiB", BitUnit.format(10_066_320, targetUnitType: .BinaryByteUnit, formatter: formatter))
        XCTAssertEqual("1.2 GiB", BitUnit.format(10_307_911_680, targetUnitType: .BinaryByteUnit, formatter: formatter))
        XCTAssertEqual("2048 PiB", BitUnit.format(UInt64.max, targetUnitType: .BinaryByteUnit, formatter: formatter))
        XCTAssertEqual("3 MiB", BitUnit.format(24_576, sourceUnit: .Kibibit, targetUnitType: .BinaryByteUnit, formatter: formatter))
        
        XCTAssertEqual("2.9 Mib", BitUnit.format(3, sourceUnit: .Megabit, targetUnitType: .BinaryBitUnit, formatter: formatter))
        
        XCTAssertNil(BitUnit.format(-1, sourceUnit: .Megabit, targetUnitType: .BinaryBitUnit, formatter: formatter))
    }
    
    func testAbbreviations() {
        XCTAssertEqual("b", BitUnit.Bit.abbreviation)
        XCTAssertEqual("kb", BitUnit.Kilobit.abbreviation)
        XCTAssertEqual("Mb", BitUnit.Megabit.abbreviation)
        XCTAssertEqual("Gb", BitUnit.Gigabit.abbreviation)
        XCTAssertEqual("Tb", BitUnit.Terabit.abbreviation)
        XCTAssertEqual("Pb", BitUnit.Petabit.abbreviation)
        
        XCTAssertEqual("B", BitUnit.Byte.abbreviation)
        XCTAssertEqual("kB", BitUnit.Kilobyte.abbreviation)
        XCTAssertEqual("MB", BitUnit.Megabyte.abbreviation)
        XCTAssertEqual("GB", BitUnit.Gigabyte.abbreviation)
        XCTAssertEqual("TB", BitUnit.Terabyte.abbreviation)
        XCTAssertEqual("PB", BitUnit.Petabyte.abbreviation)
        
        XCTAssertEqual("Kib", BitUnit.Kibibit.abbreviation)
        XCTAssertEqual("Mib", BitUnit.Mebibit.abbreviation)
        XCTAssertEqual("Gib", BitUnit.Gibibit.abbreviation)
        XCTAssertEqual("Tib", BitUnit.Tebibit.abbreviation)
        XCTAssertEqual("Pib", BitUnit.Pebibit.abbreviation)
        
        XCTAssertEqual("KiB", BitUnit.Kibibyte.abbreviation)
        XCTAssertEqual("MiB", BitUnit.Mebibyte.abbreviation)
        XCTAssertEqual("GiB", BitUnit.Gibibyte.abbreviation)
        XCTAssertEqual("TiB", BitUnit.Tebibyte.abbreviation)
        XCTAssertEqual("PiB", BitUnit.Pebibyte.abbreviation)
    }
    
}

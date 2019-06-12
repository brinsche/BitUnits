# BitUnits [![Build Status](https://travis-ci.org/brinsche/BitUnits.svg?branch=master)](https://travis-ci.org/brinsche/BitUnits)
Utility library to convert and format SI and IEC bit and byte units.

## Samples
#### Converting
````swift
//Ints return an optional, because we only support values >= 0.
//In case you can guarantee this, it’s safe to force unwrap the return value

let value = UInt(4)
let x = BitUnit.convert(value, from: .Megabit, to: .Kilobit)
print(x)
=> 4000
````
#### Formatting
````swift
let x = BitUnit.format(1_177_171)!
print(x)
=> "1.2 Mb"
````
````swift
let x = BitUnit.format(UInt64.max, targetUnitType: .BinaryByteUnit)
print(x)
=> "2048 PiB"
````


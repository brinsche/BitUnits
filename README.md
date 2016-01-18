# BitUnits
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

# License
The MIT License (MIT)

Copyright (c) 2016 Bastian Rinsche & Tobias Landsberg

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.



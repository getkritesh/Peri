# Math

### Description <a href="description" id="description"></a>

This is a library contract that provides math functions on fractional numbers, performing arithmetic with unsigned [fixed-point decimals](https://en.wikipedia.org/wiki/Fixed-point\_arithmetic).

Math uses OpenZeppelin's SafeMath library and SafeDecimalMath library for most of its basic arithmetic operations in order to protect from arithmetic overflows and zero divisions.

**Source:** contracts/Math.sol

### Internal Functions <a href="internal-functions" id="internal-functions"></a>

#### `powDecimal` <a href="powdecimal" id="powdecimal"></a>

Source

Returns the exponentiation of the base (x) integer by the n^th power to precision of 18 decimals. Function calculates the result using exponentiation by squaring, handling preciison loss by truncation and removes the order of magnitude introduced with integer arithmetics each time the base is squared.

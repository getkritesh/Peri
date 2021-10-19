# SafeDecimalMath

### Description

This is a library contract that provides the ability to manipulate fractional numbers, performing safe arithmetic with unsigned [fixed-point decimals](https://en.wikipedia.org/wiki/Fixed-point\_arithmetic).

The decimals this library provides can operate at either of two different precision levels. Standard precision operations act on numbers with 18 decimal places. High precision numbers possess 27 decimal places, and have their own corresponding set of functions.

Several functions are included for converting between precision levels, and operations which round to the nearest increment to remove truncation bias. In SafeDecimalMath, a half-increment rounds up.

SafeDecimalMath uses OpenZeppelin's SafeMath library for most of its basic arithmetic operations in order to protect from arithmetic overflows and zero divisions.

In PeriFinance, the standard precision fixed point numbers are used to deal with most fractional quantities, such as token balances and prices. The high-precision numbers are mainly used for dealing with the debt ledger, which is constructed as an extended product of many fractional numbers very close to 11. As this is a financially-sensitive component of the system, representational precision matters in order to minimise errors resulting from rounding or truncation.

**Fixed-Point Mechanics**

For a precision of dd deimal places, this fixed point library chooses a large integer ˙u=10du˙=10d to represent the number 11 (e.g. `UNIT` = 10181018) and all operations at this precision level happen relative to ˙uu˙. That is, the fixed point representation of a number qq is defined to be the integer ˙qq˙:˙q := q ˙u = q×10dq˙ := q u˙ = q×10d

For example, at 27 decimal places, ˙2525˙ is equivalent to 25×102725×1027. We will use square brackets to capture the fixed point representation of composite expressions.

Note that this is only valid if ˙qq˙ is an integer, so nothing is representable which has a positive value in the decimal places smaller than 1˙u1u˙ (i.e. the integer 1).

We define the fixed point operations ˙++˙, ˙−−˙, ˙××˙, ˙//˙, corresponding to the ordinary arithmetic operations ++, −−, ××, //, where // corresponds to integer division. These are implemented by `SafeMath` and protect from overflow.

**Additive Operations**

We define our additive fixed point operators to be the same as the standard ones:

Definition: Fixed Point Addition and Subtractionx ˙+ y := x+yx ˙− y := x−yx +˙ y := x+yx −˙ y := x−y

This is because:˙p±˙q := p˙u±q˙u = (p±q)˙u =: ˙\[p±q]p˙±q˙ := pu˙±qu˙ = (p±q)u˙ =: \[p±q]˙

**Multiplicative Operations**

The multiplicative operations are defined as follows:

Definition: Fixed Point Multiplication and Divisionx ˙× y := (x×y) / ˙ux ˙/ y := (x×˙u) / yx ×˙ y := (x×y) / u˙x /˙ y := (x×u˙) / y

Some care has to be taken for multiplication and division. We desire, for example, ˙p ˙× ˙q=˙\[p×q]p˙ ×˙ q˙=\[p×q]˙. However, if the standard operations are performed naively, the following results are obtained:˙p×˙q := p˙u×q˙u = (p×q)˙u2 =: ˙\[(p±q)˙u]˙p / ˙q := p˙u / q˙u = p / qp˙×q˙ := pu˙×qu˙ = (p×q)u˙2 =: \[(p±q)u˙]˙p˙ / q˙ := pu˙ / qu˙ = p / q

So multiplication produces an extra unwanted unit factor, and division divides one out; the fixed point operations need to account for this. Note that to ensure minimum precision loss, ˙uu˙ is divided out last in the case of multiplication and multiplied in first in the case of division.

**Rounding**

Note that multiplication and division of fixed point numbers may involve some loss of precision in the lowest digit. Such inaccuracy can accumulate over many operations

PeriFinance provides versions of ˙××˙ and ˙//˙ which perform the operation with one extra internal digit of precision, and then rounds up if the least significant digit is 5 or greater. Consequently, results exactly halfway between two increments are rounded up.

**Change of Precision**

The representation of a number qq at two different fixed point precision levels ˙q=q˙uq˙=qu˙ and ¨q=q¨uq¨=qu¨ is straightforward if ˙uu˙ and ¨uu¨ divide evenly. If this is the case, and ¨uu¨ is the higher precision unit, then ¨q/˙q=¨u/˙uq¨/q˙=u¨/u˙. So converting between the high and low precision only involves multiplying or dividing by a factor of ¨u/˙uu¨/u˙. Keep in mind that converting from a high precision to a low precision number involves some loss of information, and this operation is performed with rounding.

**Source:** contracts/SafeDecimalMath.sol

### Variables <a href="variables" id="variables"></a>

#### `PRECISE_UNIT` <a href="precise_unit" id="precise_unit"></a>

Source

The high precision number (10271027) that represents 1.01.0.

**Value:** `1e27`

**Type:** `uint256`

#### `UNIT` <a href="unit" id="unit"></a>

Source

The standard precision number (10181018) that represents 1.01.0.

**Value:** `1e18`

**Type:** `uint256`

#### `decimals` <a href="decimals" id="decimals"></a>

Source

The number of decimals (1818) in the standard precision fixed point representation.

**Value:** `18`

**Type:** `uint8`

#### `highPrecisionDecimals` <a href="highprecisiondecimals" id="highprecisiondecimals"></a>

Source

The number of decimals (2727) in the high precision fixed point representation.

**Value:** `27`

**Type:** `uint8`

### Views <a href="views" id="views"></a>

#### `preciseUnit` <a href="preciseunit" id="preciseunit"></a>

Source

Pure alias to `PRECISE_UNIT`.Details

#### `unit` <a href="unit_1" id="unit_1"></a>

Source

Pure alias to `UNIT`.Details

### Internal Functions <a href="internal-functions" id="internal-functions"></a>

#### `decimalToPreciseDecimal` <a href="decimaltoprecisedecimal" id="decimaltoprecisedecimal"></a>

Source

Converts from standard precision to high precision numbers. This is just multiplication by 109109.Details

#### `divideDecimal` <a href="dividedecimal" id="dividedecimal"></a>

Source

Returns the quotient of two standard precision fixed point numbers, handling precision loss by truncation.Details

#### `divideDecimalRound` <a href="dividedecimalround" id="dividedecimalround"></a>

Source

Returns the quotient of two standard precision fixed point numbers, handling precision loss by rounding.

Equivalent to `_divideDecimalRound(x, y, UNIT)`.Details

#### `divideDecimalRoundPrecise` <a href="dividedecimalroundprecise" id="dividedecimalroundprecise"></a>

Source

Returns the quotient of two high precision fixed point numbers, handling precision loss by rounding.

Equivalent to `_divideDecimalRound(x, y, PRECISE_UNIT)`.Details

#### `floorsub` <a href="floorsub" id="floorsub"></a>

SourceDetails

#### `multiplyDecimal` <a href="multiplydecimal" id="multiplydecimal"></a>

Source

Returns the product of two standard precision fixed point numbers, handling precision loss by truncation.Details

#### `multiplyDecimalRound` <a href="multiplydecimalround" id="multiplydecimalround"></a>

Source

Returns the product of two standard precision fixed point numbers, handling precision loss by rounding.

Equivalent to `_multiplyDecimalRound(x, y, UNIT)`.Details

#### `multiplyDecimalRoundPrecise` <a href="multiplydecimalroundprecise" id="multiplydecimalroundprecise"></a>

Source

Returns the product of two high precision fixed point numbers, handling precision loss by rounding.

Equivalent to `_multiplyDecimalRound(x, y, PRECISE_UNIT)`.Details

#### `preciseDecimalToDecimal` <a href="precisedecimaltodecimal" id="precisedecimaltodecimal"></a>

Source

Converts from high precision to standard precision numbers. This is division by 109109, where precision loss is handled by rounding.Details

1. SafeDecimalMath provides two different precision levels because the Ethereum virtual machine encodes integers in 256 bits. Given a finite integer size, an increase in precision implies a decrease in the maximum representable number, since more bits are dedicated to representing the fractional part, and fewer to the integer part. [↩](https://docs.synthetix.io/contracts/source/libraries/SafeDecimalMath/#fnref:1)

# DATA TYPES

## STRING TYPES
### CHAR -> Has a fixed length.
- This is more **faster** for fixed text size.
### VARCHAR -> Has a variable length.
- Always use this.

## INTEGER TYPES
- TINYINT (1 byte) -> MAX VALUE 127
- SMALLINT (2 bytes) -> MAX VALUE 32767
- MEDIUMINT (3 bytes) -> MAX VALUE 8388607
- INT (4 bytes) -> MAX VALUE 2147483647
- BIGINT (8 bytes) -> MAX VALUE 2^63 -1

### UNSIGNED -> No negative numbers
- This allows us to use **twice** as much space,
because there are no negative numbers.

## DECIMAL
- DECIMAL(5,2) => 5 max digits in total and 2 digits after decimal. e.g: 999.99 or 0.1

### FLOAT (4 bytes)
- Precision issues ~ 7 digits

### DOUBLE (8 bytes)
- Precision issues ~ 15 digits

## DATES
- Date format: YYYY-MM-DD
- Time Format: hh:mm:ss
- Functions: CURTIME(), CURDATE(), NOW()

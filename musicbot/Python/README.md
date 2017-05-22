# Python Solution for 451 - Sort Characters By Frequency

## Approach

Just find an efficient way to determine character frequency and then rebuild
the string.

## Explanation

Convert the string into a counter, iterate the the counter sorted using
`most_common()`, and then rebuild the string.

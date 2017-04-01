# beeb6502test

This takes Klaus Dormann's 6502 test and Bruce Clark's 6502 BCD test and makes a bootable SSD for the BBC Micro.

https://github.com/Klaus2m5/6502_65C02_functional_tests

The basic BCD test uses valid BCD numbers and ignores the N, V and Z flags.  The full BCD test covers everything.  There are two versions of each, one for 6502 and one for 65C02.

build.bat creates the SSD file.

You need Frank Kingswood's 6502 assembler to build the tests
http://www.kingswood-consulting.co.uk/assemblers/index.html

and Rich Talbot-Watkins's 6502 assembler to build the test harness and the SSD.
http://www.retrosoftware.co.uk/wiki/index.php?title=BeebAsm

Licensed under the GNU General Public License version 3

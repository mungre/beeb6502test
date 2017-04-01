# beeb6502test

This takes Klaus Dormann's 6502 test and Bruce Clark's 6502 BCD test and makes a bootable SSD for the BBC Micro.

https://github.com/Klaus2m5/6502_65C02_functional_tests

The basic BCD test uses valid BCD numbers and ignores the N, V and Z flags.  The full BCD test covers everything.  There are two versions of each, one for 6502 and one for 65C02.

build.bat creates the SSD file.

You need Frank Kingswood's 6502 assembler to build the tests  
http://www.kingswood-consulting.co.uk/assemblers/index.html

and Rich Talbot-Watkins's 6502 assembler to build the test harness and the SSD.  
http://www.retrosoftware.co.uk/wiki/index.php?title=BeebAsm

This skips the IRQ-handling test because that requires write access to the IRQ vector at &fffe.  This could be arranged in the emulator, but a problem in this area would already be obvious.  The memory integrity test is also skipped because the OS remains enabled during testing.  Again, an existing problem here would already be obvious.

The Rockwell and WDC bit manipulation instructions are not tested because the Master's 65SC02 does not have them.

Licensed under the GNU General Public License version 3

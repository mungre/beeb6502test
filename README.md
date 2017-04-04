# beeb6502test

This takes Klaus Dormann's 6502 test with a couple of additions and Bruce Clark's 6502 BCD test and makes a bootable SSD for the BBC Micro.

https://github.com/Klaus2m5/6502_65C02_functional_tests

The basic BCD test uses valid BCD numbers and ignores the N, V and Z flags.  The full BCD test covers everything.  There are two versions of each, one for 6502 and one for 65C02/65SC02.

The 65C02 test covers the Rockwell and WDC bit manipulation instructions.  The 65SC02 test skips them.

build.bat creates the SSD file.

You need Frank Kingswood's 6502 assembler to build the tests  
http://www.kingswood-consulting.co.uk/assemblers/index.html

and Rich Talbot-Watkins's 6502 assembler to build the test harness and the SSD.  
http://www.retrosoftware.co.uk/wiki/index.php?title=BeebAsm

The CPU is detected using the 6502's indirect JMP bug and the absence of SMB on the 65SC02.  The result is used to initialise the menu.  The second processor is detected using OSBYTE 234; the affects nothing but the message displayed on the screen.  If a (6502 compatible) second-processor is active then the test will run there.

The IRQ-handling test is skipped because it requires write access to the IRQ vector at &fffe.  This could be arranged in the emulator, but a problem in this area would already be obvious.  The memory integrity test is also skipped because the OS remains enabled during testing.  Again, an existing problem here would already be obvious.

Licensed under the GNU General Public License version 3

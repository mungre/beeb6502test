@echo off

pushd 6502_65C02_functional_tests\bcd_b
as65 -l -w -o..\bcd_b.bin -l..\bcd_b.lst ..\6502_decimal_test.a65
if errorlevel 1 goto pop_fail
popd

pushd 6502_65C02_functional_tests\bcd_f
as65 -l -w -o..\bcd_f.bin -l..\bcd_f.lst ..\6502_decimal_test.a65
if errorlevel 1 goto pop_fail
popd

pushd 6502_65C02_functional_tests\bcd_bc
as65 -l -w -o..\bcd_bc.bin -l..\bcd_bc.lst ..\6502_decimal_test.a65
if errorlevel 1 goto pop_fail
popd

pushd 6502_65C02_functional_tests\bcd_fc
as65 -l -w -o..\bcd_fc.bin -l..\bcd_fc.lst ..\6502_decimal_test.a65
if errorlevel 1 goto pop_fail
popd

pushd 6502_65C02_functional_tests
as65 -l -w 6502_functional_test.a65
if errorlevel 1 goto pop_fail
popd

pushd 6502_65C02_functional_tests\65SC02
as65 -l -w -x -o..\65SC02.bin -l..\65SC02.lst ..\65C02_extended_opcodes_test.a65c
if errorlevel 1 goto pop_fail
popd

pushd 6502_65C02_functional_tests\65C02
as65 -l -w -x -o..\65C02.bin -l..\65C02.lst ..\65C02_extended_opcodes_test.a65c
if errorlevel 1 goto pop_fail
popd

beebasm -do 6502test.ssd -opt 3 -i menu\6502test.asm
if errorlevel 1 goto :eof

rem start /separate \Progs\beebem-windows\Src\Release\beebem 6502test.ssd

goto :eof

:pop_fail
popd

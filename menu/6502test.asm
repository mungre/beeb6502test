
fptr=&80
tptr=&82

test_base=&1900
run_test=&1B00

osasci=&FFE3
oswrch=&FFEE

MACRO TEST_WRAPPER n
{
    CLEAR &1900,&7C00

    ORG &1900

    .everything

    .functional_test
    IF n=0
        INCBIN "6502_65C02_functional_tests\6502_functional_test.bin"
    ELSE
        INCBIN "6502_65C02_functional_tests\65C02_extended_opcodes_test.bin"
    ENDIF
    ALIGN &100
    .functional_test_end

    .start
    {
        LDA #<functional_test
        STA fptr
        LDA #>functional_test
        STA fptr+1
        LDA #0
        STA tptr
        STA tptr+1

        LDY #fptr-1 ; Only copy as far as fptr on page zero
    .loopa
        LDA (fptr),Y
        STA (tptr),Y
        DEY
        BNE loopa

        LDA fptr+1
        CLC
        ADC #>test_base
        STA fptr+1
        LDA #>test_base
        STA tptr+1
        LDX #>(functional_test_end-functional_test)->test_base
    .loop
        LDA (fptr),Y
        STA (tptr),Y
        DEY
        BNE loop
        INC fptr+1
        INC tptr+1
        DEX
        BNE loop
        JMP run_test
    }

    ALIGN &100

    .everything_end

    IF n=0
        SAVE "+.TEST1", everything, everything_end, start
    ELSE
        SAVE "+.TEST2", everything, everything_end, start
    ENDIF
}
ENDMACRO

PUTFILE "menu\boot.txt","$.!BOOT",0
PUTBASIC "menu\menu.bas","$.MENU"

PUTFILE "6502_65C02_functional_tests\bcd_b.bin","+.BCD_B",&6800
PUTFILE "6502_65C02_functional_tests\bcd_f.bin","+.BCD_F",&6800
PUTFILE "6502_65C02_functional_tests\bcd_bc.bin","+.BCD_BC",&6800
PUTFILE "6502_65C02_functional_tests\bcd_fc.bin","+.BCD_FC",&6800

TEST_WRAPPER 0
TEST_WRAPPER 1

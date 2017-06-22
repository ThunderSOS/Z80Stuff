InterruptSetup          di                              ;
                        ld hl, InterruptService         ;
                        ld ix, #fff0                    ;
                        ld (ix+#04), #c3                ; plonk opcode for jp InterruptService at location 65535 - 13
                        ld (ix+#05), l                  ;
                        ld (ix+#06), h                  ;
                        ld (ix+#0f), #18                ; plonk opcode for jr at 65535, next byte at #0000 is f3 (-13)
                        ld a, #39                       ; interrupt vector table at #3900 (in a secion of ROM containing all 255's)
                        ld i, a                         ; hence cpu executes a jp to 65535 which executes the jr -13
                        im 2                            ; and so we land at the jp InterruptService instruction
                        ei                              ;
InterruptStart          call GameStart                  ;
                        nop
                        jr InterruptStart +3              ;

InterruptService        push af, bc, de, hl, ix, iy     ;
                        call GameLoop                   ;
                        pop iy, ix, hl, de, bc, af      ;
                        ei                              ;
                        reti                            ;





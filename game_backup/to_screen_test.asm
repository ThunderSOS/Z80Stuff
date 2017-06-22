; This is a basic template file for writing 48K Spectrum code.

AppFilename             equ "SprteTst"                  ; What we're called (for file generation)

AppFirst                equ $8000                       ; First byte of code (uncontended memory)

                        zeusemulate "48K","ULA+"        ; Set the model and enable ULA+

PlayerLeftKey           equ "Q"                         ;

                        ; Start planting code here. (When generating a tape file we start saving from here)

                        org AppFirst                    ; Start of application
                        include "C:\zeus\screen.asm"    ;
                        include "C:\zeus\sprite_metadata.asm" ;
                        include "C:\zeus\sprites.asm"   ;
                        include "C:\zeus\sprite_logic.asm" ;
                        include "C:\zeus\interrupts.asm";

AppEntry                jp InterruptSetup               ;

GameStart               di                              ;
                        xor a                           ;
                        out (254), a                    ;
                        ld a, 6                         ;
                        call Clear_attrs                ;
                        ei                              ;
                        ret                             ;

GameLoop                ld ix, Sprite_data              ;
                        call Clear_sprite               ;
                        call Calc_sprite_base           ; hl contains address of sprite data
                        call Draw_sprite                ;

                        ld ix, Sprite_data1             ;
                        call Clear_sprite               ;
                        call Calc_sprite_base           ;
                        call Draw_sprite                ;

                        ld ix, Sprite_data2             ;
                        call Clear_sprite               ;
                        call Calc_sprite_base           ;
                        call Draw_sprite                ;

                        ld ix, Sprite_data3             ;
                        call Clear_sprite               ;
                        call Calc_sprite_base           ;
                        call Draw_sprite                ;

                        ld bc,zeuskeyaddr(PlayerLeftKey); Get the IO address to input
                        in a,(c)                        ; Read those 5 keys
                        and zeuskeymask(PlayerLeftKey)  ; And with the bit for PlayerLeftKey
                        jr z, AppExit                   ; If it's zero the key is pressed

                        ld hl, Sprites                  ;
                        ld b, 4                         ;

Sprite_Logic_Loop       ld e, (hl)                      ;
                        inc hl                          ;
                        ld d, (hl)                      ;
                        inc hl                          ;
                        ld ix, de                       ;
                        push hl                         ;
                        ld hl, GameLoop_end             ;
                        push hl                         ; push return address onto stack
                        ld hl, (ix+10)                  ;
                        jp (hl)
                        ;
GameLoop_end            pop hl                          ;
                        ld a, (hl)                      ;
                        and a                           ;
                        djnz Sprite_Logic_Loop          ;
                        ret                             ;

AppExit                 jp 0                            ;


                        ; Stop planting code after this. (When generating a tape file we save bytes below here)
AppLast                 equ *-1                         ; The last used byte's address

                        ; Generate some useful debugging commands

                        profile AppFirst, AppLast-AppFirst+1 ; Enable profiling for all the code


                        ; Setup the emulation registers, so Zeus can emulate this code correctly

Zeus_PC                 equ AppEntry                    ; Tell the emulator where to start
Zeus_SP                 equ $FF40                       ; Tell the emulator where to put the stack

                        ; These generate some output files

                        ; Generate a SZX file
                        output_szx AppFilename+".szx",$0000,AppEntry ; The szx file

                        ; If we want a fancy loader we need to load a loading screen
                        ; import_bin AppFilename+".scr",$4000            ; Load a loading screen

                        ; Now, also generate a tzx file using the loader
                        output_tzx AppFilename+".tzx",AppFilename,"",AppFirst,AppLast-AppFirst,1,AppEntry ; A tzx file using the loader



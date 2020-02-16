; This is a basic template file for writing 48K Spectrum code.

AppFilename             equ "centipede"                 ; What we're called (for file generation)

AppFirst                equ $8000                       ; First byte of code (uncontended memory)

                        zeusemulate "48K","ULA+"        ; Set the model and enable ULA+
                        zeusmem segments, "Segments", 7, true, false;
                        zeusmem 22528, "Screen", 32, true, false;

; Start planting code here. (When generating a tape file we start saving from here)

                        org AppFirst                    ; Start of application

AppEntry                ld sp, $FFF0
                        ;call attr_at_bc_test
                        ;call font_char_test
                        ;call score_test
                        ;call test_mush_generation;
                        jp init_game
                        ;call font_print_test  ;
                        ;ret                             ;

                        include "gameloop.asm"
                        include "mushrooms.asm"
                        include "seg_handler.asm"       ;
                        include "util.asm"              ;
                        include "screen.asm"            ;
                        ; include "player.asm"           ;
                        include "noises.asm"            ;
                        include "sprite.asm"            ;
                        include "sprite_metadata.asm"   ;
                        include "font.asm"              ;
                        include "score.asm"             ;

pl_x                    defb 0                          ; player's x coordinate.
pl_y                    defb 0                          ; player's y coordinate.

bl_x                    defb 0                          ; bullet x coordinate.
bl_y                    defb 0                          ; bullet y coordinate.

; graphics
blocks                  defb 16,16,56,56,124,124,254,254 ; player base.

                        defb 0,102,102,102,102,102,102,0 ; player bullet.

; Stop planting code after this. (When generating a tape file we save bytes below here)
AppLast                 equ *-1                         ; The last used byte's address

; Generate some useful debugging commands

                        profile AppFirst,AppLast-AppFirst+1 ; Enable profiling for all the code

; Setup the emulation registers, so Zeus can emulate this code correctly

Zeus_PC                 equ AppEntry                    ; Tell the emulator where to start
Zeus_SP                 equ $FF40                       ; Tell the emulator where to put the stack

; These generate some output files

                        ; Generate a SZX file
                        output_szx AppFilename+".szx",$0000,AppEntry ; The szx file

                        output_bin AppFilename+".bin", AppFirst, AppLast-AppFirst+1;

                        output_tap AppFilename+".tap", AppFilename, "", AppFirst, AppLast-AppFirst+1, 0, AppEntry;

                        ; If we want a fancy loader we need to load a loading screen
;                        import_bin AppFilename+".scr",$4000            ; Load a loading screen

                        ; Now, also generate a tzx file using the loader
                        output_tzx AppFilename+".tzx",AppFilename,"",AppFirst,AppLast-AppFirst,0,AppEntry ; A tzx file using the loader



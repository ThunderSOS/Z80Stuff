; This is a basic template file for writing 48K Spectrum code.

AppFilename             equ "SprteTst"                  ; What we're called (for file generation)

AppFirst                equ $8000                       ; First byte of code (uncontended memory)

                        zeusemulate "48K","ULA+"        ; Set the model and enable ULA+

                        ; Start planting code here. (When generating a tape file we start saving from here)

                        org AppFirst                    ; Start of application
                        include "./screen.asm"          ;
                        include "./sprite_metadata.asm" ;
                        include "./sprites.asm"         ;
                        include "./sprite_logic.asm"    ;
                        include "./interrupts.asm"      ;
                        include "./score.asm"           ;
                        include "./room.asm"            ;

zeusmem                 Health, "Player", 20, false, false ;

AppEntry                jp InterruptSetup               ;

GameStart               di                              ;
                        xor a                           ;
                        out (254), a                    ;
                        ld a, 6                         ;
                        call Clear_attrs                ;
                        call Draw_room                  ;
                        ei                              ;
                        ret                             ;

FrameCount              defb 0                          ;
Current_sprite_set      defw 0                          ;


Init_sprite_loop        ld e, (hl)                      ;
                        inc hl                          ;
                        ld d, (hl)                      ;
                        inc hl                          ;
                        ld a, e                         ;
                        or d                            ;
                        ret z                           ;
                        ld ix, de                       ;
                        call Calc_sprite_base           ;
                        ld (ix+dCurrentSprite), hl      ;
                        jr Init_sprite_loop             ;

GameLoop                ld a, (FrameCount)              ;
                        inc a                           ;
                        ld (FrameCount), a              ;
                        and 1                           ;
                        ; ld hl, 24576                    ;
                        ; jp z, Copy_Screen               ;
                        ld hl, Sprites                  ;
                        jr z, Draw_start                ;
                        ld hl, Sprites_2                ;

Draw_start              ld (Current_sprite_set), hl     ;
                        ld a, 1                         ;
                        out(254), a                     ;

Draw_loop               ld e, (hl)                      ;
                        inc hl                          ;
                        ld d, (hl)                      ;
                        inc hl                          ;
                        ld a, e                         ;
                        or d                            ;
                        jr z, Draw_loop_end             ;
                        ld ix, de                       ;
                        bit 6, (ix+dFlags)              ; check deactivated
                        jr nz, Draw_loop                ;
                        exx                             ;
                        call Clear_sprite               ;
                        call Calc_sprite_base           ;
                        call Draw_sprite                ;
                        call Draw_attrs                 ;
                        exx                             ;
                        jr Draw_loop                    ;

Draw_loop_end           ld a, 6                         ;
                        out(254), a                     ;
                        ld hl, Health_handler           ;
                        ld (Collision_handler), hl      ;
                        ld hl, (Current_sprite_set)     ; reset to start for collision checks

Sprite_logic_loop       ld e, (hl)                      ;
                        inc hl                          ;
                        ld d, (hl)                      ;
                        inc hl                          ;
                        ld a, d                         ;
                        or e                            ;
                        jr z, Logic_loop_end            ; 0 terminated list
                        cp 1                            ;
                        jr z, Sprite_logic_loop         ;
                        push hl                         ; push current list position
                        push de
                        ld iy, Player_sprite            ;
                        call Check_collision            ;
                        pop de
                        ld ix, de                       ;
                        ld hl, GameLoop_end             ;
                        push hl                         ; push return address (from logic handler) onto stack
                        ld hl, (ix+dSpriteLogic)        ;
                        jp (hl)                         ; call logic handler

GameLoop_end            ld l, (ix+dX)                   ;
                        ld h, (ix+dY)                   ;
                        call To_screen                  ;
                        ld (ix+dCurrentScreen), hl      ;
                        call Attr_from_screen           ;
                        ld (ix+dCurrentAttr), hl        ;
Game_loop_cont          pop hl                          ; retrieve current list position
                        jr Sprite_logic_loop            ;

Logic_loop_end          xor a                           ;
                        out(254), a                     ;
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
                        output_szx AppFilename+".szx",AppEntry, AppLast ; The szx file

                        ; If we want a fancy loader we need to load a loading screen
                        ; import_bin AppFilename+".scr",$4000            ; Load a loading screen

                        ; Now, also generate a tzx file using the loader
                        output_tzx AppFilename+".tzx",AppFilename,"",AppFirst,AppLast-AppFirst,1,AppEntry ; A tzx file using the loader



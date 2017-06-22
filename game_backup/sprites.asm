;
; Input:
; hl points to sprite data to be drawn
; ix points to sprite metadata
;
; Output:
;
; Changes:
; BC, DE, HL
;
Clear_sprite            ld hl, (ix+6)                   ; last screen
                        inc h                           ;
                        dec h                           ;
                        ret z                           ;
                        ld de, (ix+8)                   ; last sprite
                        ld b, 16                        ;
                        jr Draw_1_row

Draw_sprite             ld de, hl                       ;
                        ld (ix+8), hl                   ;
                        ld l, (ix)                      ; current x
                        ld h, (ix+1)                    ; current y
                        call To_screen                  ; hl now contains screen address
                        ld (ix+6), hl                   ; last screen
                        ld b, 16                        ;
Draw_1_row              ld c, (hl)                      ; ld current byte of screen data
                        ld a, (de)                      ; current byte of sprite data
                        xor c                           ; or with screen data
                        ld (hl), a                      ; write back to screen
                        inc l                           ; next screen address on row
                        inc de                          ; next byte of sprite data
                        ld c, (hl)                      ; repeat
                        ld a, (de)                      ;
                        xor c                           ;
                        ld (hl), a                      ;
                        inc l                           ;
                        inc de                          ;
                        ld c, (hl)                      ; repeat
                        ld a, (de)                      ;
                        xor c                           ;
                        ld (hl), a                      ;
                        inc de                          ;
                        dec l                           ; reset row position
                        dec l                           ;
Draw_1_down             call Inc_y                      ; next y on screen
                        djnz Draw_1_row                 ; repeat for each row
                        ret                             ;

Calc_sprite_base        ld hl, (ix+2)                   ; sprite address
                        ld e, (ix+5)                    ; sprite length
                        ld d, 0                         ;
                        ld a, (ix+4)                    ; current frame
                        inc a                           ; deliberately add 1 so the 'dec a' test for zero can be
Calc_sb_loop            dec a                           ; done first when we enter this loop
                        ret z                           ;
                        add hl, de                      ;
                        jr Calc_sb_loop                 ;


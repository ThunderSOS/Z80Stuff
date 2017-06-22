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
Clear_sprite            ld hl, (ix+dLastScreen)         ; last screen
                        inc h                           ;
                        dec h                           ;
                        ret z                           ; return immediately if nothing drawn
                        ld de, (ix+dLastSprite)         ; last sprite
                        ld b, 16                        ;
                        jr Draw_1_row                   ;

Draw_sprite             ex de, hl                       ; current sprite address now in de
                        ld (ix+dLastSprite), de         ; back it up for erase
                        ld hl, (ix+dCurrentScreen)      ;
                        ld (ix+dLastScreen), hl         ; back it up for erase
                        ld b, 16                        ;

Draw_1_row              ld a, (de)                      ; current byte of sprite data
                        xor (hl)                        ; xor with screen data
                        ld (hl), a                      ; write back to screen
                        inc l                           ; next screen address on row
                        inc de                          ; next byte of sprite data
                        ld a, (de)                      ;
                        xor (hl)                        ;
                        ld (hl), a                      ;
                        inc l                           ;
                        inc de                          ;
                        ld a, (de)                      ;
                        xor (hl)                        ;
                        ld (hl), a                      ;
                        inc de                          ;
                        dec l                           ; reset row position
                        dec l                           ;
Draw_1_down             call Inc_y                      ; hl = next y on screen
                        djnz Draw_1_row                 ; repeat for each row
                        ret                             ;

Draw_attrs              ld a, (ix+dX)                   ;
                        ld c, (ix+dY)
                        and 7                           ; are we on a byte boundary?
                        ld a, (ix+dAttr)                ;
                        jr z, Draw_attrs_3x2            ; we only need to paint 3x2 attributes instead of 3x3

Draw_attrs_3x3          ld l, (ix+dCurrentAttr)         ;
                        ld h, (ix+dCurrentAttr+1)       ;
                        ld de, 30                       ;
                        ld (hl), a                      ;
                        inc hl                          ;
                        ld (hl), a                      ;
                        inc hl                          ;
                        ld(hl), a                       ;
                        add hl, de                      ;
                        ld (hl), a                      ;
                        inc hl                          ;
                        ld(hl), a                       ;
                        inc hl                          ;
                        ld(hl), a                       ;
                        ld b, a                         ;
                        ld a, c;                        ;
                        and 7                           ;
                        ret z                           ;
                        ld a, b                         ;
                        add hl, de                      ;
                        ld (hl), a                      ;
                        inc hl                          ;
                        ld(hl), a                       ;
                        inc hl                          ;
                        ld(hl), a                       ;
                        ret                             ;

Draw_attrs_3x2          ld l, (ix+dCurrentAttr)         ;
                        ld h, (ix+dCurrentAttr+1)       ;
                        ld de, 31                       ;
                        ld (hl), a                      ;
                        inc hl                          ;
                        ld(hl), a                       ;
                        add hl, de                      ;
                        ld (hl), a                      ;
                        inc hl                          ;
                        ld(hl), a                       ;
                        add hl, de                      ;
                        ld d, a                         ;
                        ld a, c;                        ;
                        and 7                           ;
                        ret z                           ;
                        ld a, d                         ;
                        ld (hl), a                      ;
                        inc hl                          ;
                        ld(hl), a                       ;
                        ret                             ;

Calc_sprite_base        ld hl, (ix+dSpriteBase)         ;
                        ld e, 48; (ix+dFrameLength)         ;
                        ld d, 0                         ;
                        ld a, (ix+dX)                   ;
                        and 6                           ; convert pixel address to
                        rra                             ; frame number, 0 - 3
                        inc a                           ; deliberately add 1 so the 'dec a' test for zero can be
Calc_sb_loop_old        dec a                           ; done first when we enter this loop
                        ret z                           ;
                        add hl, de                      ;
                        jr Calc_sb_loop_old             ;





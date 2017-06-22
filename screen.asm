
Screen_start            EQU 16384                       ;
Attrs_start             EQU 22528                       ;
Buffer_offset           EQU 00100000b                   ; add 32 to h part of screen address = 24576

; Input:
; h = Y Coordinate
; l = X Coordinate
;
; Output:
; hl = Screen Address
To_screen               ld a, l                         ; x
                        and 248                         ; 11111000
                        rra                             ;
                        rra                             ;
                        rra                             ; divided by 8
                        ld l, a                         ;
                        ld a, h                         ; y
                        rla                             ;
                        rla                             ;
                        and 11100000b                   ;
                        or l                            ;
                        ld l,a                          ;
                        ld a,h                          ;
                        rra                             ;
                        rra                             ;
                        or 10000000b                    ;
                        rra                             ;
                        xor h                           ;
                        and 11111000b                   ;
                        xor h                           ;
                        ld h,a                          ;
                        ; set 5, h                       ; if drawing to screen buffer
                        ret                             ;

; if printing characters calcs screen address
; from X, Y char position in hl (untested)
Char_pos                ld a, h                         ;
                        ld c, a                         ;
                        and 24                          ;
                        or 64                           ;
                        ld h, a                         ;
                        ld a, c                         ;
                        and 7                           ;
                        rrca                            ;
                        rrca                            ;
                        rrca                            ;
                        or l                            ;
                        ld l, a                         ;
                        ret                             ;

; hl contains screen address
; de address of char
; return b = 0
Draw_char               ld b, 8                         ;
Draw_char_loop          ld a, (de)                      ;
                        ld (hl), a                      ;
                        inc h                           ;
                        inc de                          ;
                        djnz Draw_char_loop             ;
                        ret                             ;

; straight from Mastering Machine Code on Your ZX Spectrum (Toni Baker)
Next_print_pos          rr h                            ;
                        rr h                            ;
                        rr h                            ;
                        inc hl                          ;
                        rl h                            ;
                        rl h                            ;
                        rl h                            ;
                        ret                             ;

; Input:
; ix points to a sprite structure
;
; Output
; hl = attribute address
; NB, unused routine
XY_to_attr              ld a, (ix+dY)                   ;
                        and 11111000b                   ;
                        rlca                            ;
                        rlca                            ;
                        ld c, a                         ;
                        and 3                           ;
                        or 88                           ;
                        ld h, a                         ;
                        ld a, (ix+dX)                   ;
                        and 11111000b                   ;
                        rra                             ;
                        rra                             ;
                        rra                             ;
                        ld l, a                         ;
                        ld a, c                         ;
                        and 11100000b                   ;
                        or l                            ;
                        ld l, a                         ;
                        ret                             ;

; Input:
; hl = screen address
; Output:
; hl = attribute address
Attr_from_screen        ld a, h                         ;
                        rrca                            ;
                        rrca                            ;
                        rrca                            ;
                        and 3                           ;
                        or 88                           ;
                        ld h, a                         ;
                        ret                             ;

; Input:
; hl = valid current screen memory
; Output:
; hl = memory address of one pixel line lower
Inc_y                   inc h                           ;
                        ld a,h                          ;
                        and 7                           ;
                        ret nz                          ;
                        ld a,l                          ;
                        add a,32                        ;
                        ld l,a                          ;
                        ret c                           ;
                        ld a,h                          ;
                        sub 8                           ;
                        ld h,a                          ;
                        ret                             ;

Clear_attrs             ld hl, Attrs_start              ;
                        ld de, Attrs_start+1            ;
                        ld (hl), a                      ;
                        ld bc, 768                      ;
                        ldir                            ;
                        ret                             ;

; Fast buffer copy, hl points to the buffer
Copy_screen             ld a, 1                         ;
                        out(254), a                     ;
                        ld (Copy_screen_end+1),sp       ; Self-modifying code, stores current stack pointer in a ld sp, nn instruction at the end
                        exx                             ; save buffer address in hl
                        ld hl,16384+16                  ; Where the actual screen is, but as we're using the stack it's the right hand side

Copy_screen_loop        exx                             ; save screen hl address and restore buffer hl
                        ld sp, hl                       ;
                        pop af, bc, de, ix              ; copy 8 bytes from buffer

                        exx                             ; so hl is now screen address
                        ex af, af'                      ;
                        pop af, bc, de, iy              ; copy another 8 bytes from buffer

                        ld sp, hl                       ;
                        push iy, de, bc, af             ;
                        ex af, af'                      ;
                        exx                             ; hl is buffer address again
                        push ix, de, bc, af             ;
                        ld de, 16                       ;
                        add hl, de                      ;
                        exx                             ;
                        ld de, 16                       ;
                        add hl, de                      ;

                        ld a, h                         ;
                        cp 88                           ; have we hit start of attrs?
                        jr nz, Copy_screen_loop         ;

Copy_screen_end         ld sp, 0                        ;
                        exx                             ;
                        xor a                           ;
                        out(254), a                     ;
                        ret                             ;

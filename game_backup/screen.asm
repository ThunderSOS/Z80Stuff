
Sccreen_start           EQU 16384                       ;
Attrs_start             EQU 22528                       ;

; Input:
; h = Y Coordinate
; l = X Coordinate
;
; Output:
; hl = Screen Address
To_screen               ld a,h                          ;
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
                        ret                             ;

; Input:
; hl = valid current screen memory
;
; Output:
; hl = memory address of one line lower
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

Clear_attrs             ld hl, Attrs_start
                        ld de, Attrs_start+1
                        ld (hl), a
                        ld bc, 768
                        ldir
                        ret


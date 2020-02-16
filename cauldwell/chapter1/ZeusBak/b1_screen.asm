
xy_to_screen            ld a, h                         ; h = y
                        rla                             ;
                        rla                             ;
                        rla                             ;
                        ld h, a                         ;
                        ld a, l                         ; c = x
                        rla                             ;
                        rla                             ;
                        rla                             ;
                        ld l, a                         ;
hl_to_screen            ld a, l                         ; x
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

; de -> offset to add either side
; hl -> screen address
attr_at_hl              call screen_to_attr_hl          ;
                        add hl, de                      ;
                        ld a, (hl)                      ; return attribute in a.
                        ret                             ;

; hl -> screen address
; bc -> attr address from screen
screen_to_attr_bc       ld a, h                         ;
                        rrca                            ;
                        rrca                            ;
                        rrca                            ;
                        and 3                           ;
                        or 88                           ;
                        ld b, a                         ;
                        ld c, l                         ;
                        ret                             ;

screen_to_attr_hl       ld a, h                         ;
                        rrca                            ;
                        rrca                            ;
                        rrca                            ;
                        and 3                           ;
                        or 88                           ;
                        ld h, a                         ;
                        ret                             ;

attr_from_xy            ld a, c                         ; y position.
                        and 248                         ;
                        ld l, a                         ;
                        ld h, 0                         ;
                        add hl, hl                      ;
                        add hl, hl                      ; mult by 32
                        ld a, h                         ;
                        or 88                           ;
                        ld h, a                         ;
                        ld a, b                         ; get x displacement.
                        and 248                         ;
                        rra                             ;
                        rra                             ;
                        rra                             ;
                        add a,l                         ; add to low byte.
                        ld l,a                          ; hl=address of attributes.
                        ret                             ;


Draw_room               ld de, (Room_offset)            ;
                        ld hl, 16384                    ;
                        add hl, de                      ;
                        ld (Current_screen), hl         ;
                        ld hl, Memory_room              ;
                        ld c, 24                        ;
Draw_room_loop          ld b, 32                        ;
Draw_room_row           push hl                         ;
                        push bc                         ;
                        ld a, (hl)                      ;
                        and a                           ;
                        jr z, Next_room_char            ;
                        ld e, a                         ;
                        dec e                           ;
                        ld d, 0                         ;
                        ex de, hl                       ;
                        add hl ,hl                      ;
                        add hl, hl                      ;
                        add hl, hl                      ;
                        ld de, Brick1                   ;
                        add hl, de                      ;
                        ex de, hl                       ;
                        ld hl, (Current_screen)         ;
                        call Draw_char                  ;
Next_room_char          ld hl, (Current_screen)         ;
                        call Next_print_pos             ;
                        ld (Current_screen), hl         ;
                        pop bc                          ;
                        pop hl                          ;
                        inc hl                          ;
                        djnz Draw_room_row              ;
                        dec c                           ;
                        ld a, c                         ;
                        or a                            ;
                        jr nz, Draw_room_loop           ;
                        ret                             ;

Map_pos                 ld a, c                         ; y
                        rrca                            ;
                        rrca                            ;
                        rrca                            ;
                        and 31                          ;
                        ld l, a                         ;
                        ld h, 0                         ;
                        add hl, hl                      ;
                        add hl, hl                      ;
                        add hl, hl                      ;
                        add hl, hl                      ;
                        add hl, hl                      ;
                        ld a, b                         ; x
                        rrca                            ;
                        rrca                            ;
                        rrca                            ;
                        and 31                          ;
                        ld e, a                         ;
                        ld d, 0                         ;
                        add hl, de                      ;
                        ld de, Memory_room              ;
                        add hl, de                      ;
                        ret                             ;

Current_screen          defw 16384                      ;
Room_offset             defw 0                          ; //32*2                  ;


Memory_room             defb 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ;
                        defb 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ;
                        defb 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ;
                        defb 7, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 0, 0, 4, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 8 ;
                        defb 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4 ;
                        defb 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4 ;
                        defb 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4 ;
                        defb 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4 ;
                        defb 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4 ;
                        defb 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4 ;
                        defb 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4 ;
                        defb 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4 ;
                        defb 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4 ;
                        defb 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4 ;
                        defb 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4 ;
                        defb 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4 ;
                        defb 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4 ;
                        defb 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4 ;
                        defb 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4 ;
                        defb 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4 ;
                        defb 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4 ;
                        defb 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4 ;
                        defb 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4 ;
                        defb 5, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 6 ;

Brick1                  dg x - - - - - - -              ;
                        dg X X X X X X X -              ;
                        dg X X X X X X X -              ;
                        dg - - - - - - - -              ;
                        dg - X X X X X X X              ;
                        dg - X X X X X X X              ;
                        dg - - - - - - - -              ;
                        dg x - - - - - - -              ;

Brick2                  dg x - - - - - - -              ;
                        dg - X X X X X X X              ;
                        dg - X X X X X X X              ;
                        dg - - - - - - - -              ;
                        dg X X X X X X X -              ;
                        dg X X X X X X X -              ;
                        dg - - - - - - - -              ;
                        dg x - - - - - - -              ;

Brick_left              dg x - - - - - x x              ;
                        dg - - - - - - x x              ;
                        dg - - - - - - x x              ;
                        dg - - - - - - - -              ;
                        dg - - - - - - - -              ;
                        dg - - - - - - x x              ;
                        dg - - - - - - x x              ;
                        dg x - - - - - x x              ;

Brick_right             dg x x - - - - - x              ;
                        dg x x - - - - - -              ;
                        dg x x - - - - - -              ;
                        dg - - - - - - - -              ;
                        dg - - - - - - - -              ;
                        dg x x - - - - - -              ;
                        dg x x - - - - - -              ;
                        dg x x - - - - - x              ;

Brick_corner_LB         dg X X - - - - - -              ;
                        dg X X X X X X X -              ;
                        dg X X X X X X X -              ;
                        dg - - - - - - - -              ;
                        dg X X X X X X X X              ;
                        dg X X X X X X X X              ;
                        dg - - - - - - - -              ;
                        dg - - - - - - - -              ;

Brick_corner_RB         dg - - - - - - X X              ;
                        dg - X X X X X X X              ;
                        dg - X X X X X X X              ;
                        dg - - - - - - - -              ;
                        dg X X X X X X X X              ;
                        dg X X X X X X X X              ;
                        dg - - - - - - - -              ;
                        dg - - - - - - - -              ;

Brick_corner_LT         dg - - - - - - - -              ;
                        dg X X X X X X X -              ;
                        dg X X X X X X X -              ;
                        dg - - - - - - - -              ;
                        dg X X X X X X X X              ;
                        dg X X X X X X X X              ;
                        dg X X - - - - - -              ;
                        dg X X - - - - - -              ;

Brick_corner_RT         dg - - - - - - - -              ;
                        dg - X X X X X X X              ;
                        dg - X X X X X X X              ;
                        dg - - - - - - - -              ;
                        dg X X X X X X X X              ;
                        dg X X X X X X X X              ;
                        dg - - - - - - X X              ;
                        dg - - - - - - X X              ;



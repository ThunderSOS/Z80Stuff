
Sprite_right            ld a, (ix+4)                    ;
                        inc a                           ;
                        and 3                           ;
                        ld (ix+4), a                    ;
                        jr z, inc_x                     ;
                        ret                             ;
inc_x                   ld a, (ix)                      ;
                        inc a                           ;
                        ld (ix), a                      ;
                        cp 30                           ;
                        jr nc, reverse_x1               ;
                        ret                             ;

reverse_x1              ld hl, Sprite_left              ;
                        ld (ix+10), hl                  ;
                        ret                             ;

reverse_x2              ld hl, Sprite_right             ;
                        ld (ix+10), hl                  ;
                        ret                             ;

Sprite_left             ld a, (ix+4)                    ;
                        dec a                           ;
                        cp 255                          ;
                        jr z, dec_x                     ;
                        ld (ix+4), a                    ;
                        ret                             ;

dec_x                   ld (ix+4), 3                    ;
                        ld a, (ix)                      ;
                        dec a                           ;
                        ld (ix), a                      ;
                        and a                           ;
                        jr z, reverse_x2                ;
                        ret                             ;

Sprite_down             ld a, (ix+1)                    ;
                        inc a                           ;
                        cp 176                          ;
                        ld (ix+1), a                    ;
                        jr nc, reverse_y1               ;
                        ret                             ;

Sprite_up               ld a, (ix+1)                    ;
                        dec a                           ;
                        cp 32                           ;
                        ld (ix+1), a                    ;
                        jr c, reverse_y2               ;
                        ret                             ;
                        ;
reverse_y1              ld hl, Sprite_up                ;
                        ld (ix+10), hl                  ;
                        ret                             ;

reverse_y2              ld hl, Sprite_down              ;
                        ld (ix+10), hl                  ;
                        ret                             ;



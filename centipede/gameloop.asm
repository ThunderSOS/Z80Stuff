
init_game               ld a, 6; (screen_colour)           ;  + 8*7                   ;
                        ld (23693),a                    ; set our screen colours.
                        call 3503                       ; clear the screen.
                        ld a, 0                         ;
                        call 8859                       ; set the border permanent
                        call init_mushrooms             ;
                        call display_score              ;
                        call init_segments              ;
                        call draw_all_segments          ;
                        ld iy, player

gameloop                ld a, 0                         ;
                        out(254), a                     ;
                        call update_all_segments        ;
                        ;ld a, 6                         ;
                        ;out(254), a                     ;


                        ld h, 0                         ;
                        ld l, 24*8                      ;
                        call hl_to_screen               ;
                        call display_score_digits       ;
                        xor a                           ;
                        out(254), a                     ;
                        halt                            ;
                        jr gameloop                     ;
                        ret                             ;


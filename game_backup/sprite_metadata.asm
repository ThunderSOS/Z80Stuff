
Sprite_data             defb 1                          ; 0, current x
                        defb 14*8+0                     ; 1, current y
                        defw Sprite_1                   ; 2, 3
                        defb 0                          ; 4, frame flags, dxxxxfff, f = frame (0 - 7), d = dirty
                        defb 48                         ; 5, bytes per frame
                        defw 0                          ; 6, 7 last screen
                        defw 0                          ; 8, 9 last sprite
                        defw Sprite_right               ; 10, 11 spite_logic

Sprite_data1            defb 10                         ; 0, current x
                        defb 6*8+1                      ; 1, current y
                        defw Sprite_1                   ; 2, 3
                        defb 0                          ; 4, frame flags, dxxxxfff, f = frame (0 - 7), d = dirty
                        defb 48                         ; 5, bytes per frame
                        defw 0                          ; 6, 7 last screen
                        defw 0                          ; 8, 9 last sprite
                        defw Sprite_down                ; 10, 11 spite_logic

Sprite_data2            defb 12                         ; 0, current x
                        defb 6*8+4                      ; 1, current y
                        defw Sprite_1                   ; 2, 3
                        defb 2                          ; 4, frame flags, dxxxxfff, f = frame (0 - 7), d = dirty
                        defb 48                         ; 5, bytes per frame
                        defw 0                          ; 6, 7 last screen
                        defw 0                          ; 8, 9 last sprite
                        defw Sprite_right               ; 10, 11 spite_logic

Sprite_data3            defb 14                         ; 0, current x
                        defb 6*8+7                      ; 1, current y
                        defw Sprite_1                   ; 2, 3
                        defb 2                          ; 4, frame flags, dxxxxfff, f = frame (0 - 7), d = dirty
                        defb 48                         ; 5, bytes per frame
                        defw 0                          ; 6, 7 last screen
                        defw 0                          ; 8, 9 last sprite
                        defw Sprite_up                  ; 10, 11 spite_logic

Sprites                 defw Sprite_data
                        defw Sprite_data1
                        defw Sprite_data2
                        defw Sprite_data3
                        defw 0

Sprite_1                dg - - - - - - - - - - - - - - - - - - - - - - - - ;
                        dg - - - - - - x x x x - - - - - - - - - - - - - - ;
                        dg - - - - x x - - - - x x - - - - - - - - - - - - ;
                        dg - - - X - - X X - - - - X - - - - - - - - - - - ;
                        dg - - X - - X - - - - - - - X - - - - - - - - - - ;
                        dg - - X - - X - - - - - - - X - - - - - - - - - - ;
                        dg - X - - - - - - - - - - - - X - - - - - - - - - ;
                        dg - X - - - - - - - - - - - - X - - - - - - - - - ;
                        dg - X - - - - - - - - - - - - X - - - - - - - - - ;
                        dg - X - - - - - - - - - - - - X - - - - - - - - - ;
                        dg - - X - - - - - - - - - - X - - - - - - - - - - ;
                        dg - - X - - - - - - - - - - X - - - - - - - - - - ;
                        dg - - - X - - - - - - - - X - - - - - - - - - - - ;
                        dg - - - - x x - - - - x x - - - - - - - - - - - - ;
                        dg - - - - - - x x x x - - - - - - - - - - - - - - ;
                        dg - - - - - - - - - - - - - - - - - - - - - - - - ;

                        dg - - - - - - - - - - - - - - - - - - - - - - - - ;
                        dg - - - - - - - - x x x x - - - - - - - - - - - - ;
                        dg - - - - - - x x - - - - x x - - - - - - - - - - ;
                        dg - - - - - X - - X X - - - - X - - - - - - - - - ;
                        dg - - - - X - - X - - - - - - - X - - - - - - - - ;
                        dg - - - - X - - X - - - - - - - X - - - - - - - - ;
                        dg - - - X - - - - - - - - - - - - X - - - - - - - ;
                        dg - - - X - - - - - - - - - - - - X - - - - - - - ;
                        dg - - - X - - - - - - - - - - - - X - - - - - - - ;
                        dg - - - X - - - - - - - - - - - - X - - - - - - - ;
                        dg - - - - X - - X - - - - - - - X - - - - - - - - ;
                        dg - - - - X - - - - - - - - - - X - - - - - - - - ;
                        dg - - - - - X - - - - - - - - X - - - - - - - - - ;
                        dg - - - - - - x x - - - - x x - - - - - - - - - - ;
                        dg - - - - - - - - x x x x - - - - - - - - - - - - ;
                        dg - - - - - - - - - - - - - - - - - - - - - - - - ;

                        dg - - - - - - - - - - - - - - - - - - - - - - - - ;
                        dg - - - - - - - - - - x x x x - - - - - - - - - - ;
                        dg - - - - - - - - x x - - - - x x - - - - - - - - ;
                        dg - - - - - - - X - - X X - - - - X - - - - - - - ;
                        dg - - - - - - X - - X - - - - - - - X - - - - - - ;
                        dg - - - - - - X - - X - - - - - - - X - - - - - - ;
                        dg - - - - - X - - - - - - - - - - - - X - - - - - ;
                        dg - - - - - X - - - - - - - - - - - - X - - - - - ;
                        dg - - - - - X - - - - - - - - - - - - X - - - - - ;
                        dg - - - - - X - - - - - - - - - - - - X - - - - - ;
                        dg - - - - - - X - - X - X - - - - - X - - - - - - ;
                        dg - - - - - - X - - - - - - - - - - X - - - - - - ;
                        dg - - - - - - - X - - - - - - - - X - - - - - - - ;
                        dg - - - - - - - - x x - - - - x x - - - - - - - - ;
                        dg - - - - - - - - - - x x x x - - - - - - - - - - ;
                        dg - - - - - - - - - - - - - - - - - - - - - - - - ;

                        dg - - - - - - - - - - - - - - - - - - - - - - - - ;
                        dg - - - - - - - - - - - - x x x x - - - - - - - - ;
                        dg - - - - - - - - - - x x - - - - x x - - - - - - ;
                        dg - - - - - - - - - X - - X X - - - - X - - - - - ;
                        dg - - - - - - - - X - - X - - - - - - - X - - - - ;
                        dg - - - - - - - - X - - X - - - - - - - X - - - - ;
                        dg - - - - - - - X - - - - - - - - - - - - X - - - ;
                        dg - - - - - - - X - - - - - - - - - - - - X - - - ;
                        dg - - - - - - - X - - - - - - - - - - - - X - - - ;
                        dg - - - - - - - X - - - - - - - - - - - - X - - - ;
                        dg - - - - - - - - X - - X - X - X - - - X - - - - ;
                        dg - - - - - - - - X - - - - - - - - - - X - - - - ;
                        dg - - - - - - - - - X - - - - - - - - X - - - - - ;
                        dg - - - - - - - - - - x x - - - - x x - - - - - - ;
                        dg - - - - - - - - - - - - x x x x - - - - - - - - ;
                        dg - - - - - - - - - - - - - - - - - - - - - - - - ;

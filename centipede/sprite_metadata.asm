screen_colour           defb 2                          ;
mushroom_colour         defb 68                         ;

segment_def struct      seg_direction ds 1              ;
                        seg_dx ds 1                     ;
                        seg_dy ds 1                     ;
                        seg_last_screen ds 2            ;
                        seg_last_sprite ds 2            ;
                        seg_last_attr ds 2              ;
                        len_seg equ .                   ;
send

player_def struct       plyr_dx ds 1                    ;
                        plyr_dy ds 1                    ;
                        plyr_last_screen ds 2           ;
                        plyr_last_sprite ds 2           ;
                        len_player equ .                ;
send

; Table of segments based on above struct
segments                defb 0,0,0,0,0,0,0,0,0          ; segment 1
                        defb 0,0,0,0,0,0,0,0,0          ; segment 2
                        defb 0,0,0,0,0,0,0,0,0          ; segment 3
                        defb 0,0,0,0,0,0,0,0,0          ; segment 4
                        defb 0,0,0,0,0,0,0,0,0          ; segment 5
                        defb 0,0,0,0,0,0,0,0,0          ; segment 6
                        defb 0,0,0,0,0,0,0,0,0          ; segment 7
                        defb 0,0,0,0,0,0,0,0,0          ; segment 8
                        defb 0,0,0,0,0,0,0,0,0          ; segment 9
                        defb 0,0,0,0,0,0,0,0,0          ; segment 10

num_segments            defb 9                          ;

player                  defb 15*8,23*8,0,0,0,0                ;

segment_sprite          dg - - - X X - - - - - - - - - - - ;
                        dg - X X X X X X - - - - - - - - - ;
                        dg - X X X X X X - - - - - - - - - ;
                        dg X X X X X X X X - - - - - - - - ;
                        dg X X X X X X X X - - - - - - - - ;
                        dg - X X X X X X - - - - - - - - - ;
                        dg - X X X X X X - - - - - - - - - ;
                        dg - - - X X - - - - - - - - - - - ;

                        dg - - - - - X X - - - - - - - - - ;
                        dg - - - X X X X X X - - - - - - - ;
                        dg - - - X X X X X X - - - - - - - ;
                        dg - - X X X X X X X X - - - - - - ;
                        dg - - X X X X X X X X - - - - - - ;
                        dg - - - X X X X X X - - - - - - - ;
                        dg - - - X X X X X X - - - - - - - ;
                        dg - - - - - X X - - - - - - - - - ;

                        dg - - - - - - - X X - - - - - - - ;
                        dg - - - - - X X X X X X - - - - - ;
                        dg - - - - - X X X X X X - - - - - ;
                        dg - - - - X X X X X X X X - - - - ;
                        dg - - - - X X X X X X X X - - - - ;
                        dg - - - - - X X X X X X - - - - - ;
                        dg - - - - - X X X X X X - - - - - ;
                        dg - - - - - - - X X - - - - - - - ;

                        dg - - - - - - - - - X X - - - - - ;
                        dg - - - - - - - X X X X X X - - - ;
                        dg - - - - - - - X X X X X X - - - ;
                        dg - - - - - - X X X X X X X X - - ;
                        dg - - - - - - X X X X X X X X - - ;
                        dg - - - - - - - X X X X X X - - - ;
                        dg - - - - - - - X X X X X X - - - ;
                        dg - - - - - - - - - X X - - - - - ;


ship_sprite             dg - - - - - - - - - - - - - - - - ;
                        dg - - X - X - - - - - - - - - - - ;
                        dg - - X - X - - - - - - - - - - - ;
                        dg - - X - X - - - - - - - - - - - ;
                        dg - X X X X X - - - - - - - - - - ;
                        dg - X X X X X - - - - - - - - - - ;
                        dg X X X X X X X - - - - - - - - - ;
                        dg X X X X X X X - - - - - - - - - ;

                        dg - - - - - - - - - - - - - - - - ;
                        dg - - - - X - X - - - - - - - - - ;
                        dg - - - - X - X - - - - - - - - - ;
                        dg - - - - X - X - - - - - - - - - ;
                        dg - - - X X X X X - - - - - - - - ;
                        dg - - - X X X X X - - - - - - - - ;
                        dg - - X X X X X X X - - - - - - - ;
                        dg - - X X X X X X X - - - - - - - ;

                        dg - - - - - - - - - - - - - - - - ;
                        dg - - - - - - X - X - - - - - - - ;
                        dg - - - - - - X - X - - - - - - - ;
                        dg - - - - - - X - X - - - - - - - ;
                        dg - - - - - X X X X X - - - - - - ;
                        dg - - - - - X X X X X - - - - - - ;
                        dg - - - - X X X X X X X - - - - - ;
                        dg - - - - X X X X X X X - - - - - ;

                        dg - - - - - - - - - - - - - - - - ;
                        dg - - - - - - - - X - X - - - - - ;
                        dg - - - - - - - - X - X - - - - - ;
                        dg - - - - - - - - X - X - - - - - ;
                        dg - - - - - - - X X X X X - - - - ;
                        dg - - - - - - - X X X X X - - - - ;
                        dg - - - - - - X X X X X X X - - - ;
                        dg - - - - - - X X X X X X X - - - ;

bulletprite             dg - - - - - - - - - - - - - - - - ;
                        dg - - X - X - - - - - - - - - - - ;
                        dg - - X - X - - - - - - - - - - - ;
                        dg - - X - X - - - - - - - - - - - ;
                        dg - - X - X - - - - - - - - - - - ;
                        dg - - X - X - - - - - - - - - - - ;
                        dg - - X - X - - - - - - - - - - - ;
                        dg - - X - X - - - - - - - - - - - ;

                        dg - - - - - - - - - - - - - - - - ;
                        dg - - - - X - X - - - - - - - - - ;
                        dg - - - - X - X - - - - - - - - - ;
                        dg - - - - X - X - - - - - - - - - ;
                        dg - - - - X - X - - - - - - - - - ;
                        dg - - - - X - X - - - - - - - - - ;
                        dg - - - - X - X - - - - - - - - - ;
                        dg - - - - X - X - - - - - - - - - ;

                        dg - - - - - - - - - - - - - - - - ;
                        dg - - - - - - X - X - - - - - - - ;
                        dg - - - - - - X - X - - - - - - - ;
                        dg - - - - - - X - X - - - - - - - ;
                        dg - - - - - - X - X - - - - - - - ;
                        dg - - - - - - X - X - - - - - - - ;
                        dg - - - - - - X - X - - - - - - - ;
                        dg - - - - - - X - X - - - - - - - ;

                        dg - - - - - - - - - - - - - - - - ;
                        dg X - X - - - - - - - - - - - - - ;
                        dg X - X - - - - - - - - - - - - - ;
                        dg X - X - - - - - - - - - - - - - ;
                        dg X - X - - - - - - - - - - - - - ;
                        dg X - X - - - - - - - - - - - - - ;
                        dg X - X - - - - - - - - - - - - - ;
                        dg X - X - - - - - - - - - - - - - ;

mushroom_sprite         defb 24,126,255,255,60,60,60,60 ;


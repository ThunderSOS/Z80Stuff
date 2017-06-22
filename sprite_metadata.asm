
Sprite_def struct                                       ;
dX                      ds 1                            ;
dY                      ds 1                            ;
dSpeed                  ds 1                            ;
dFrameLength            ds 1                            ;
dSpriteLeft             ds 2                            ;
dSpriteRight            ds 2                            ;
dSpriteBase             ds 2                            ;
dCurrentScreen          ds 2                            ;
dLastScreen             ds 2                            ;
dCurrentSprite          ds 2                            ;
dLastSprite             ds 2                            ;
dSpriteLogic            ds 2                            ;
dAttr                   ds 1                            ;
dCurrentAttr            ds 2                            ;
dLastAttr               ds 2                            ;
dMaxX                   ds 1                            ;
dMaxY                   ds 1                            ;
dMinX                   ds 1                            ;
dMinY                   ds 1                            ;
dFlags                  ds 1                            ;
send

; flags
; 7 = exclude from collision loop
; 6 = alive
; 0 = left/right
Last_char               defb 0                          ;
Health                  defw 65535                      ;
Collision_handler       defw Health_handler

Sprite_data             defb 11*8                       ; current x
                        defb 14*8+0                     ; current y
                        defb 4                          ; speed
                        defb 48                         ; bytes per frame
                        defw Ghost                      ;
                        defw Ghost                      ;
                        defw Ghost                      ;
                        defw 0                          ; current screen
                        defw 0                          ; last screen
                        defw 0                          ; current sprite
                        defw 0                          ; last sprite
                        defw Patrol_left                ; spite_logic
                        defb 4                          ; green
                        defw 0                          ;
                        defw 0                          ;
                        defb 239                        ;
                        defb 175                        ;
                        defb 2                          ;
                        defb 0                          ;
                        defb 0

Sprite_data_1           defb 8                          ; current x
                        defb 6*8+1                      ; current y
                        defb 2                          ; speed
                        defb 48                         ; bytes per frame
                        defw Sprite_1                   ;
                        defw Sprite_1                   ;
                        defw Sprite_1                   ;
                        defw 0                          ; current screen
                        defw 0                          ; last screen
                        defw 0                          ; current sprite
                        defw 0                          ; last sprite
                        defw Patrol_down                ; spite_logic
                        defb 5                          ;
                        defw 0                          ;
                        defw 0                          ;
                        defb 239                        ;
                        defb 175                        ;
                        defb 2                          ;
                        defb 40                         ;
                        defb 0

Sprite_data_2           defb 8*2                        ; current x
                        defb 17*8+4                     ; current y
                        defb 4                          ;
                        defb 48                         ; bytes per frame
                        defw Bat                        ;
                        defw Bat                        ;
                        defw Bat                        ;
                        defw 0                          ; current screen
                        defw 0                          ; last screen
                        defw 0                          ; current sprite
                        defw 0                          ; last sprite
                        defw Patrol_right               ; spite_logic
                        defb 1                          ;
                        defw 0                          ;
                        defw 0                          ;
                        defb 239                        ;
                        defb 175                        ;
                        defb 2                          ;
                        defb 0                          ;
                        defb 64

Sprite_data_3           defb 13*8                       ; current x
                        defb 6*8+7                      ; current y
                        defb 4                          ;
                        defb 48                         ; bytes per frame
                        defw Sprite_1                   ;
                        defw Sprite_1                   ;
                        defw Sprite_1                   ;
                        defw 0                          ; current screen
                        defw 0                          ; last screen
                        defw 0                          ; current sprite
                        defw 0                          ; last sprite
                        defw Patrol_down                ; spite_logic
                        defb 3                          ;
                        defw 0                          ;
                        defw 0                          ;
                        defb 239                        ;
                        defb 175-8                      ;
                        defb 2                          ;
                        defb 4                          ;
                        defb 0

Sprite_data_4           defb 9*8                        ; current x
                        defb 4*8+0                      ; current y
                        defb 2                          ; speed
                        defb 48                         ; bytes per frame
                        defw Ghost                      ;
                        defw Ghost                      ;
                        defw Ghost                      ;
                        defw 0                          ; current screen
                        defw 0                          ; last screen
                        defw 0                          ; current sprite
                        defw 0                          ; last sprite
                        defw Patrol_right               ; spite_logic
                        defb 5                          ; cyan
                        defw 0                          ;
                        defw 0                          ;
                        defb 239                        ;
                        defb 175                        ;
                        defb 2                          ;
                        defb 0                          ;
                        defb 0

Bullet_sprite           defb 12*8                       ; current x
                        defb 6*8+0                      ; current y
                        defb 4                          ; speed
                        defb 48                         ; bytes per frame
                        defw Zap_left                   ;
                        defw Zap_right                  ;
                        defw Zap_left                   ;
                        defw 0                          ; current screen
                        defw 0                          ; last screen
                        defw 0                          ; current sprite
                        defw 0                          ; last sprite
                        defw Patrol_left                ; spite_logic
                        defb 7+64                       ; white
                        defw 0                          ;
                        defw 0                          ;
                        defb 239                        ;
                        defb 175                        ;
                        defb 2                          ;
                        defb 0                          ;
                        defb 128                        ; exclude from collision loop

Player_sprite           defb 120                        ; current x
                        defb 11*8+4                     ; current y
                        defb 2                          ; speed
                        defb 48                         ; bytes per frame
                        defw Spirit_Left                ;
                        defw Spirit_Right               ;
                        defw Spirit_Right               ;
                        defw 0                          ; current screen
                        defw 0                          ; last screen
                        defw 0                          ; current sprite
                        defw 0                          ; last sprite
                        defw Key_control                ; spite_logic
                        defb 7+64                       ;
                        defw 0                          ;
                        defw 0                          ;
                        defb 239                        ;
                        defb 175                        ;
                        defb 0                          ;
                        defb 0                          ;
                        defb 128

Sprites                 defw Player_sprite              ;
                        defw Sprite_data                ;
                        defw Sprite_data_2              ;
                        defw Sprite_data_1              ;
                        defw 0                          ;

Sprites_2               defw Sprite_data_3              ;
                        defw Sprite_data_4              ;
                        defw Sprite_data_2              ;
Bullet_slot             defw 0                          ;
                        defw 0                          ;


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
                        dg - - - - X - - - - - - - - - - X - - - - - - - - ;
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
                        dg - - - - - - X - - - - - - - - - - X - - - - - - ;
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
                        dg - - - - - - - - X - - - - - - - - - - X - - - - ;
                        dg - - - - - - - - X - - - - - - - - - - X - - - - ;
                        dg - - - - - - - - - X - - - - - - - - X - - - - - ;
                        dg - - - - - - - - - - x x - - - - x x - - - - - - ;
                        dg - - - - - - - - - - - - x x x x - - - - - - - - ;
                        dg - - - - - - - - - - - - - - - - - - - - - - - - ;

Ghost                   dg - - - - - - - X X X - - - - - - - - - - - - - - ;
                        dg - - - - - - X X X X X X - - - - - - - - - - - - ;
                        dg - - - - - X X X X X X X X - - - - - - - - - - - ;
                        dg - - - - - X X X X X X X X X - - - - - - - - - - ;
                        dg - - - - X X - - X X - - X X - - - - - - - - - - ;
                        dg - - - - X X - - - X - - - X - - - - - - - - - - ;
                        dg - - - - X - - - - X - - - X - - - - - - - - - - ;
                        dg - - - - X - - - - X - - - X - - - - - - - - - - ;
                        dg - - - X X X - - X X X - X X X - - - - - - - - - ;
                        dg - - X X X X X X X X X X X X X - - - - - - - - - ;
                        dg - X X X X X X X X X X X X X X X - - - - - - - - ;
                        dg X X X X X X X X X X X X X X X X - - - - - - - - ;
                        dg X X X X X X X X X X X X X X X - - - - - - - - - ;
                        dg - X X X X X X X X X X - - - - - - - - - - - - - ;
                        dg - - - - - X X X X X - - - - - - - - - - - - - - ;
                        dg - - - - - - X X X - - - - - - - - - - - - - - - ;

                        dg - - - - - - - - - X X X - - - - - - - - - - - - ;
                        dg - - - - - - - - X X X X X X - - - - - - - - - - ;
                        dg - - - - - - - X X X X X X X X - - - - - - - - - ;
                        dg - - - - - - - X X X X X X X X X - - - - - - - - ;
                        dg - - - - - - X X - - X X - - X X - - - - - - - - ;
                        dg - - - - - - X X - - - X - - - X - - - - - - - - ;
                        dg - - - - - - X - - - - X - - - X - - - - - - - - ;
                        dg - - - - - - X - - - - X - - - X - - - - - - - - ;
                        dg - - - - - X X X - - X X X - X X X - - - - - - - ;
                        dg - - - - X X X X X X X X X X X X X - - - - - - - ;
                        dg - - - X X X X X X X X X X X X X X X - - - - - - ;
                        dg - - X X X X X X X X X X X X X X X X - - - - - - ;
                        dg - - X X X X X X X X X X X X X X X - - - - - - - ;
                        dg - - - X X X X X X X X X X - - - - - - - - - - - ;
                        dg - - - - - - - X X X X X - - - - - - - - - - - - ;
                        dg - - - - - - - - X X X - - - - - - - - - - - - - ;

                        dg - - - - - - - - - - X X X - - - - - - - - - - - ;
                        dg - - - - - - - - - X X X X X X - - - - - - - - - ;
                        dg - - - - - - - - X X X X X X X X - - - - - - - - ;
                        dg - - - - - - - - X X X X X X X X X - - - - - - - ;
                        dg - - - - - - - X X - - X X - - X X - - - - - - - ;
                        dg - - - - - - - X X - - - X - - - X - - - - - - - ;
                        dg - - - - - - - X - - - - X - - - X - - - - - - - ;
                        dg - - - - - - - X - - - - X - - - X - - - - - - - ;
                        dg - - - - - - X X X - - X X X - X X X - - - - - - ;
                        dg - - - - - X X X X X X X X X X X X X X - - - - - ;
                        dg - - - - X X X X X X X X X X X X X X X X - - - - ;
                        dg - - - - X X X X X X X X X X X X X X X X - - - - ;
                        dg - - - - X X X X X X X X X X X X X X X X - - - - ;
                        dg - - - - X X X X X X X - - - X X X X X X - - - - ;
                        dg - - - - X X X X X X - - - - - X X X X - - - - - ;
                        dg - - - - - X X X X - - - - - - - X X - - - - - - ;

                        dg - - - - - - - - - - - - X X X - - - - - - - - - ;
                        dg - - - - - - - - - - - X X X X X X - - - - - - - ;
                        dg - - - - - - - - - - X X X X X X X X - - - - - - ;
                        dg - - - - - - - - - - X X X X X X X X X - - - - - ;
                        dg - - - - - - - - - X X - - X X - - X X - - - - - ;
                        dg - - - - - - - - - X X - - - X - - - X - - - - - ;
                        dg - - - - - - - - - X - - - - X - - - X - - - - - ;
                        dg - - - - - - - - - X - - - - X - - - X - - - - - ;
                        dg - - - - - - - - X X X - - X X X - X X X - - - - ;
                        dg - - - - - - - X X X X X X X X X X X X X X - - - ;
                        dg - - - - - - X X X X X X X X X X X X X X X X - - ;
                        dg - - - - - - X X X X X X X X X X X X X X X X - - ;
                        dg - - - - - - X X X X X X X X X X X X X X X X - - ;
                        dg - - - - - - X X X X X X X - - - X X X X X X - - ;
                        dg - - - - - - X X X X X X - - - - - X X X X - - - ;
                        dg - - - - - - - X X X X - - - - - - - X X - - - - ;

Spirit_Right            dg - - - - - - - - - - - - - - - - - - - - - - - - ;
                        dg - - - - X X X - - - - - - - - - - - - - - - - - ;
                        dg X X - X X X X X X X - - - - - - - - - - - - - - ;
                        dg - X X X X X X X X X X - - X - - - - - - - - - - ;
                        dg - - X X X X X - - X X X X X - - - - - - - - - - ;
                        dg - - - X X X X - - X X X X - - - - - - - - - - - ;
                        dg - - - X - - X X X - - X - - - - - - - - - - - - ;
                        dg - - - - X - - - - - - X - - - - - - - - - - - - ;
                        dg - - - - - X - - - - X - - - - - - - - - - - - - ;
                        dg - - - - - X - - - - X - - - - - - - - - - - - - ;
                        dg - - - - - X - - - X - - - - - - - - - - - - - - ;
                        dg - - - - X - - - X - - - - - - - - - - - - - - - ;
                        dg - - - X - - - X - - - - - - - - - - - - - - - - ;
                        dg - - X - - X X - - - - - - - - - - - - - - - - - ;
                        dg - - - X X - - - - - - - - - - - - - - - - - - - ;
                        dg - - - - - - - - - - - - - - - - - - - - - - - - ;


                        dg - - - - - - - - - - - - - - - - - - - - - - - - ;
                        dg - - - - - - X X X - - - - - - - - - - - - - - - ;
                        dg - - X X - X X X X X X X - - - - - - - - - - - - ;
                        dg - - - X X X X X X X X X X - - X - - - - - - - - ;
                        dg - - - - X X X X X - - X X X X X - - - - - - - - ;
                        dg - - - - - X X X X - - X X X - - - - - - - - - - ;
                        dg - - - - - X - - X X X - - X - - - - - - - - - - ;
                        dg - - - - - - X - - - - - - X - - - - - - - - - - ;
                        dg - - - - - - - X - - - - X - - - - - - - - - - - ;
                        dg - - - - - - - X - - - - X - - - - - - - - - - - ;
                        dg - - - - - - - X - - - X - - - - - - - - - - - - ;
                        dg - - - - - X X - - - X - - - - - - - - - - - - - ;
                        dg - - - - X - - - - X - - - - - - - - - - - - - - ;
                        dg - - - - - X X X X - - - - - - - - - - - - - - - ;
                        dg - - - - - - - - - - - - - - - - - - - - - - - - ;
                        dg - - - - - - - - - - - - - - - - - - - - - - - - ;

                        dg - - - - - - - - - - - - - - - - - - - - - - - - ;
                        dg - - - - - - - - X X X - - - - - - - - - - - - - ;
                        dg - - - - X X - X X X X X X X - - - - - - - - - - ;
                        dg - - - - - X X X X X X X X X X - - X - - - - - - ;
                        dg - - - - - - X X X X X - - X X X X X - - - - - - ;
                        dg - - - - - - - X X X X - - X X X - - - - - - - - ;
                        dg - - - - - - - X - - X X X - - X - - - - - - - - ;
                        dg - - - - - - - - X - - - - - - X - - - - - - - - ;
                        dg - - - - - - - - - X - - - - X - - - - - - - - - ;
                        dg - - - - - - - X - X - - - - X - - - - - - - - - ;
                        dg - - - - - - X - X - - - - X - - - - - - - - - - ;
                        dg - - - - - - X - - - - - X - - - - - - - - - - - ;
                        dg - - - - - - - X - - - X - - - - - - - - - - - - ;
                        dg - - - - - - - - X X X - - - - - - - - - - - - - ;
                        dg - - - - - - - - - - - - - - - - - - - - - - - - ;
                        dg - - - - - - - - - - - - - - - - - - - - - - - - ;

                        dg - - - - - - - - - - - - - - - - - - - - - - - - ;
                        dg - - - - - - - - - - X X X - - - - - - - - - - - ;
                        dg - - - - - - X X - X X X X X X X - - - - - - - - ;
                        dg - - - - - - - X X X X X X X X X X - - X - - - - ;
                        dg - - - - - - - - X X X X X - - X X X X X - - - - ;
                        dg - - - - - - - - - X X X X - - X X X - - - - - - ;
                        dg - - - - - - - - - X - - X X X - - X - - - - - - ;
                        dg - - - - - - - - - - X - - - - - - X - - - - - - ;
                        dg - - - - - - - - - - - X - - - - X - - - - - - - ;
                        dg - - - - - - - - - - - X - - - - X - - - - - - - ;
                        dg - - - - - - - - - - - X - - - X - - - - - - - - ;
                        dg - - - - - - - - - X X - - - X - - - - - - - - - ;
                        dg - - - - - - - - X - - - - X - - - - - - - - - - ;
                        dg - - - - - - - - - X X X X - - - - - - - - - - - ;
                        dg - - - - - - - - - - - - - - - - - - - - - - - - ;
                        dg - - - - - - - - - - - - - - - - - - - - - - - - ;


Spirit_Left             dg - - - - - - - - - - - - - - - - - - - - - - - - ;
                        dg - - - - - - - X X X - - - - - - - - - - - - - - ;
                        dg - - - - X X X X X X X - X X - - - - - - - - - - ;
                        dg X - - X X X X X X X X X X - - - - - - - - - - - ;
                        dg - X X X X - - X X X X X - - - - - - - - - - - - ;
                        dg - - X X X - - X X X X - - - - - - - - - - - - - ;
                        dg - - X - - X X X - - X - - - - - - - - - - - - - ;
                        dg - - X - - - - - - X - - - - - - - - - - - - - - ;
                        dg - - - X - - - - X - - - - - - - - - - - - - - - ;
                        dg - - - X - - - - X - - - - - - - - - - - - - - - ;
                        dg - - - - X - - - X - - - - - - - - - - - - - - - ;
                        dg - - - - - X - - - X X X - - - - - - - - - - - - ;
                        dg - - - - - - X X X X X X - - - - - - - - - - - - ;
                        dg - - - - - - - X X X - - - - - - - - - - - - - - ;
                        dg - - - - - - - - - - - - - - - - - - - - - - - - ;
                        dg - - - - - - - - - - - - - - - - - - - - - - - - ;

                        dg - - - - - - - - - - - - - - - - - - - - - - - - ;
                        dg - - - - - - - - - X X X - - - - - - - - - - - - ;
                        dg - - - - - - X X X X X X X - X X - - - - - - - - ;
                        dg - - X - - X X X X X X X X X X - - - - - - - - - ;
                        dg - - - X X X X - - X X X X X - - - - - - - - - - ;
                        dg - - - - X X X - - X X X X - - - - - - - - - - - ;
                        dg - - - - X - - X X X - - X - - - - - - - - - - - ;
                        dg - - - - X - - - - - - X - - - - - - - - - - - - ;
                        dg - - - - - X - - - - X - - - - - - - - - - - - - ;
                        dg - - - - - X - - - - X - - - - - - - - - - - - - ;
                        dg - - - - - - X - - - X - - X - - - - - - - - - - ;
                        dg - - - - - - - X - - - X X X - - - - - - - - - - ;
                        dg - - - - - - - - X X X X X - - - - - - - - - - - ;
                        dg - - - - - - - - - X X X - - - - - - - - - - - - ;
                        dg - - - - - - - - - - - - - - - - - - - - - - - - ;
                        dg - - - - - - - - - - - - - - - - - - - - - - - - ;

                        dg - - - - - - - - - - - - - - - - - - - - - - - - ;
                        dg - - - - - - - - - - - X X X - - - - - - - - - - ;
                        dg - - - - - - - - X X X X X X X - X X - - - - - - ;
                        dg - - - - X - - X X X X X X X X X X - - - - - - - ;
                        dg - - - - - X X X X - - X X X X X - - - - - - - - ;
                        dg - - - - - - X X X - - X X X X - - - - - - - - - ;
                        dg - - - - - - X - - X X X - - X - - - - - - - - - ;
                        dg - - - - - - X - - - - - - X - - - - - - - - - - ;
                        dg - - - - - - - X - - - - X - - - - - - - - - - - ;
                        dg - - - - - - - X - - - - X - - - - - - - - - - - ;
                        dg - - - - - - - - X - - - X - - - - - - - - - - - ;
                        dg - - - - - - - - - X - - - X X X - - - - - - - - ;
                        dg - - - - - - - - - - X X X X X X - - - - - - - - ;
                        dg - - - - - - - - - - - X X X - - - - - - - - - - ;
                        dg - - - - - - - - - - - - - - - - - - - - - - - - ;
                        dg - - - - - - - - - - - - - - - - - - - - - - - - ;

                        dg - - - - - - - - - - - - - - - - - - - - - - - - ;
                        dg - - - - - - - - - - - - - X X X - - - - - - - - ;
                        dg - - - - - - - - - - X X X X X X X - X X - - - - ;
                        dg - - - - - - X - - X X X X X X X X X X - - - - - ;
                        dg - - - - - - X X X X X - - X X X X X - - - - - - ;
                        dg - - - - - - - X X X X - - X X X X - - - - - - - ;
                        dg - - - - - - - - X - - X X X - - X - - - - - - - ;
                        dg - - - - - - - - X - - - - - - X - - - - - - - - ;
                        dg - - - - - - - - - X - - - - X - - - - - - - - - ;
                        dg - - - - - - - - - X - - - - X - - - - - - - - - ;
                        dg - - - - - - - - - - X - - - X - - - - - - - - - ;
                        dg - - - - - - - - - - - X - - - X - - - - - - - - ;
                        dg - - - - - - - - - - - - X X X X X - - - - - - - ;
                        dg - - - - - - - - - - - - - X X X X X - - - - - - ;
                        dg - - - - - - - - - - - - - - - - X X - - - - - - ;
                        dg - - - - - - - - - - - - - - - - - - - - - - - - ;


Bat                     dg X - - - - - - - - - - - - - X - - - - - - - - - ;
                        dg X X - - - - - - - - - - - X X - - - - - - - - - ;
                        dg X X - - - - - - - - - - - X X - - - - - - - - - ;
                        dg - X X - - - - - - - - - X X - - - - - - - - - - ;
                        dg - X X X - - - - - - - X X X - - - - - - - - - - ;
                        dg - - X X X X - - - X X X X - - - - - - - - - - - ;
                        dg - - - X X X X X X X X X - - - - - - - - - - - - ;
                        dg - - - X X - X X X - X X - - - - - - - - - - - - ;
                        dg - - - - X X X X X X X - - - - - - - - - - - - - ;
                        dg - - - - X X X - X X X - - - - - - - - - - - - - ;
                        dg - - - - - X X X X X - - - - - - - - - - - - - - ;
                        dg - - - - - - X X X - - - - - - - - - - - - - - - ;
                        dg - - - - X X - - - X X - - - - - - - - - - - - - ;
                        dg - - - - - X - - - X - - - - - - - - - - - - - - ;
                        dg - - - - - - - - - - - - - - - - - - - - - - - - ;
                        dg - - - - - - - - - - - - - - - - - - - - - - - - ;

                        dg - - X - - - - - - - - - - - - - X - - - - - - - ;
                        dg - - X X - - - - - - - - - - - X X - - - - - - - ;
                        dg - - X X - - - - - - - - - - - X X - - - - - - - ;
                        dg - - - X X - - - - - - - - - X X - - - - - - - - ;
                        dg - - - X X X - - - - - - - X X X - - - - - - - - ;
                        dg - - - - X X X X - - - X X X X - - - - - - - - - ;
                        dg - - - - - X X X X X X X X X - - - - - - - - - - ;
                        dg - - - - - X X - X X X - X X - - - - - - - - - - ;
                        dg - - - - - - X X X X X X X - - - - - - - - - - - ;
                        dg - - - - - - X X X - X X X - - - - - - - - - - - ;
                        dg - - - - - - - X X X X X - - - - - - - - - - - - ;
                        dg - - - - - - - - X X X - - - - - - - - - - - - - ;
                        dg - - - - - - X X - - - X X - - - - - - - - - - - ;
                        dg - - - - - - - X - - - X - - - - - - - - - - - - ;
                        dg - - - - - - - - - - - - - - - - - - - - - - - - ;
                        dg - - - - - - - - - - - - - - - - - - - - - - - - ;

                        dg - - - - - - - - - - - - - - - - - - - - - - - - ;
                        dg - - - - - - - - - - - - - - - - - - - - - - - - ;
                        dg - - - - - - - - - - - - - - - - - - - - - - - - ;
                        dg - - - - - - - - - - - - - - - - - - - - - - - - ;
                        dg - - - - - - - - - - - - - - - - - - - - - - - - ;
                        dg - - - - - - - - X X X - - - X X X - - - - - - - ;
                        dg - - - - - - - - X X X X X X X X X - - - - - - - ;
                        dg - - - - - - - - X X - X X X - X X - - - - - - - ;
                        dg - - - - - - - - - X X X X X X X - - - - - - - - ;
                        dg - - - - - - - - X X X X - X X X X - - - - - - - ;
                        dg - - - - - - - X X - X X X X X - X X - - - - - - ;
                        dg - - - - - - X X X - - X X X - - X X X - - - - - ;
                        dg - - - - - - X X - X X - - - X X - X X - - - - - ;
                        dg - - - - - X X - - - X - - - X - - - X X - - - - ;
                        dg - - - - - X X - - - - - - - - - - - X X - - - - ;
                        dg - - - - - X - - - - - - - - - - - - - X - - - - ;

                        dg - - - - - - - - - - - - - - - - - - - - - - - - ;
                        dg - - - - - - - - - - - - - - - - - - - - - - - - ;
                        dg - - - - - - - - - - - - - - - - - - - - - - - - ;
                        dg - - - - - - - - - - - - - - - - - - - - - - - - ;
                        dg - - - - - - - - - - - - - - - - - - - - - - - - ;
                        dg - - - - - - - - - - X X X - - - X X X - - - - - ;
                        dg - - - - - - - - - - X X X X X X X X X - - - - - ;
                        dg - - - - - - - - - - X X - X X X - X X - - - - - ;
                        dg - - - - - - - - - - - X X X X X X X - - - - - - ;
                        dg - - - - - - - - - - X X X X - X X X X - - - - - ;
                        dg - - - - - - - - - X X - X X X X X - X X - - - - ;
                        dg - - - - - - - - X X X - - X X X - - X X X - - - ;
                        dg - - - - - - - - X X - X X - - - X X - X X - - - ;
                        dg - - - - - - - X X - - - X - - - X - - - X X - - ;
                        dg - - - - - - - X X - - - - - - - - - - - X X - - ;
                        dg - - - - - - - X - - - - - - - - - - - - - X - - ;



Zap_left                dg - - - - - - - - - - - - - - - - - - - - - - - - ;
                        dg - - - - - - - - - - - - - - - - - - - - - - - - ;
                        dg - - - - - - - - - - - - - - - - - - - - - - - - ;
                        dg - - - - X X - - - - - - - - - X - - - - - - - - ;
                        dg - - - X X X X - - - - - - - X - - - - - - - - - ;
                        dg - - X X X X X X - - - - - X - - - - - - - - - - ;
                        dg - X X X - - X X X - - - X - - - - - - - - - - - ;
                        dg X X X - - - - X X X - X - - - - - - - - - - - - ;
                        dg X X - - - - - - X X X - - - - - - - - - - - - - ;
                        dg - - - - - - - - - X X - - - - - - - - - - - - - ;
                        dg - - - - - - - - - - - - - - - - - - - - - - - - ;
                        dg - - - - - - - - - - - - - - - - - - - - - - - - ;
                        dg - - - - - - - - - - - - - - - - - - - - - - - - ;
                        dg - - - - - - - - - - - - - - - - - - - - - - - - ;
                        dg - - - - - - - - - - - - - - - - - - - - - - - - ;
                        dg - - - - - - - - - - - - - - - - - - - - - - - - ;

Zap_right               dg - - - - - - - - - - - - - - - - - - - - - - - - ;
                        dg - - - - - - - - - - - - - - - - - - - - - - - - ;
                        dg - - - - - - - - - - - - - - - - - - - - - - - - ;
                        dg - - - - - - - - - - X - - - - - - - X X - - - - ;
                        dg - - - - - - - - - X X X - - - - - X X X - - - - ;
                        dg - - - - - - - - X - X X X - - - X X X - - - - - ;
                        dg - - - - - - - X - - - X X X - X X X - - - - - - ;
                        dg - - - - - - X - - - - - X X X X X - - - - - - - ;
                        dg - - - - - X - - - - - - - X X X - - - - - - - - ;
                        dg - - - - X - - - - - - - - - X - - - - - - - - - ;
                        dg - - - - - - - - - - - - - - - - - - - - - - - - ;
                        dg - - - - - - - - - - - - - - - - - - - - - - - - ;
                        dg - - - - - - - - - - - - - - - - - - - - - - - - ;
                        dg - - - - - - - - - - - - - - - - - - - - - - - - ;
                        dg - - - - - - - - - - - - - - - - - - - - - - - - ;
                        dg - - - - - - - - - - - - - - - - - - - - - - - - ;

                        dg - - - - - - - - - - - - - - - - - - - - - - - - ;
                        dg - - - - - - - - - - - - - - - - - - - - - - - - ;
                        dg - - - - - - - - - - - - - - - - - - - - - - - - ;
                        dg - - - - X X - - - - - - - X - - - - - - - - - - ;
                        dg - - - - X X X - - - - - X X X - - - - - - - - - ;
                        dg - - - - - X X X - - - X X X - X - - - - - - - - ;
                        dg - - - - - - X X X - X X X - - - X - - - - - - - ;
                        dg - - - - - - - X X X X X - - - - - X - X - - - - ;
                        dg - - - - - - - - X X X - - - - - - - X - - - - - ;
                        dg - - - - - - - - - X - - - - - - - - - - - - - - ;
                        dg - - - - - - - - - - - - - - - - - - - - - - - - ;
                        dg - - - - - - - - - - - - - - - - - - - - - - - - ;
                        dg - - - - - - - - - - - - - - - - - - - - - - - - ;
                        dg - - - - - - - - - - - - - - - - - - - - - - - - ;
                        dg - - - - - - - - - - - - - - - - - - - - - - - - ;
                        dg - - - - - - - - - - - - - - - - - - - - - - - - ;

                        dg - - - - - - - - - - - - - - - - - - - - - - - - ;
                        dg - - - - - - - - - - - - - - - - - - - - - - - - ;
                        dg - - - - - - - - - - - - - - - - - - - - - - - - ;
                        dg - - - - - - - - - - - - - - - - - - X - - - - - ;
                        dg - - - - - - - - - X - - - - - - - X X X - - - - ;
                        dg - - - - - - - - X - X - - - - - X X X X X - - - ;
                        dg - - - - - - - - - - - X - - - X X X - X X X - - ;
                        dg - - - - - - - - - - - - X - X X X - - - X X X - ;
                        dg - - - - - - - - - - - - - X X X - - - - - X X X ;
                        dg - - - - - - - - - - - - - X X - - - - - - - X X ;
                        dg - - - - - - - - - - - - - - - - - - - - - - - - ;
                        dg - - - - - - - - - - - - - - - - - - - - - - - - ;
                        dg - - - - - - - - - - - - - - - - - - - - - - - - ;
                        dg - - - - - - - - - - - - - - - - - - - - - - - - ;
                        dg - - - - - - - - - - - - - - - - - - - - - - - - ;
                        dg - - - - - - - - - - - - - - - - - - - - - - - - ;







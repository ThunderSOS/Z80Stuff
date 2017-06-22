
Patrol_right            ld c, (ix+dX)                   ;
                        ld a, (ix+dSpeed)               ;
                        ld d, (ix+dMaxX)                ;
                        add a, c                        ;
                        ld (ix+dX), a                   ;
                        cp d                            ;
                        ret c                           ;
                        ld hl, Patrol_left              ;
                        ld (ix+dSpriteLogic), hl        ;
                        ld hl, (ix+dSpriteLeft)         ;
                        ld (ix+dSpriteBase), hl         ;
                        ret                             ;

Patrol_left             ld c, (ix+dSpeed)               ;
                        ld a, (ix+dX)                   ;
                        ld d, (ix+dMinX)                ;
                        sub c                        ;
                        ld (ix+dX), a                   ;
                        cp d                            ;
                        ret nc                          ;
                        ld hl, Patrol_right             ;
                        ld (ix+dSpriteLogic), hl        ;
                        ld hl, (ix+dSpriteRight)        ;
                        ld (ix+dSpriteBase), hl         ;
                        ret                             ;

Patrol_down             ld a, (ix+dY)                   ;
                        ld c, (ix+dSpeed)               ;
                        ld d, (ix+dMaxY)                ;
                        add a, c                        ;
                        cp d                            ;
                        ld (ix+dY), a                   ;
                        ret c                           ;
                        ld hl, Patrol_up                ;
                        ld (ix+dSpriteLogic), hl        ;
                        ret                             ;

Patrol_up               ld c, (ix+dSpeed)               ;
                        ld a, (ix+dY)                   ;
                        ld d, (ix+dMinY)                ;
                        sub a, c                        ;
                        cp d                            ;
                        ld (ix+dY), a                   ;
                        ret nc                          ;
                        ld hl, Patrol_down              ;
                        ld (ix+dSpriteLogic), hl        ;
                        ret                             ;

Key_control             exx                             ; save b counter

                        ld bc,zeuskeyaddr("O")          ; ld bc,zeuskeyaddr("QAOP[space]")         ; Get the IO address of the top two rows                 ;
                        in a, (c)                       ; Read those 5 keys
                        and zeuskeymask("O")            ; And with the bit for PlayerLeftKey
                        call z, Player_left             ;

                        ld bc,zeuskeyaddr("P")          ;
                        in a, (c)                       ;
                        and zeuskeymask("P")            ;
                        call z, Player_right            ;

                        ld bc,zeuskeyaddr("Q")          ;
                        in a, (c)                       ;
                        and zeuskeymask("Q")            ;
                        call z, Player_up               ;

                        ld bc,zeuskeyaddr("A")          ;
                        in a, (c)                       ;
                        and zeuskeymask("A")            ;
                        call z, Player_down             ;

                        ; ld bc,zeuskeyaddr(" ")          ;
                        ; in a, (c)                       ;
                        ; and zeuskeymask(" ")            ;
                        ; call z, Add_bat                 ;

                        ld bc,zeuskeyaddr("1")          ;
                        in a, (c)                       ;
                        and zeuskeymask("1")            ;
                        call z, Add_bat                 ;

                        ld bc,zeuskeyaddr("2")          ;
                        in a, (c)                       ;
                        and zeuskeymask("2")            ;
                        call z, Remove_bat              ;
                        exx                             ;  restore b counter
                        ret                             ;

Add_bat                 ld ix, Sprite_data_2            ;
                        bit 6, (ix+dFlags)              ;
                        ret z                           ;
                        ld (ix+dX), 8*2                 ;
                        ld (ix+dY), 17*8+4              ;
                        ld l, (ix+dX)                   ;
                        ld h, (ix+dY)                   ;
                        call To_screen                  ;
                        ld (ix+dCurrentScreen),hl       ;
                        call Calc_sprite_base           ;
                        ld (ix+dCurrentSprite), hl
                        call Draw_sprite                ;
                        res 6, (ix+dFlags)              ;
                        ret                             ;

Remove_bat              ld ix, Sprite_data_2            ;
                        bit 6, (ix+dFlags)              ;
                        ret nz                          ;                         ;
                        call Clear_sprite               ;
                        set 6, (ix+dFlags)              ;
Remove_bat_exit         ret                             ;                            ;

Player_up               call Check_map_up               ;
                        ret nz                          ;
                        ld a, (ix+dY)                   ;
                        ld c, (ix+dSpeed)               ;
                        cp c                            ;
                        ret c                           ;
                        sub c                           ;
                        ld (ix+dY), a                   ;
                        ret                             ;

Player_down             call Check_map_down             ;
                        ret nz                          ;
                        ld a, (ix+dY)                   ;
                        ld c, (ix+dSpeed)               ;
                        cp 176                          ;
                        ret nc                          ;
                        add a, c                        ;
                        ld (ix+dY), a                   ;
                        ret                             ;

Player_left             set 0, (ix+dFlags)              ;
                        ld bc, (ix+dSpriteLeft)         ;
                        ld (ix+dSpriteBase), bc         ;
                        call Check_map_left             ;
                        ret nz                          ;
                        ld a, (ix+dX)                   ;
                        ld c, (ix+dSpeed)               ;
                        cp c                            ;
                        ret c                           ;
                        sub a, c                        ;
                        ld (ix+dX), a                   ;
                        ret                             ;

Player_right            res 0, (ix+dFlags)              ;
                        ld bc, (ix+dSpriteRight)        ;
                        ld (ix+dSpriteBase), bc         ;
                        call Check_map_right            ;
                        ret nz                          ;
                        ld a, (ix+dX)                   ;
                        ld c, (ix+dSpeed)               ;
                        cp 239                          ;
                        ret nc                          ;
                        add a, c                        ;
                        ld (ix+dX), a                   ;
                        ret                             ;

Check_map_up            ld b, (ix+dX)                   ;
                        ld c, (ix+dSpeed)               ;
                        ld a, b                         ;
                        and 7                           ;
                        ld a, (ix+dY)                   ;
                        jr z, Check_map_up_2            ;
                        sub c                           ;
                        ld c, a                         ;
                        call Map_pos                    ;
                        ld c, (hl)                      ;
                        inc hl                          ;
                        ld a, (hl)                      ;
                        or c                            ;
                        ret nz                          ;
                        inc hl                          ;
                        ld c, (hl)                      ;
                        or c                            ;
                        ret                             ;

Check_map_up_2          sub c                           ;
                        ld c, a                         ;
                        call Map_pos                    ;
                        ld c, (hl)                      ;
                        inc hl                          ;
                        ld a, (hl)                      ;
                        or c                            ;
                        ret                             ;

Check_map_down          ld b, (ix+dX)                   ;
                        ld a, b                         ;
                        and 7                           ;
                        ld a, (ix+dY)                   ;
                        jr z, Check_map_down_2          ;
                        add 16                          ;
                        ld c, a                         ;
                        call Map_pos                    ;
                        ld c, (hl)                      ;
                        inc hl                          ;
                        ld a, (hl)                      ;
                        or c                            ;
                        ret nz                          ;
                        ld c, (hl)                      ;
                        inc hl                          ;
                        ld a, (hl)                      ;
                        or c                            ;
                        ret                             ;

Check_map_down_2        add 16                          ;
                        ld c, a                         ;
                        call Map_pos                    ;
                        ld c, (hl)                      ;
                        inc hl                          ;
                        ld a, (hl)                      ;
                        or c                            ;
                        ret                             ;

Check_map_left          ld a, (ix+dY)                   ;
                        ld c, a                         ;
                        and 7                           ;
                        ld b, (ix+dSpeed)               ;
                        ld a, (ix+dX)                   ;
                        jr z, Check_map_left_2          ;
                        sub b                           ;
                        ld b, a                         ;
                        call Map_pos                    ;
                        ld c, (hl)                      ;
                        ld de, 32                       ;
                        add hl, de                      ;
                        ld a, (hl)                      ;
                        or c                            ;
                        ret nz                          ;
                        ld c, (hl)                      ;
                        add hl, de                      ;
                        ld a, (hl)                      ;
                        or c                            ;
                        ret                             ;

Check_map_left_2        sub b                           ;
                        ld b, a                         ;
                        call Map_pos                    ;
                        ld c, (hl)                      ;
                        ld de, 32                       ;
                        add hl, de                      ;
                        ld a, (hl)                      ;
                        or c                            ;
                        ret                             ;

Check_map_right         ld a, (ix+dY)                   ; check can move right from below
                        ld c, a                         ;
                        and 7                           ;
                        ld a, (ix+dX)                   ;
                        jr z, Check_map_right_2         ;
                        add 16                          ;
                        ld b, a                         ;
                        call Map_pos                    ;
                        ld c, (hl)                      ;
                        ld de, 32                       ;
                        add hl, de                      ;
                        ld a, (hl)                      ;
                        or c                            ;
                        ret nz                          ;
                        ld c, (hl)                      ;
                        add hl, de                      ;
                        ld a, (hl)                      ;
                        or c                            ;
                        ret                             ;

Check_map_right_2       add 16                          ;
                        ld b, a                         ;
                        call Map_pos                    ;
                        ld c, (hl)                      ;
                        ld de, 32                       ;
                        add hl, de                      ;
                        ld a, (hl)                      ;
                        or c                            ;
                        ret                             ;

Check_collision         exx                             ;
                        ld hl, (Current_sprite_set)     ;

Collision_loop          ld e, (hl)                      ;
                        inc hl                          ;
                        ld d, (hl)                      ;
                        inc hl                          ;
                        ld a, d                         ; test end of list
                        or e                            ;
                        jr z, Coll_exit                 ;
                        ld ix, de                       ;
                        ld a, (ix+dFlags)               ;
                        bit 7, a                        ; test is to be ignored (player, bullets)
                        jr nz, Collision_loop           ; move on to the next one if so
                        bit 6, a                        ; test is deactivated
                        jr nz, Collision_loop           ; move on to the next one if so
                        ld a, (iy+dX)                   ; else start checking rectangles
                        ld c, (ix+dX)                   ;
                        cp c                            ; is c > a
                        call c, swapac                  ; swap if so
                        sub c                           ;
                        cp 16                           ;
                        jr nc, Coll_cont                ;
                        ld a, (iy+dY)                   ;
                        ld c, (ix+dY)                   ;
                        cp c                            ;
                        call c, swapac                  ;
                        sub c                           ;
                        cp 16                           ;
                        jr nc, Coll_cont                ;
                        push hl                         ; store list position
                        ld hl, Coll_cont-1              ;
                        push hl                         ; push return address onto stack
                        ld hl, (Collision_handler)      ;
                        jp (hl)                         ;
                        pop hl                          ;
Coll_cont               jr Collision_loop               ;
Coll_exit               exx                             ;
                        ret                             ;

swapac                  ld d, a                         ;
                        ld a, c                         ;
                        ld c, d                         ;
                        ret                             ;

Health_handler          ld hl, (Health)                 ;
                        dec hl                          ;
                        ld (Health), hl                 ;
                        ret                             ;




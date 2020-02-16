
zeusmem                 score, "Score", 4, true, false  ;

score                   defw 0, 0                       ;
hiscore                 defw 0, 0                       ;
score_string            defb "Score: ", 0               ;

add_bc_to_score         ld hl, (score+2)                ; last four digits
                        ld a, c                         ;
                        add a, l                        ;
                        daa                             ;
                        ld l, a                         ;
                        ld a, b                         ;
                        adc a, h                        ;
                        daa                             ;
                        ld h, a                         ;
                        ld (score+2), hl                ;
                        ret nc                          ;
                        ld hl, (score)                  ;
                        ld a, l                         ;
                        add a, 1                        ;
                        daa                             ;
                        ld l, a                         ;
                        ld a, h                         ;
                        adc a, 0                        ;
                        ld h, a                         ;
                        ld (score), hl                  ;
                        ret                             ;

compare_score           ld hl, (score)
                        ld de, (hiscore)
                        ld a, d
                        cp h
                        jr c, copy_score
                        ld a, e
                        cp l
                        jr c, copy_score
                        ld hl, (score+2)
                        ld de, (hiscore+2)
                        ld a, d
                        cp h
                        jr c, copy_score
                        ld a, e
                        cp l
                        jr c, copy_score
                        ret

copy_score              ld hl, (score)
                        ld (hiscore), hl
                        ld hl, (score+2)
                        ld (hiscore+2), hl
                        ret

display_score           ld h, 0                         ; enough room for 'Score: 00000000'
                        ld l, 17*8                      ;
                        ld de, score_string             ;
                        call pr_str_dbl_ht              ;
display_score_digits    ld de, (score)                  ;
                        ld a, d                         ;
                        call disp_scr0                  ;
                        ld a, e                         ;
                        call disp_scr0                  ;
                        ld de, (score+2)                ;
                        ld a, d                         ;
                        call disp_scr0                  ;
                        ld a, e                         ;
                        call disp_scr0                  ;
                        ret                             ;

disp_scr0               push af                         ;
                        and $f0                         ;
                        rra                             ;
                        rra                             ;
                        rra                             ;
                        rra                             ;
                        add '0'                         ;
                        push de                         ;
                        call pr_char_dbl_ht             ;
                        pop de                          ;
                        pop af                          ;
                        and $0f                         ;
                        add a, '0'                      ;
                        push de                         ;
                        call pr_char_dbl_ht             ;
                        pop de                          ;
                        ret                             ;

score_test              ld hl, $9000                    ;
                        ld (score+2), hl                ;
                        ld hl, 0                        ;
                        ld (score), hl                  ;
                        ld bc, $1000                    ;
                        call add_bc_to_score            ;
                        ld bc, $0250                    ;
                        call add_bc_to_score            ;
                        ld bc, $0700                    ;
                        call add_bc_to_score            ;
                        ld bc, $2000                    ;
                        call add_bc_to_score            ;
                        call display_score              ;
                        call compare_score
                        ret                             ;


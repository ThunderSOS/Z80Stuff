
pitch_bend              ld hl,500                       ; starting pitch.
                        ld b,250                        ; length of pitch bend.
pitch_loop              push bc                         ;
                        push hl                         ; store pitch.
                        ld de,1                         ; very short duration.
                        call 949                        ; ROM beeper routine.
                        pop hl                          ; restore pitch.
                        inc hl                          ; pitch going up.
                        pop bc                          ;
                        djnz pitch_loop                 ; repeat.
                        ret                             ;

noise                   ld e,250                        ; repeat 250 times.
noise2                  push de                         ;
                        ld b,17                         ; length of step.
noise0                  push bc                         ;
                        call get_random_8               ;
                        and 248                         ; we want a black border. and 248 (+1=blue, +2=red, etc)
                        out (254),a                     ; write to speaker.
                        ld a,e                          ; as e gets smaller...
                        cpl                             ; ...we increase the delay.
noise1                  dec a                           ; decrement loop counter.
                        jr nz,noise1                    ; delay loop.
                        pop bc                          ;
                        djnz noise0                     ; next step.
                        pop de                          ;
                        ld a,e                          ;
                        sub 24                          ; size of step.
                        cp 30                           ; end of range.
                        ret z                           ;
                        ret c                           ;
                        ld e,a                          ;
                        cpl                             ;
noise3                  ld b,40                         ; silent period.
noise4                  djnz noise4                     ;
                        dec a                           ;
                        jr nz,noise3                    ;
                        jr noise2                       ;

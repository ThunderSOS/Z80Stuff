

get_random_8            ld hl,(seed)                    ; Pointer
                        ld a, r                         ;
                        xor h;                          ;
                        ld a,h                          ;
                        and 31                          ; keep it within first 8k of ROM.
                        ld h,a                          ;
                        ld a,(hl)                       ; Get "random" number from location.
                        inc hl                          ; Increment pointer.
                        ld (seed),hl                    ;
                        ret                             ;

seed                    defw 0                          ;


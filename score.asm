
shwnum                  ld a,48                         ; (or 32)     ; leading zeroes (or spaces).
                        ld de,10000                     ; ten thousands column.
                        call shwdg                      ; show digit.
                        ld de,1000                      ; thousands column.
                        call shwdg                      ; show digit.
                        ld de,100                       ; hundreds column.
                        call shwdg                      ; show digit.
                        ld de,10                        ; tens column.
                        call shwdg                      ; show digit.
                        or 16                           ; last digit is always shown.
                        ld de,1                         ; units column.
shwdg                   and 48                          ; clear carry, clear digit.
shwdg1                  sbc hl,de                       ; subtract from column.
                        jr c,shwdg0                     ; nothing to show.
                        or 16                           ; something to show, make it a digit.
                        inc a                           ; increment digit.
                        jr shwdg1                       ; repeat until column is zero.
shwdg0                  add hl,de                       ; restore total.
                        push af                         ;
                        rst 16                          ; show character.
                        pop af                          ;
                        ret                             ;

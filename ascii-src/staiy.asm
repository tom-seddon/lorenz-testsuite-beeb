         .include "../common.s65"
*=code_addr

         .init "staiy",%00011011,%11000110,%10110001,%01101100,0
         lda #0
         sta ab
         sta yb
         lda #<da
         sta 172
         lda #>da
         sta 173

next     lda db
         sta da

         lda ab
         sta ar
         sta dr

         lda xb
         sta xr

         lda yb
         sta yr

         lda pb
         ora #%00110000
         sta pr

         lda sb
         sta sr

         ldx sb
         txs
         lda pb
         pha
         lda ab
         ldx xb
         ldy yb
         plp

cmd      sta (172),y

         php
         cld
         sta aa
         stx xa
         sty ya
         pla
         sta pa
         tsx
         stx sa
         jsr check

         inc 172
         bne noinc
         inc 173
noinc    lda yb
         bne nodec
         dec 173
nodec    dec yb

         inc ab
jmpnext  bne next
         inc pb
         bne jmpnext

         jsr print
         .text " - ok"
         .byte 13,0
         lda 2
         beq load
wait     jsr $ffe4
         beq wait
         jmp $8000

load     jsr print
name     .text "ldxb"
namelen  = *-name
         .byte 0
         lda #0
         sta $0a
         sta $b9
         lda #namelen
         sta $b7
         lda #<name
         sta $bb
         lda #>name
         sta $bc
         pla
         pla
         jmp $e16f

         .include "../common_suffix.s65"
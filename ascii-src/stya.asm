         .include "../common.s65"
*=code_addr

         .init "stya",%00011011,%11000110,%10110001,%01101100,0
         lda #0
         sta yb

next     lda db

         lda ab
         sta ar

         lda xb
         sta xr

         lda yb
         sta yr
         sta dr

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

cmd      sty da

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

         inc yb
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
name     .text "taxn"
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
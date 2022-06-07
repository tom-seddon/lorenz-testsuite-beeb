         .include "../common.s65"
*=code_addr

         .init "txsn",%00011011,%11000110,%10110001,%01101100,0
         .save_stack

         lda #0
         sta xb

next     lda db
         sta dr
         sta da

         lda ab
         sta ar

         lda xb
         sta xr
         sta sr

         lda yb
         sta yr

         lda pb
         ora #%00110000
         sta pr

         ldx sb
         txs
         lda pb
         pha
         lda ab
         ldx xb
         ldy yb
         plp

cmd      txs

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

         inc xb
jmpnext  bne next
         inc pb
         bne jmpnext

saves    ldx #0
         txs
         ldx #0
s1       lda $1000,x
         sta $0100,x
         inx
         bne s1

         jsr print
         .text " - ok"
         .byte 13,0
         lda 2
         beq load
wait     jsr $ffe4
         beq wait
         jmp $8000

load     jsr print
name     .text "phan"
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
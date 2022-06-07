         .include "../common.s65"
*=code_addr

         .init "ldxz",%00011011,%11000110,%10110001,%01101100,0
         lda #0
         sta db

next     lda db
         sta 172
         sta dr
         sta xr

         lda ab
         sta ar

         lda yb
         sta yr

         lda pb
         ora #%00110000
         and #%01111101
         tax
         lda dr
         cmp #0
         bne nozero
         txa
         ora #%00000010
         tax
         lda dr
nozero   asl a
         bcc noneg
         txa
         ora #%10000000
         tax
noneg    stx pr

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

cmd      ldx 172

         php
         cld
         sta aa
         stx xa
         sty ya
         pla
         sta pa
         tsx
         stx sa
         lda 172
         sta da
         jsr check

         inc db
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
name     .text "ldxzy"
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
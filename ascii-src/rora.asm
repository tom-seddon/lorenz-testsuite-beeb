         .include "../common.s65"
*=code_addr

         .init "rora",%00011011,%11000110,%10110001,%01101100,0
         lda #0
         sta db

next     lda db
         sta da
         lsr a
         sta dr
         lda pb
         and #1
         beq noc
         lda dr
         ora #128
         sta dr
noc
         lda ab
         sta ar

         lda xb
         sta xr

         lda yb
         sta yr

         lda pb
         ora #%00110000
         and #%01111100
         tax
         lda dr
         cmp #0
         bne nozero
         txa
         ora #%00000010
         tax
nozero   lda dr
         bpl noneg
         txa
         ora #%10000000
         tax
noneg    lda db
         and #1
         beq nocarry
         txa
         ora #%00000001
         tax
nocarry  stx pr

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

cmd      ror da

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

         inc db
         bne jmpnext
         inc pb
         beq nonext
jmpnext  jmp next
nonext

         jsr print
         .text " - ok"
         .byte 13,0
         lda 2
         beq load
wait     jsr $ffe4
         beq wait
         jmp $8000

load     jsr print
name     .text "rorax"
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
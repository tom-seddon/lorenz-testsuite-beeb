         .include "../common.s65"
*=code_addr

         .init "arrb",%00011011,%11000110,%10110001,%01101100,0
         lda #0
         sta db
         sta ab

next     lda db
         sta da
         sta dr
         sta cmd+1

         lda #%00001000
         bit pb
         bne decimal

         lda pb
         lsr a
         lda ab
         and db
         ror a
         sta ar

         lda pb
         ora #%00110000
         and #%00111100
         ldx ar
         bne nozero
         ora #%00000010
nozero
         ldx ar
         bpl nominus
         ora #%10000000
nominus
         tax
         lda ar
         and #%01000000
         beq nocarry
         inx
nocarry
         lda ar
         and #%01100000
         beq noover
         cmp #%01100000
         beq noover
         txa
         ora #%01000000
         tax
noover
         stx pr
         jmp nodecimal

decimal
         lda pb
         lsr a
         lda ab
         and db
         sta aa
         ror a
         sta ar

         lda pb
         ora #%00110000
         and #%00111100
         ldx ar
         bne dnozero
         ora #%00000010
dnozero
         ldx ar
         bpl dnominus
         ora #%10000000
dnominus
         tax
         lda ar
         eor aa
         and #%01000000
         beq dnoover
         txa
         ora #%01000000
         tax
dnoover
         lda aa
         and #$0f
         cmp #$05
         bcc noadjustlow
         lda ar
         and #$f0
         sta andlow+1
         lda ar
         clc
         adc #$06
         and #$0f
andlow   ora #$11
         sta ar
noadjustlow
         lda aa
         and #$f0
         cmp #$50
         bcc noadjusthigh
         inx
         lda ar
         clc
         adc #$60
         sta ar
noadjusthigh
         stx pr

nodecimal
         lda xb
         sta xr

         lda yb
         sta yr

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

cmd      .byte $6b
         .byte 0

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

         clc
         lda db
         adc #17
         sta db
         bcc jmpnext
         lda #0
         sta db
         clc
         lda ab
         adc #17
         sta ab
         bcc jmpnext
         lda #0
         sta ab
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
name     .text "aneb"
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
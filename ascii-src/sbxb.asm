         .include "../common.s65"
*=code_addr

         .init "sbxb",%00011011,%11000110,%10110001,%01101100,0
         lda #0
         sta db
         sta xb

next     lda db
         sta da
         sta dr
         sta cmd+1

         lda ab
         sta ar

         and xb
         sec
         sbc db
         php
         sta xr

         lda yb
         sta yr

         lda pb
         ora #%00110000
         and #%01111100
         ldx xr
         bne nozero
         ora #%00000010
nozero
         ldx xr
         bpl nominus
         ora #%10000000
nominus
         tax
         pla
         and #%00000001
         beq nocarry
         inx
nocarry
         stx pr

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

cmd      .byte $cb
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

         inc ab
         clc
         lda db
         adc #17
         sta db
         bcc jmpnext
         lda #0
         sta db
         clc
         lda xb
         adc #17
         sta xb
         bcc jmpnext
         lda #0
         sta xb
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
name     .text "shaay"
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
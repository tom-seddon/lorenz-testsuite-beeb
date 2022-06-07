         .include "../common.s65"
*=code_addr

         .init "aneb",%00011011,%11000110,%10110001,%01101100,0
         lda #0
         sta db
         sta xb

next     lda db
         sta da
         sta dr
         sta cmd+1

         lda ab
         ora #$ee
         and xb
         and db
         sta ar

         lda xb
         sta xr

         lda yb
         sta yr

         lda pb
         ora #%00110000
         and #%01111101
         ldx ar
         bne nozero
         ora #%00000010
nozero
         ldx ar
         bpl nominus
         ora #%10000000
nominus
         sta pr

         lda sb
         sta sr

waitborder
         lda $d011
         bmi border
         lda $d012
         cmp #40
         bcs waitborder
border

         ldx sb
         txs
         lda pb
         pha
         lda ab
         ldx xb
         ldy yb
         plp

cmd      .byte $8b
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
name     .text "lxab"
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
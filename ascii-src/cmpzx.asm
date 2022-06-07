         .include "../common.s65"
*=code_addr

         .init "cmpzx",%00011011,%11000110,%10110001,%01101100,0
         lda #0
         sta db
         sta ab
         sta xb

next     lda db
         sta 172
         sta dr

         lda ab
         sta ar
         sec
         sbc db
         php
         pla
         and #%10000011
         sta flags+1
         lda pb
         ora #%00110000
         and #%01111100
flags    ora #0
         sta pr

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

cmd      cmp 172,x

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

         inc cmd+1
         dec xb

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
name     .text "cmpa"
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
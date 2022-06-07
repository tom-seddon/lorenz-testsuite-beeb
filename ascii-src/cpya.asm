         .include "../common.s65"
*=code_addr

         .init "cpya",%00011011,%11000110,%10110001,%01101100,0
         lda #0
         sta db
         sta yb

next     lda db
         sta da
         sta dr

         lda yb
         sta yr
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

         lda ab
         sta ar

         lda xb
         sta xr

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

cmd      cpy da

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
         lda yb
         adc #17
         sta yb
         bcc jmpnext
         lda #0
         sta yb
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
name     .text "bitz"
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
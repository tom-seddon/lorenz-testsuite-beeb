         .include "../common.s65"
*=code_addr

         .init "alrb",%00011011,%11000110,%10110001,%01101100,0
         lda #0
         sta db
         sta ab

next     lda db
         sta da
         sta dr
         sta cmd+1

         lda pb
         pha
         plp

         lda ab
         and db
         lsr a
         sta ar

         php
         pla
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

cmd      .byte $4b
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
name     .text "arrb"
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
         .include "../common.s65"
*=code_addr

         .init "insix",%00011011,%11000110,%10110001,%01101100,0
         lda #0
         sta db
         sta xb
         lda #<da
         sta 172
         lda #>da
         sta 173

next
         lda db
         sta da
         sta dr
         inc dr

         lda pb
         pha
         plp
         lda ab
         sbc dr
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

cmd      .byte $e3
         .byte 172

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

         inc cmd+1
         dec xb

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
name     .text "insiy"
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
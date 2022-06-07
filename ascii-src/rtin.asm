         .include "../common.s65"
*=code_addr

         .init "rtin",%00011011,%11000110,%10110001,%01101100,0
         tsx
         .save_stack

         lda #0
         sta db

next     lda db
         sta da
         sta dr

         lda ab
         sta ar

         lda xb
         sta xr

         lda yb
         sta yr

         lda pb
         ora #%00110000
         sta pr

         lda sb
         clc
         adc #3
         sta sr

         ldx sb
         txs
         lda pb
         inx
         sta $0100,x
         lda #<cont
         inx
         sta $0100,x
         lda #>cont
         inx
         sta $0100,x
         lda db
         pha
         lda ab
         ldx xb
         ldy yb
         plp

cmd      rti

cont     php
         cld
         sta aa
         stx xa
         sty ya
         pla
         sta pa
         tsx
         stx sa
         jsr check

         inc sb
         inc db
         bne jmpnext
         inc pb
         beq nonext
jmpnext  jmp next
nonext

saves    ldx #0
         txs
         .restore_stack

         jsr print
         .text " - ok"
         .byte 13,0
         lda 2
         beq load
wt       jsr $ffe4
         beq wt
         jmp $8000

load     jsr print
name     .text "jsrw"
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

do_restore_stack=true
         .include "../common_suffix.s65"

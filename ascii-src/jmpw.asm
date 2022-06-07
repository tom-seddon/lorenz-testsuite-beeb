         .include "../common.s65"
*=code_addr

         .init "jmpw",%00011011,%11000110,%10110001,%01101100,0
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
         sta sr

         ldx cmd+1
         lda #$4c
         sta $1100,x
         lda #<cont
         sta $1101,x
         lda #>cont
         sta $1102,x

         ldx sb
         txs
         lda pb
         pha
         lda ab
         ldx xb
         ldy yb
         plp

cmd      jmp $1100

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

         inc cmd+1
         inc pb
         beq nonext
jmpnext  jmp next
nonext

         jsr print
         .text " - ok"
         .byte 13,0
         lda 2
         beq load
wt       jsr $ffe4
         beq wt
         jmp $8000

load     jsr print
name     .text "jmpi"
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
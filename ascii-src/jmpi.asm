         .include "../common.s65"
*=code_addr

         .init "jmpi",%00011011,%11000110,%10110001,%01101100,0
         lda #$13
         sta $1200
         ldx #<cont
         lda #$4c
         sta $1300,x
         lda #<perr
         sta $1301,x
         lda #>perr
         sta $1302,x
         jmp next

perr     cld
         jsr print
         .byte 13
         .text "page is incremented"
         .byte 13,0
         jsr check.wait
         jmp weiter

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
         lda #<cont
         sta $1100,x
         lda #>cont
         inx
         sta $1100,x

         ldx sb
         txs
         lda pb
         pha
         lda ab
         ldx xb
         ldy yb
         plp

cmd      jmp ($1100)

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

weiter   inc cmd+1
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
name     .text "beqr"
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
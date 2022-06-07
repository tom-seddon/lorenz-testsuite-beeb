         .include "../common.s65"
*=code_addr

         .init "jsrw",%00011011,%11000110,%10110001,%01101100,0
         tsx
         .save_stack

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
         sec
         sbc #2
         sta sr

         ldx cmd+1
         lda #$20
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

         tsx
         clc
         lda cmd+1
         ldy cmd+2
         adc #2
         bcc noinc
         iny
noinc    inx
         cmp $0100,x
         bne ste
         inx
         tya
         cmp $0100,x
         beq stok
ste      jsr print
         .byte 13
         .text "wrong data on stack"
         .byte 13,0
         jsr check.wait
stok

         inc cmd+1
         dec sb
         inc pb
         beq nonext
jmpnext  jmp next
nonext

saves    ldx #0
         txs
         ldx #0
restore  lda $1000,x
         sta $0100,x
         inx
         bne restore

         jsr print
         .text " - ok"
         .byte 13,0
         lda 2
         beq load
wt       jsr $ffe4
         beq wt
         jmp $8000

load     jsr print
name     .text "rtsn"
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

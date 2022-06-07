         .include "../common.s65"
*=code_addr

         .init "brkn",%00011011,%11000110,%10110001,%01101100,0
         tsx
         .save_stack

         lda #0
fill     sta $1100,x
         inx
         bne fill

         lda #<break
         sta $fffe
         lda #>break
         sta $ffff

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
         ora #%00110100
         sta pr

         lda sb
         sec
         sbc #3
         sta sr

         lda #127
         sta $dc0d
         lda $dc0d
         lda #$30
         sta 1

         ldx sb
         txs
         lda pb
         pha
         lda ab
         ldx xb
         ldy yb
         plp

cmd      jmp $1100

break    php
         cld
         sta aa
         stx xa
         sty ya
         pla
         sta pa
         tsx
         stx sa

         lda #$37
         sta 1
         lda #129
         sta $dc0d

         jsr check

         tsx
         lda pb
         ora #%00110000
         inx
         cmp $0100,x
         bne ste
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
         jsr wait
stok

         inc cmd+1
         dec sb
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
name     .text "rtin"
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
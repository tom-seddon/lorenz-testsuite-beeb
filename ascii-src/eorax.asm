         .include "../common.s65"
*=code_addr

         .init "eorax",%00011011,%11000110,%10110001,%01101100,0
         lda #0
         sta db
         sta ab
         sta xb

next     lda db
         sta da
         sta dr
         sta cmd0+1
         eor #$ff
         sta cmd1+1

         lda ab
         eor #$ff
cmd0     and #0
         sta cmd2+1
         lda ab
cmd1     and #0
cmd2     ora #0
         sta ar

         lda xb
         sta xr

         lda yb
         sta yr

         lda pb
         ora #%00110000
         and #%01111101
         tax
         lda ar
         cmp #0
         bne nozero
         txa
         ora #%00000010
         tax
nozero   lda ar
         bpl noneg
         txa
         ora #%10000000
         tax
noneg    stx pr

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

cmd      eor da,x

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
         bne noinc
         inc cmd+2
noinc    lda xb
         bne nodec
         dec cmd+2
nodec    dec xb

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
name     .text "eoray"
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
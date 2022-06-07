         .include "../common.s65"
*=code_addr

         .init "shaiy",%00011011,%11000110,%10110001,%01101100,0
mem      = $1eff
         lda #0
         sta ab
         sta xb
         sta yb
         lda #<mem
         sta 174
         lda #>mem
         sta 175

next
         lda db
         sta mem

         lda ab
         sta ar

         lda 175
         clc
         adc #1
         and ab
         and xb
         sta dr

         lda xb
         sta xr

         lda yb
         sta yr

         lda pb
         ora #%00110000
         sta pr

         lda sb
         sta sr

waitborder
         lda $d011
         bmi isborder
         lda $d012
         cmp #30
         bcs waitborder
isborder

         ldx sb
         txs
         lda pb
         pha
         lda ab
         ldx xb
         ldy yb
         plp

cmd      .byte $93
         .byte 174

         php
         cld
         sta aa
         stx xa
         sty ya
         pla
         sta pa
         tsx
         stx sa
         lda mem
         sta da
         jsr check

         inc 174
         bne noinc
         inc 175
noinc    lda yb
         bne nodec
         dec 175
nodec    dec yb

         clc
         lda xb
         adc #17
         sta xb
         bcc jmpnext
         lda #0
         sta xb
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
name     .text "shxay"
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
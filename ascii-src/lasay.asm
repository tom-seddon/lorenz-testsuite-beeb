         .include "../common.s65"
*=code_addr

         .init "lasay",%00011011,%11000110,%10110001,%01101100,0
         .save_stack

         lda #0
         sta sb
         sta db
         sta yb

next     lda db
         sta da
         sta dr
         and sb
         sta ar
         sta xr
         sta sr

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

cmd      .byte $bb
         .word da

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
noinc    lda yb
         bne nodec
         dec cmd+2
nodec    dec yb

         clc
         lda db
         adc #17
         sta db
         bcc jmpnext
         lda #0
         sta db
         clc
         lda sb
         adc #17
         sta sb
         bcc jmpnext
         lda #0
         sta sb
         inc pb
         beq nonext
jmpnext  jmp next
nonext

saves    ldx #$11
         txs
         ldx #0
s1       lda $1000,x
         sta $0100,x
         inx
         bne s1

         jsr print
         .text " - ok"
         .byte 13,0
         lda 2
         beq load
wait     jsr $ffe4
         beq wait
         jmp $8000

load     jsr print
name     .text "sbcb(eb)"
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

do_check_p_result=false
         .include "../common_suffix.s65"

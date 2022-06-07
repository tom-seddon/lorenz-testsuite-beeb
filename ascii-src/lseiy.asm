         .include "../common.s65"
*=code_addr

         .init "lseiy",%00011011,%11000110,%10110001,%01101100,0
         lda #0
         sta db
         sta yb
         lda #<da
         sta 172
         lda #>da
         sta 173

next     lda db
         sta da
         lsr a
         sta dr

         eor ab
         sta ar

         lda xb
         sta xr

         lda yb
         sta yr

         lda pb
         ora #%00110000
         and #%01111100
         tax
         lda ar
         cmp #0
         bne nozero
         txa
         ora #%00000010
         tax
         lda ar
nozero   asl a
         bcc noneg
         txa
         ora #%10000000
         tax
noneg    lda db
         and #1
         beq nocarry
         txa
         ora #%00000001
         tax
nocarry  stx pr

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

cmd      .byte $53
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

         inc 172
         bne noinc
         inc 173
noinc    lda yb
         bne nodec
         dec 173
nodec    dec yb

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
name     .text "rraz"
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
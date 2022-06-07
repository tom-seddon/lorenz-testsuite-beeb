         .include "../common.s65"
*=code_addr

         .init "dcmay",%00011011,%11000110,%10110001,%01101100,0
         lda #0
         sta db
         sta yb

next
         lda db
         sta da
         sta dr
         dec dr

         lda pb
         pha
         plp
         lda ab
         cmp dr
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

cmd      .byte $db
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
name     .text "dcmix"
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
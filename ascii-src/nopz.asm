         .include "../common.s65"
*=code_addr

         .init "nopz",%00011011,%11000110,%10110001,%01101100,0
         lda #0
         sta count

next
         ldx count
         lda opcodes,x
         bne another
         jmp nonext
another
         sta cmd
         sta db
         sta dr
         sta 172

         lda ab
         sta aa
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

         ldx sb
         txs
         lda pb
         pha
         lda ab
         ldx xb
         ldy yb
         plp

cmd      nop
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
         lda 172
         sta da
         jsr check

         inc pb
         bne jmpnext
         inc count
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

count    .byte 0
opcodes  .byte $04,$44,$64,0

load     jsr print
name     .text "nopzx"
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
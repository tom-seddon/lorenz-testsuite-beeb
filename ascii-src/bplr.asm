         .include "../common.s65"
*=code_addr

         .init "bplr",%00011011,%11000110,%10110001,%01101100,%00000000
         lda #0
         sta db

         lda #<break
         sta $0316
         lda #>break
         sta $0317

         ldx #0
         txa
fill     sta $1082,x
         sta $1182,x
         inx
         bne fill

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

         ldx cmd+1
         lda branch
         sta $1100,x
         lda db
         sta $1101,x

         ldx sb
         stx sr
         txs
         lda pb
         pha
         lda ab
         ldx xb
         ldy yb
         plp

cmd      jmp $1100

break    pla
         sta ya
         pla
         sta xa
         pla
         sta aa
         pla
         sta pa
         pla
         sta al+1
         pla
         sta ah+1
         tsx
         stx sa

         clc
         lda cmd+1
         ldy cmd+2
         adc #4
         bcc noinc
         iny
noinc    bit db
         bpl pos
         dey
pos      clc
         adc db
         bcc al
         iny
al       cmp #0
         bne err
ah       cpy #0
         beq noerr
err      jsr print
         .byte 13
         .text "wrong jump address"
         .byte 13,0
         jsr check.wait
noerr    jsr check

         inc db
         lda db
         cmp #$fe
         bne jmpnext
         lda #0
         sta db
         ldx cmd+1
         sta $1100,x
         inc cmd+1
         beq nonext
jmpnext  jmp next
nonext
         lda #$80
branch   bpl berr

ookk     jsr print
         .text " - ok"
         .byte 13,0
         lda 2
         beq load
wt       jsr $ffe4
         beq wt
         jmp $8000

berr     jsr print
         .byte 13
         .text "no jump expected"
         .byte 13,0
         jsr check.wait
         jmp ookk

load     jsr print
name     .text "bcsr"
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
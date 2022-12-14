         .include "../common.s65"
*=code_addr

         .init "adcax",%00011011,%11000110,%10110001,%01101100,0
         lda #0
         sta db
         sta ab
         sta xb

next     lda pb
         and #%00001000
         bne decmode
         lda db
         sta da
         sta dr
         sta cmd0+1
         and #$7f
         sta cmd1+1
         clc
         lda pb
         and #1
         beq noc
         sec
noc      php
         lda ab
cmd0     adc #0
         sta ar
         lda pb
         ora #%00110000
         and #%00111100
         bcc noc1
         ora #1
noc1     tax
         lda ab
         and #$7f
         plp
cmd1     adc #0
         bmi neg
         txa
         and #1
         beq cont
set      txa
         ora #%01000000
         tax
         jmp cont
neg      txa
         and #1
         beq set
cont     lda ar
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
         jmp deccont

decmode
         .block
         lda db
         sta da
         sta dr
         and #$0f
         sta l0+1
         lda pb
         ora #%00110000
         and #%00111100
         tax
         lda pb
         lsr a
         lda ab
         and #$0f
l0       adc #0
         ldy #$00
         cmp #$0a
         bcc l1
         sec
         sbc #$0a
         and #$0f
         ldy #$08
l1       sta ar
         sty l2+1
         sty l3+1
         lda db
         and #$f0
         ora l3+1
         sta l3+1
         lda ab
         and #$f0
l2       ora #0
         clc
l3       adc #0
         php
         bcs l4
         cmp #$a0
         bcc l5
l4       sec
         sbc #$a0
         inx
l5       ora ar
         sta ar
         plp
         bvc nov
         php
         txa
         ora #%01000000
         tax
         plp
nov      bpl non
         txa
         ora #%10000000
         tax
non      lda pb
         lsr a
         lda ab
         adc db
         bne noz
         txa
         ora #%00000010
         tax
noz      stx pr
         .bend

deccont  lda xb
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

cmd      adc da,x

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
name     .text "adcay"
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
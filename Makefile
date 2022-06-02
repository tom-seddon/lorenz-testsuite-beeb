PYTHON3:=python3
TASS:=64tass
SHELLCMD:=$(PYTHON3) submodules/shellcmd.py/shellcmd.py
BEEB_BIN:=beeb/z
BUILD:=.build


.PHONY:all
all:
	$(SHELLCMD) mkdir $(BEEB_BIN)
	$(SHELLCMD) mkdir $(BUILD)

	$(MAKE) -j16 _everything

.PHONY:_everything
_everything:
_everything:_adca
_everything:_adcax
_everything:_adcay
_everything:_adcb
_everything:_adcix
_everything:_adciy
_everything:_adcz
_everything:_adczx
_everything:_alrb
_everything:_ancb
_everything:_anda
_everything:_andax
_everything:_anday
_everything:_andb
_everything:_andix
_everything:_andiy
_everything:_andz
_everything:_andzx
_everything:_aneb
_everything:_arrb
_everything:_asla
_everything:_aslax
_everything:_asln
_everything:_aslz
_everything:_aslzx
_everything:_asoa
_everything:_asoax
_everything:_asoay
_everything:_asoix
_everything:_asoiy
_everything:_asoz
_everything:_asozx
_everything:_axsa
_everything:_axsix
_everything:_axsz
_everything:_axszy
_everything:_bccr
_everything:_bcsr
_everything:_beqr
_everything:_bita
_everything:_bitz
_everything:_bmir
_everything:_bner
_everything:_bplr
_everything:_brkn
_everything:_bvcr
_everything:_bvsr
_everything:_clcn
_everything:_cldn
_everything:_clin
_everything:_clvn
_everything:_cmpa
_everything:_cmpax
_everything:_cmpay
_everything:_cmpb
_everything:_cmpix
_everything:_cmpiy
_everything:_cmpz
_everything:_cmpzx
_everything:_cpxa
_everything:_cpxb
_everything:_cpxz
_everything:_cpya
_everything:_cpyb
_everything:_cpyz
_everything:_dcma
_everything:_dcmax
_everything:_dcmay
_everything:_dcmix
_everything:_dcmiy
_everything:_dcmz
_everything:_dcmzx
_everything:_deca
_everything:_decax
_everything:_decz
_everything:_deczx
_everything:_dexn
_everything:_deyn
_everything:_eora
_everything:_eorax
_everything:_eoray
_everything:_eorb
_everything:_eorix
_everything:_eoriy
_everything:_eorz
_everything:_eorzx
_everything:_inca
_everything:_incax
_everything:_incz
_everything:_inczx
_everything:_insa
_everything:_insax
_everything:_insay
_everything:_insix
_everything:_insiy
_everything:_insz
_everything:_inszx
_everything:_inxn
_everything:_inyn
_everything:_jmpi
_everything:_jmpw
_everything:_jsrw
_everything:_lasay
_everything:_laxa
_everything:_laxay
_everything:_laxix
_everything:_laxiy
_everything:_laxz
_everything:_laxzy
_everything:_ldaa
_everything:_ldaax
_everything:_ldaay
_everything:_ldab
_everything:_ldaix
_everything:_ldaiy
_everything:_ldaz
_everything:_ldazx
_everything:_ldxa
_everything:_ldxay
_everything:_ldxb
_everything:_ldxz
_everything:_ldxzy
_everything:_ldya
_everything:_ldyax
_everything:_ldyb
_everything:_ldyz
_everything:_ldyzx
_everything:_lsea
_everything:_lseax
_everything:_lseay
_everything:_lseix
_everything:_lseiy
_everything:_lsez
_everything:_lsezx
_everything:_lsra
_everything:_lsrax
_everything:_lsrn
_everything:_lsrz
_everything:_lsrzx
_everything:_lxab
_everything:_nopa
_everything:_nopax
_everything:_nopb
_everything:_nopn
_everything:_nopz
_everything:_nopzx
_everything:_oraa
_everything:_oraax
_everything:_oraay
_everything:_orab
_everything:_oraix
_everything:_oraiy
_everything:_oraz
_everything:_orazx
_everything:_phan
_everything:_phpn
_everything:_plan
_everything:_plpn
_everything:_rlaa
_everything:_rlaax
_everything:_rlaay
_everything:_rlaix
_everything:_rlaiy
_everything:_rlaz
_everything:_rlazx
_everything:_rola
_everything:_rolax
_everything:_roln
_everything:_rolz
_everything:_rolzx
_everything:_rora
_everything:_rorax
_everything:_rorn
_everything:_rorz
_everything:_rorzx
_everything:_rraa
_everything:_rraax
_everything:_rraay
_everything:_rraix
_everything:_rraiy
_everything:_rraz
_everything:_rrazx
_everything:_rtin
_everything:_rtsn
_everything:_sbca
_everything:_sbcax
_everything:_sbcay
_everything:sbc(eb)
_everything:_sbcb
_everything:_sbcix
_everything:_sbciy
_everything:_sbcz
_everything:_sbczx
_everything:_sbxb
_everything:_secn
_everything:_sedn
_everything:_sein
_everything:_shaay
_everything:_shaiy
_everything:_shsay
_everything:_shxay
_everything:_shyax
_everything:_staa
_everything:_staax
_everything:_staay
_everything:_staix
_everything:_staiy
_everything:_start
_everything:_staz
_everything:_stazx
_everything:_stxa
_everything:_stxz
_everything:_stxzy
_everything:_stya
_everything:_styz
_everything:_styzx
_everything:_taxn
_everything:_tayn
_everything:_tsxn
_everything:_txan
_everything:_txsn
_everything:_tyan

.PHONY:_adca
_adca:
	@$(MAKE) _asm "STEM=adca"

.PHONY:_adcax
_adcax:
	@$(MAKE) _asm "STEM=adcax"

.PHONY:_adcay
_adcay:
	@$(MAKE) _asm "STEM=adcay"

.PHONY:_adcb
_adcb:
	@$(MAKE) _asm "STEM=adcb"

.PHONY:_adcix
_adcix:
	@$(MAKE) _asm "STEM=adcix"

.PHONY:_adciy
_adciy:
	@$(MAKE) _asm "STEM=adciy"

.PHONY:_adcz
_adcz:
	@$(MAKE) _asm "STEM=adcz"

.PHONY:_adczx
_adczx:
	@$(MAKE) _asm "STEM=adczx"

.PHONY:_alrb
_alrb:
	@$(MAKE) _asm "STEM=alrb"

.PHONY:_ancb
_ancb:
	@$(MAKE) _asm "STEM=ancb"

.PHONY:_anda
_anda:
	@$(MAKE) _asm "STEM=anda"

.PHONY:_andax
_andax:
	@$(MAKE) _asm "STEM=andax"

.PHONY:_anday
_anday:
	@$(MAKE) _asm "STEM=anday"

.PHONY:_andb
_andb:
	@$(MAKE) _asm "STEM=andb"

.PHONY:_andix
_andix:
	@$(MAKE) _asm "STEM=andix"

.PHONY:_andiy
_andiy:
	@$(MAKE) _asm "STEM=andiy"

.PHONY:_andz
_andz:
	@$(MAKE) _asm "STEM=andz"

.PHONY:_andzx
_andzx:
	@$(MAKE) _asm "STEM=andzx"

.PHONY:_aneb
_aneb:
	@echo '--replace-with-placeholder=(up)aneb - seems unreliable on BBC' > $(BUILD)/aneb_args.txt
	@$(MAKE) _asm "STEM=aneb" CONVERT_FLAGS=@$(BUILD)/aneb_args.txt

.PHONY:_arrb
_arrb:
	@$(MAKE) _asm "STEM=arrb"

.PHONY:_asla
_asla:
	@$(MAKE) _asm "STEM=asla"

.PHONY:_aslax
_aslax:
	@$(MAKE) _asm "STEM=aslax"

.PHONY:_asln
_asln:
	@$(MAKE) _asm "STEM=asln"

.PHONY:_aslz
_aslz:
	@$(MAKE) _asm "STEM=aslz"

.PHONY:_aslzx
_aslzx:
	@$(MAKE) _asm "STEM=aslzx"

.PHONY:_asoa
_asoa:
	@$(MAKE) _asm "STEM=asoa"

.PHONY:_asoax
_asoax:
	@$(MAKE) _asm "STEM=asoax"

.PHONY:_asoay
_asoay:
	@$(MAKE) _asm "STEM=asoay"

.PHONY:_asoix
_asoix:
	@$(MAKE) _asm "STEM=asoix"

.PHONY:_asoiy
_asoiy:
	@$(MAKE) _asm "STEM=asoiy"

.PHONY:_asoz
_asoz:
	@$(MAKE) _asm "STEM=asoz"

.PHONY:_asozx
_asozx:
	@$(MAKE) _asm "STEM=asozx"

.PHONY:_axsa
_axsa:
	@$(MAKE) _asm "STEM=axsa"

.PHONY:_axsix
_axsix:
	@$(MAKE) _asm "STEM=axsix"

.PHONY:_axsz
_axsz:
	@$(MAKE) _asm "STEM=axsz"

.PHONY:_axszy
_axszy:
	@$(MAKE) _asm "STEM=axszy"

.PHONY:_bccr
_bccr:
	@$(MAKE) _asm "STEM=bccr"

.PHONY:_bcsr
_bcsr:
	@$(MAKE) _asm "STEM=bcsr"

.PHONY:_beqr
_beqr:
	@$(MAKE) _asm "STEM=beqr"

.PHONY:_bita
_bita:
	@$(MAKE) _asm "STEM=bita"

.PHONY:_bitz
_bitz:
	@$(MAKE) _asm "STEM=bitz"

.PHONY:_bmir
_bmir:
	@$(MAKE) _asm "STEM=bmir"

.PHONY:_bner
_bner:
	@$(MAKE) _asm "STEM=bner"

.PHONY:_bplr
_bplr:
	@$(MAKE) _asm "STEM=bplr"

.PHONY:_brkn
_brkn:
	@echo '--replace-with-placeholder=(up)brkn - need to fix this for BBC' > $(BUILD)/brkn_args.txt
	@$(MAKE) _asm "STEM=brkn" CONVERT_FLAGS=@$(BUILD)/brkn_args.txt

.PHONY:_bvcr
_bvcr:
	@$(MAKE) _asm "STEM=bvcr"

.PHONY:_bvsr
_bvsr:
	@$(MAKE) _asm "STEM=bvsr"

.PHONY:_clcn
_clcn:
	@$(MAKE) _asm "STEM=clcn"

.PHONY:_cldn
_cldn:
	@$(MAKE) _asm "STEM=cldn"

.PHONY:_clin
_clin:
	@$(MAKE) _asm "STEM=clin"

.PHONY:_clvn
_clvn:
	@$(MAKE) _asm "STEM=clvn"

.PHONY:_cmpa
_cmpa:
	@$(MAKE) _asm "STEM=cmpa"

.PHONY:_cmpax
_cmpax:
	@$(MAKE) _asm "STEM=cmpax"

.PHONY:_cmpay
_cmpay:
	@$(MAKE) _asm "STEM=cmpay"

.PHONY:_cmpb
_cmpb:
	@$(MAKE) _asm "STEM=cmpb"

.PHONY:_cmpix
_cmpix:
	@$(MAKE) _asm "STEM=cmpix"

.PHONY:_cmpiy
_cmpiy:
	@$(MAKE) _asm "STEM=cmpiy"

.PHONY:_cmpz
_cmpz:
	@$(MAKE) _asm "STEM=cmpz"

.PHONY:_cmpzx
_cmpzx:
	@$(MAKE) _asm "STEM=cmpzx"

.PHONY:_cpxa
_cpxa:
	@$(MAKE) _asm "STEM=cpxa"

.PHONY:_cpxb
_cpxb:
	@$(MAKE) _asm "STEM=cpxb"

.PHONY:_cpxz
_cpxz:
	@$(MAKE) _asm "STEM=cpxz"

.PHONY:_cpya
_cpya:
	@$(MAKE) _asm "STEM=cpya"

.PHONY:_cpyb
_cpyb:
	@$(MAKE) _asm "STEM=cpyb"

.PHONY:_cpyz
_cpyz:
	@$(MAKE) _asm "STEM=cpyz"

.PHONY:_dcma
_dcma:
	@$(MAKE) _asm "STEM=dcma"

.PHONY:_dcmax
_dcmax:
	@$(MAKE) _asm "STEM=dcmax"

.PHONY:_dcmay
_dcmay:
	@$(MAKE) _asm "STEM=dcmay"

.PHONY:_dcmix
_dcmix:
	@$(MAKE) _asm "STEM=dcmix"

.PHONY:_dcmiy
_dcmiy:
	@$(MAKE) _asm "STEM=dcmiy"

.PHONY:_dcmz
_dcmz:
	@$(MAKE) _asm "STEM=dcmz"

.PHONY:_dcmzx
_dcmzx:
	@$(MAKE) _asm "STEM=dcmzx"

.PHONY:_deca
_deca:
	@$(MAKE) _asm "STEM=deca"

.PHONY:_decax
_decax:
	@$(MAKE) _asm "STEM=decax"

.PHONY:_decz
_decz:
	@$(MAKE) _asm "STEM=decz"

.PHONY:_deczx
_deczx:
	@$(MAKE) _asm "STEM=deczx"

.PHONY:_dexn
_dexn:
	@$(MAKE) _asm "STEM=dexn"

.PHONY:_deyn
_deyn:
	@$(MAKE) _asm "STEM=deyn"

.PHONY:_eora
_eora:
	@$(MAKE) _asm "STEM=eora"

.PHONY:_eorax
_eorax:
	@$(MAKE) _asm "STEM=eorax"

.PHONY:_eoray
_eoray:
	@$(MAKE) _asm "STEM=eoray"

.PHONY:_eorb
_eorb:
	@$(MAKE) _asm "STEM=eorb"

.PHONY:_eorix
_eorix:
	@$(MAKE) _asm "STEM=eorix"

.PHONY:_eoriy
_eoriy:
	@$(MAKE) _asm "STEM=eoriy"

.PHONY:_eorz
_eorz:
	@$(MAKE) _asm "STEM=eorz"

.PHONY:_eorzx
_eorzx:
	@$(MAKE) _asm "STEM=eorzx"

.PHONY:_inca
_inca:
	@$(MAKE) _asm "STEM=inca"

.PHONY:_incax
_incax:
	@$(MAKE) _asm "STEM=incax"

.PHONY:_incz
_incz:
	@$(MAKE) _asm "STEM=incz"

.PHONY:_inczx
_inczx:
	@$(MAKE) _asm "STEM=inczx"

.PHONY:_insa
_insa:
	@$(MAKE) _asm "STEM=insa"

.PHONY:_insax
_insax:
	@$(MAKE) _asm "STEM=insax"

.PHONY:_insay
_insay:
	@$(MAKE) _asm "STEM=insay"

.PHONY:_insix
_insix:
	@$(MAKE) _asm "STEM=insix"

.PHONY:_insiy
_insiy:
	@$(MAKE) _asm "STEM=insiy"

.PHONY:_insz
_insz:
	@$(MAKE) _asm "STEM=insz"

.PHONY:_inszx
_inszx:
	@$(MAKE) _asm "STEM=inszx"

.PHONY:_inxn
_inxn:
	@$(MAKE) _asm "STEM=inxn"

.PHONY:_inyn
_inyn:
	@$(MAKE) _asm "STEM=inyn"

.PHONY:_jmpi
_jmpi:
	@$(MAKE) _asm "STEM=jmpi"

.PHONY:_jmpw
_jmpw:
	@$(MAKE) _asm "STEM=jmpw"

.PHONY:_jsrw
_jsrw:
	@$(MAKE) _asm "STEM=jsrw"

.PHONY:_lasay
_lasay:
	@$(MAKE) _asm "STEM=lasay" "CONVERT_FLAGS=--no-check-p"

.PHONY:_laxa
_laxa:
	@$(MAKE) _asm "STEM=laxa"

.PHONY:_laxay
_laxay:
	@$(MAKE) _asm "STEM=laxay"

.PHONY:_laxix
_laxix:
	@$(MAKE) _asm "STEM=laxix"

.PHONY:_laxiy
_laxiy:
	@$(MAKE) _asm "STEM=laxiy"

.PHONY:_laxz
_laxz:
	@$(MAKE) _asm "STEM=laxz"

.PHONY:_laxzy
_laxzy:
	@$(MAKE) _asm "STEM=laxzy"

.PHONY:_ldaa
_ldaa:
	@$(MAKE) _asm "STEM=ldaa"

.PHONY:_ldaax
_ldaax:
	@$(MAKE) _asm "STEM=ldaax"

.PHONY:_ldaay
_ldaay:
	@$(MAKE) _asm "STEM=ldaay"

.PHONY:_ldab
_ldab:
	@$(MAKE) _asm "STEM=ldab"

.PHONY:_ldaix
_ldaix:
	@$(MAKE) _asm "STEM=ldaix"

.PHONY:_ldaiy
_ldaiy:
	@$(MAKE) _asm "STEM=ldaiy"

.PHONY:_ldaz
_ldaz:
	@$(MAKE) _asm "STEM=ldaz"

.PHONY:_ldazx
_ldazx:
	@$(MAKE) _asm "STEM=ldazx"

.PHONY:_ldxa
_ldxa:
	@$(MAKE) _asm "STEM=ldxa"

.PHONY:_ldxay
_ldxay:
	@$(MAKE) _asm "STEM=ldxay"

.PHONY:_ldxb
_ldxb:
	@$(MAKE) _asm "STEM=ldxb"

.PHONY:_ldxz
_ldxz:
	@$(MAKE) _asm "STEM=ldxz"

.PHONY:_ldxzy
_ldxzy:
	@$(MAKE) _asm "STEM=ldxzy"

.PHONY:_ldya
_ldya:
	@$(MAKE) _asm "STEM=ldya"

.PHONY:_ldyax
_ldyax:
	@$(MAKE) _asm "STEM=ldyax"

.PHONY:_ldyb
_ldyb:
	@$(MAKE) _asm "STEM=ldyb"

.PHONY:_ldyz
_ldyz:
	@$(MAKE) _asm "STEM=ldyz"

.PHONY:_ldyzx
_ldyzx:
	@$(MAKE) _asm "STEM=ldyzx"

.PHONY:_lsea
_lsea:
	@$(MAKE) _asm "STEM=lsea"

.PHONY:_lseax
_lseax:
	@$(MAKE) _asm "STEM=lseax"

.PHONY:_lseay
_lseay:
	@$(MAKE) _asm "STEM=lseay"

.PHONY:_lseix
_lseix:
	@$(MAKE) _asm "STEM=lseix"

.PHONY:_lseiy
_lseiy:
	@$(MAKE) _asm "STEM=lseiy"

.PHONY:_lsez
_lsez:
	@$(MAKE) _asm "STEM=lsez"

.PHONY:_lsezx
_lsezx:
	@$(MAKE) _asm "STEM=lsezx"

.PHONY:_lsra
_lsra:
	@$(MAKE) _asm "STEM=lsra"

.PHONY:_lsrax
_lsrax:
	@$(MAKE) _asm "STEM=lsrax"

.PHONY:_lsrn
_lsrn:
	@$(MAKE) _asm "STEM=lsrn"

.PHONY:_lsrz
_lsrz:
	@$(MAKE) _asm "STEM=lsrz"

.PHONY:_lsrzx
_lsrzx:
	@$(MAKE) _asm "STEM=lsrzx"

.PHONY:_lxab
_lxab:
	@$(MAKE) _asm "STEM=lxab"

.PHONY:_nopa
_nopa:
	@$(MAKE) _asm "STEM=nopa"

.PHONY:_nopax
_nopax:
	@$(MAKE) _asm "STEM=nopax"

.PHONY:_nopb
_nopb:
	@$(MAKE) _asm "STEM=nopb"

.PHONY:_nopn
_nopn:
	@$(MAKE) _asm "STEM=nopn"

.PHONY:_nopz
_nopz:
	@$(MAKE) _asm "STEM=nopz"

.PHONY:_nopzx
_nopzx:
	@$(MAKE) _asm "STEM=nopzx"

.PHONY:_oraa
_oraa:
	@$(MAKE) _asm "STEM=oraa"

.PHONY:_oraax
_oraax:
	@$(MAKE) _asm "STEM=oraax"

.PHONY:_oraay
_oraay:
	@$(MAKE) _asm "STEM=oraay"

.PHONY:_orab
_orab:
	@$(MAKE) _asm "STEM=orab"

.PHONY:_oraix
_oraix:
	@$(MAKE) _asm "STEM=oraix"

.PHONY:_oraiy
_oraiy:
	@$(MAKE) _asm "STEM=oraiy"

.PHONY:_oraz
_oraz:
	@$(MAKE) _asm "STEM=oraz"

.PHONY:_orazx
_orazx:
	@$(MAKE) _asm "STEM=orazx"

.PHONY:_phan
_phan:
	@$(MAKE) _asm "STEM=phan"

.PHONY:_phpn
_phpn:
	@$(MAKE) _asm "STEM=phpn"

.PHONY:_plan
_plan:
	@$(MAKE) _asm "STEM=plan"

.PHONY:_plpn
_plpn:
	@$(MAKE) _asm "STEM=plpn"

.PHONY:_rlaa
_rlaa:
	@$(MAKE) _asm "STEM=rlaa"

.PHONY:_rlaax
_rlaax:
	@$(MAKE) _asm "STEM=rlaax"

.PHONY:_rlaay
_rlaay:
	@$(MAKE) _asm "STEM=rlaay"

.PHONY:_rlaix
_rlaix:
	@$(MAKE) _asm "STEM=rlaix"

.PHONY:_rlaiy
_rlaiy:
	@$(MAKE) _asm "STEM=rlaiy"

.PHONY:_rlaz
_rlaz:
	@$(MAKE) _asm "STEM=rlaz"

.PHONY:_rlazx
_rlazx:
	@$(MAKE) _asm "STEM=rlazx"

.PHONY:_rola
_rola:
	@$(MAKE) _asm "STEM=rola"

.PHONY:_rolax
_rolax:
	@$(MAKE) _asm "STEM=rolax"

.PHONY:_roln
_roln:
	@$(MAKE) _asm "STEM=roln"

.PHONY:_rolz
_rolz:
	@$(MAKE) _asm "STEM=rolz"

.PHONY:_rolzx
_rolzx:
	@$(MAKE) _asm "STEM=rolzx"

.PHONY:_rora
_rora:
	@$(MAKE) _asm "STEM=rora"

.PHONY:_rorax
_rorax:
	@$(MAKE) _asm "STEM=rorax"

.PHONY:_rorn
_rorn:
	@$(MAKE) _asm "STEM=rorn"

.PHONY:_rorz
_rorz:
	@$(MAKE) _asm "STEM=rorz"

.PHONY:_rorzx
_rorzx:
	@$(MAKE) _asm "STEM=rorzx"

.PHONY:_rraa
_rraa:
	@$(MAKE) _asm "STEM=rraa"

.PHONY:_rraax
_rraax:
	@$(MAKE) _asm "STEM=rraax"

.PHONY:_rraay
_rraay:
	@$(MAKE) _asm "STEM=rraay"

.PHONY:_rraix
_rraix:
	@$(MAKE) _asm "STEM=rraix"

.PHONY:_rraiy
_rraiy:
	@$(MAKE) _asm "STEM=rraiy"

.PHONY:_rraz
_rraz:
	@$(MAKE) _asm "STEM=rraz"

.PHONY:_rrazx
_rrazx:
	@$(MAKE) _asm "STEM=rrazx"

.PHONY:_rtin
_rtin:
	@$(MAKE) _asm "STEM=rtin"

.PHONY:_rtsn
_rtsn:
	@$(MAKE) _asm "STEM=rtsn"

.PHONY:_sbca
_sbca:
	@$(MAKE) _asm "STEM=sbca"

.PHONY:_sbcax
_sbcax:
	@$(MAKE) _asm "STEM=sbcax"

.PHONY:_sbcay
_sbcay:
	@$(MAKE) _asm "STEM=sbcay"

.PHONY:sbc(eb)
sbc(eb):
	@$(MAKE) _asm "STEM=sbcb(eb)"

.PHONY:_sbcb
_sbcb:
	@$(MAKE) _asm "STEM=sbcb"

.PHONY:_sbcix
_sbcix:
	@$(MAKE) _asm "STEM=sbcix"

.PHONY:_sbciy
_sbciy:
	@$(MAKE) _asm "STEM=sbciy"

.PHONY:_sbcz
_sbcz:
	@$(MAKE) _asm "STEM=sbcz"

.PHONY:_sbczx
_sbczx:
	@$(MAKE) _asm "STEM=sbczx"

.PHONY:_sbxb
_sbxb:
	@$(MAKE) _asm "STEM=sbxb"

.PHONY:_secn
_secn:
	@$(MAKE) _asm "STEM=secn"

.PHONY:_sedn
_sedn:
	@$(MAKE) _asm "STEM=sedn"

.PHONY:_sein
_sein:
	@$(MAKE) _asm "STEM=sein"

.PHONY:_shaay
_shaay:
	@$(MAKE) _asm "STEM=shaay"

.PHONY:_shaiy
_shaiy:
	@$(MAKE) _asm "STEM=shaiy"

.PHONY:_shsay
_shsay:
	@$(MAKE) _asm "STEM=shsay"

.PHONY:_shxay
_shxay:
	@$(MAKE) _asm "STEM=shxay"

.PHONY:_shyax
_shyax:
	@$(MAKE) _asm "STEM=shyax"

.PHONY:_staa
_staa:
	@$(MAKE) _asm "STEM=staa"

.PHONY:_staax
_staax:
	@$(MAKE) _asm "STEM=staax"

.PHONY:_staay
_staay:
	@$(MAKE) _asm "STEM=staay"

.PHONY:_staix
_staix:
	@$(MAKE) _asm "STEM=staix"

.PHONY:_staiy
_staiy:
	@$(MAKE) _asm "STEM=staiy"

.PHONY:_start
_start:
	@$(MAKE) _asm "STEM=start"

.PHONY:_staz
_staz:
	@$(MAKE) _asm "STEM=staz"

.PHONY:_stazx
_stazx:
	@$(MAKE) _asm "STEM=stazx"

.PHONY:_stxa
_stxa:
	@$(MAKE) _asm "STEM=stxa"

.PHONY:_stxz
_stxz:
	@$(MAKE) _asm "STEM=stxz"

.PHONY:_stxzy
_stxzy:
	@$(MAKE) _asm "STEM=stxzy"

.PHONY:_stya
_stya:
	@$(MAKE) _asm "STEM=stya"

.PHONY:_styz
_styz:
	@$(MAKE) _asm "STEM=styz"

.PHONY:_styzx
_styzx:
	@$(MAKE) _asm "STEM=styzx"

.PHONY:_taxn
_taxn:
	@$(MAKE) _asm "STEM=taxn"

.PHONY:_tayn
_tayn:
	@$(MAKE) _asm "STEM=tayn"

.PHONY:_tsxn
_tsxn:
	@$(MAKE) _asm "STEM=tsxn"

.PHONY:_txan
_txan:
	@$(MAKE) _asm "STEM=txan"

.PHONY:_txsn
_txsn:
	@$(MAKE) _asm "STEM=txsn"

.PHONY:_tyan
_tyan:
	@$(MAKE) _asm "STEM=tyan"

.PHONY:_asm
_asm:
	@echo '$(STEM)'
	@$(PYTHON3) convert.py $(CONVERT_FLAGS) "./ascii-src/$(STEM).asm" > "$(BUILD)/$(STEM).s65"
	@$(TASS) --cbm-prg -q -L "$(BUILD)/$(STEM).lst" -o "$(BUILD)/$(STEM).prg" -T "$(BUILD)/$(STEM).s65"
	@$(PYTHON3) submodules/beeb/bin/prg2bbc.py --io "$(BUILD)/$(STEM).prg" "$(BEEB_BIN)/$$.$(STEM)"

.PHONY:clean
clean:
	$(SHELLCMD) rm-tree $(BEEB_BIN)
	$(SHELLCMD) rm-tree $(BUILD)

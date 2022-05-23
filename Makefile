PYTHON3:=python3
TASS:=64tass
SHELLCMD:=$(PYTHON3) submodules/shellcmd.py/shellcmd.py
BEEB_BIN:=beeb/z
BUILD:=.build


.PHONY:all
all:
	$(SHELLCMD) mkdir $(BEEB_BIN)
	$(SHELLCMD) mkdir $(BUILD)
	$(MAKE) -j4 _everything

.PHONY:_everything
_everything: _adca _adcax _adcay _adcb _adcix _adciy _adcz _adczx _alrb _ancb _anda _andax _anday _andb _andix _andiy _andz _andzx _aneb _arrb _asla _aslax _asln _aslz _aslzx _asoa _asoax _asoay _asoix _asoiy _asoz _asozx _axsa _axsix _axsz _axszy _bccr _bcsr _beqr _bita _bitz _bmir _bner _bplr _brkn _bvcr _bvsr _clcn _cldn _clin _clvn _cmpa _cmpax _cmpay _cmpb _cmpix _cmpiy _cmpz _cmpzx _cpxa _cpxb _cpxz _cpya _cpyb _cpyz _dcma _dcmax _dcmay _dcmix _dcmiy _dcmz _dcmzx _deca _decax _decz _deczx _dexn _deyn _eora _eorax _eoray _eorb _eorix _eoriy _eorz _eorzx _inca _incax _incz _inczx _insa _insax _insay _insix _insiy _insz _inszx _inxn _inyn _jmpi _jmpw _jsrw _lasay _laxa _laxay _laxix _laxiy _laxz _laxzy _ldaa _ldaax _ldaay _ldab _ldaix _ldaiy _ldaz _ldazx _ldxa _ldxay _ldxb _ldxz _ldxzy _ldya _ldyax _ldyb _ldyz _ldyzx _lsea _lseax _lseay _lseix _lseiy _lsez _lsezx _lsra _lsrax _lsrn _lsrz _lsrzx _lxab _nopa _nopax _nopb _nopn _nopz _nopzx _oraa _oraax _oraay _orab _oraix _oraiy _oraz _orazx _phan _phpn _plan _plpn _rlaa _rlaax _rlaay _rlaix _rlaiy _rlaz _rlazx _rola _rolax _roln _rolz _rolzx _rora _rorax _rorn _rorz _rorzx _rraa _rraax _rraay _rraix _rraiy _rraz _rrazx _rtin _rtsn _sbca _sbcax _sbcay sbc(eb) _sbcb _sbcix _sbciy _sbcz _sbczx _sbxb _secn _sedn _sein _shaay _shaiy _shsay _shxay _shyax _staa _staax _staay _staix _staiy _start _staz _stazx _stxa _stxz _stxzy _stya _styz _styzx _taxn _tayn _tsxn _txan _txsn _tyan

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
	@$(MAKE) _asm "STEM=aneb"

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
	@$(MAKE) _asm "STEM=brkn"

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
	@$(MAKE) _asm "STEM=lasay"

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
	@$(TASS) -q -L "$(BUILD)/$(STEM).lst" -o "$(BEEB_BIN)/$$.$(STEM)" -T "./ascii-src/$(STEM).asm"

.PHONY:clean
clean:
	$(SHELLCMD) rm-tree $(BEEB_BIN)
	$(SHELLCMD) rm-tree $(BUILD)

#!/usr/bin/python3
import os,os.path,sys,argparse,glob

def main2(options):
    src_paths=glob.glob(os.path.join(options.src_path,'*.asm'))

    for src_path in src_paths:
        name=os.path.splitext(os.path.split(src_path)[1])[0]
        print(src_path)
        if name=='start': continue

        with open(src_path,'rt') as f: lines=f.readlines()
        lines=[x.rstrip() for x in lines]

        assert lines[0]=='         *= $0801'

        assert lines[2].strip()=='jsr print'
        assert lines[3].strip()=='.byte 13'
        assert lines[4].strip()=='.text "(up)'+name+'"',lines[4]
        assert lines[5].strip()=='.byte 0'

        assert lines[7].strip().startswith('lda #')
        init_db=lines[7].strip()[5:]
        assert lines[8].strip()=='sta db'
        assert lines[9].strip().startswith('lda #')
        init_ab=lines[9].strip()[5:]
        assert lines[10].strip()=='sta ab'
        assert lines[11].strip().startswith('lda #')
        init_xb=lines[11].strip()[5:]
        assert lines[12].strip()=='sta xb'
        assert lines[13].strip().startswith('lda #')
        init_yb=lines[13].strip()[5:]
        assert lines[14].strip()=='sta yb'
        assert lines[15].strip().startswith('lda #')
        init_pb=lines[15].strip()[5:]
        assert lines[16].strip()=='sta pb'
        assert lines[17].strip()=='tsx'
        assert lines[18].strip()=='stx sb'

        i=20
        if lines[i].strip()=='stx saves+1':
            save_stack=True
            assert lines[i+1].strip()=='ldx #0'
            assert lines[i+2].strip()=='s0       lda $0100,x'
            assert lines[i+3].strip()=='sta $1000,x'
            assert lines[i+4].strip()=='inx'
            assert lines[i+5].strip()=='bne s0'
            i+=6
        else: save_stack=False

        prefix=['         .include "../common.s65"',
                '*=code_addr',
                '',
                '         .init "%s",%s,%s,%s,%s,%s'%(name,
                                                      init_db,
                                                      init_ab,
                                                      init_xb,
                                                      init_yb,
                                                      init_pb)]
        
        if save_stack: prefix.append('         .save_stack')

        lines=prefix+lines[i:]

        # init=['         lda #%00011011',
        #       '         sta db',
        #       '         lda #%11000110',
        #       '         sta ab',
        #       '         lda #%10110001',
        #       '         sta xb',
        #       '         lda #%01101100',
        #       '         sta yb',]
        #       # '         lda #0',
        #       # '         sta pb',
        #       # '         tsx',
        #       # '         stx sb']

        # assert lines[7:7+len(init)]==init
        
        with open(src_path,'wt') as f: f.write('\n'.join(lines))
            
def main(argv):
    p=argparse.ArgumentParser(fromfile_prefix_chars='@')
    p.add_argument('src_path',metavar='FOLDER',help='''read/write original source files from %(metavar)s''')
    main2(p.parse_args(argv))

if __name__=='__main__': main(sys.argv[1:])

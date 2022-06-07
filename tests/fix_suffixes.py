#!/usr/bin/python3
import os,os.path,sys,argparse,glob

def main2(options):
    src_paths=glob.glob(os.path.join(options.src_path,'*.asm'))

    for src_path in src_paths:
        name=os.path.splitext(os.path.split(src_path)[1])[0]
        print(src_path)

        with open(src_path,'rt') as f: lines=f.readlines()
        lines=[x.rstrip() for x in lines]

        if name=='start':
            # skip
            pass
        elif name in ['brkn','jsrw','rtin','rtsn']:
            # do these later
            pass
        elif name in ['bccr','bcsr','bmir','bner','bplr','bvcr','jmpi','jmpw','beqr','bvsr']:
            i=lines.index('check    lda da')
            lines=lines[:i]+['check    .block',
                             '         lda da']+lines[i+1:]

            i=lines.index('stop')
            assert lines[i+1]=='         lda 2'
            lines=lines[:i]+['stop     lda 2']+lines[i+2:]

            i=lines.index('hexb     pha')
            lines=lines[:i]+['         .bend']+lines[i:]

            for i in range(len(lines)):
                if lines[i]=='         jsr wait':
                    lines[i]='         jsr check.wait'
        else:
            i=lines.index('check')
            assert lines[i+1]=='         .block'
            lines=lines[:i]+['check    .block']+lines[i+2:]

        for i in range(len(lines)): lines[i]=lines[i].replace('!','@w ')

        with open(src_path,'wt') as f: f.write('\n'.join(lines))
            
def main(argv):
    p=argparse.ArgumentParser(fromfile_prefix_chars='@')
    p.add_argument('src_path',metavar='FOLDER',help='''read/write original source files from %(metavar)s''')
    main2(p.parse_args(argv))

if __name__=='__main__': main(sys.argv[1:])

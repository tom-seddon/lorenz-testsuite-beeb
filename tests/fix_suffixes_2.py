#!/usr/bin/python3
import os,os.path,sys,argparse,glob

def main2(options):
    src_paths=glob.glob(os.path.join(options.src_path,'*.asm'))

    for src_path in src_paths:
        name=os.path.splitext(os.path.split(src_path)[1])[0]
        if name=='start': continue
        print(src_path)

        with open(src_path,'rt') as f: lines=f.readlines()
        lines=[x.rstrip() for x in lines]

        i=lines.index('db       .byte 0')
        del lines[i:]
        lines.append('         .include "../common_suffix.s65"')

        with open(src_path,'wt') as f: f.write('\n'.join(lines))
            
def main(argv):
    p=argparse.ArgumentParser(fromfile_prefix_chars='@')
    p.add_argument('src_path',metavar='FOLDER',help='''read/write original source files from %(metavar)s''')
    main2(p.parse_args(argv))

if __name__=='__main__': main(sys.argv[1:])

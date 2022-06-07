#!/usr/bin/python3
import os,os.path,sys,argparse,glob

# "analyze" the lorenz test suite code to find the common code that
# could be extracted.

def main2(options):
    src_paths=glob.glob(os.path.join(options.src_path,'*.asm'))
    paths_by_suffix={}
    for src_path in src_paths:
        if os.path.split(src_path)[1]=='start.asm': continue
        
        with open(src_path,'rt') as f: lines=f.readlines()
        lines=[line.rstrip() for line in lines]

        #print(src_path)
        i=lines.index('load     jsr print')
        assert lines[i+1].startswith('name     .text "')
        assert lines[i+1].endswith('"')

        #assert lines[i-2].endswith('jmp $8000'),(src_path,lines[i-2])

        suffix='\n'.join(lines[i+2:])
        paths_by_suffix.setdefault(suffix,[]).append(src_path)

    print(len(paths_by_suffix))
    
    print(paths_by_suffix.values())

    if options.dest_path is not None:
        i=0
        for k,v in paths_by_suffix.items():
            with open(os.path.join(options.dest_path,
                                   'suffix%d.asm'%i),
                      'wt') as f:
                print(sorted(v),file=f)
                f.write(k)
            i+=1

def main(argv):
    p=argparse.ArgumentParser(fromfile_prefix_chars='@')
    p.add_argument('-o',metavar='FOLDER',dest='dest_path',default=None,help='''if provided, write output files to %(metavar)s''')
    p.add_argument('src_path',metavar='FOLDER',help='''read original source files from %(metavar)s''')
    main2(p.parse_args(argv))

if __name__=='__main__': main(sys.argv[1:])

#!/usr/bin/python3
import sys,argparse

g_input_path=None

def fatal(msg):
    sys.stderr.write('FATAL: ')
    if g_input_path is not None: sys.stderr.write('%s: '%g_input_path)
    sys.stderr.write('%s\n'%msg)
    sys.exit(1)

def convert(options):
    global g_input_path
    g_input_path=options.input_path
    
    with open(options.input_path,'rt') as f: lines=[line.rstrip() for line in f.readlines()]

    def P(x): print('        %s'%x)

    def replace(old,new):
        for i in range(len(lines)):
            if lines[i].endswith(old):
                lines[i]=lines[i][:-len(old)]+new

    def remove(ls):
        i=lines.index(ls[0])
        if lines[i:i+len(ls)]!=ls: fatal('couldn\'t find code to remove')
        del lines[i:i+len(ls)]

    def find_startswith_suffix(prefix):
        for line in lines:
            if line.startswith(prefix): return line[len(prefix):]
        return None

    if options.replace_with_placeholder is not None:
        suffix=find_startswith_suffix('name     .text ')
        assert suffix is not None
        assert '"' not in options.replace_with_placeholder

        # the stupid _ thing is because I couldn't figure out how to
        # make
        P('                .include "../common.s65"')
        P('*=code_addr')
        P('                .skipped_test "%s",%s'%(
            options.replace_with_placeholder.replace('_',' '),
            suffix))
    else:
        # P('.init_beeb_hacks')
        
        # print character
        replace(' $ffd2',' print_char')

        # load
        replace(' $e16f',' load_file')

        # scan keyboard
        replace(' $ffe4',' scan_keyboard')

        # exit
        replace('jmp $8000','jmp exit')
        replace('jmp ($a002)','jmp exit')

        # shoddy waitborder hack
        replace(' $d011',' d011_hack')

        if options.no_check_p: remove(['         lda pa',
                                       '         cmp pr',
                                       '         bne error'])
        for line in lines: print(line)

    P('                .include "../beeb_hacks.s65"')

def main(argv):
    parser=argparse.ArgumentParser(fromfile_prefix_chars='@')

    parser.add_argument('input_path',metavar='FILE',help='''read input from %(metavar)s''')
    parser.add_argument('--no-check-p',action='store_true',help='''strip out the status register check''')
    parser.add_argument('--replace-with-placeholder',default=None,metavar='DESCRIPTION',help='''replace with placeholder code that prints %(metavar)s''')

    convert(parser.parse_args(argv))

if __name__=='__main__': main(sys.argv[1:])

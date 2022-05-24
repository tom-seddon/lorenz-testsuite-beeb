#!/usr/bin/python3
import sys,argparse

g_input_path=None

def fatal(msg):
    sys.stderr.write('FATAL: ')
    if g_input_path is not None: sys.stderr.write('%s: '%g_input_path)
    sys.stderr.write('%s\n'%msg)
    sys.exit(1)

start_lines=[
    '         *= $0801',
    '',
    '         .byte $4c,$16,$08,$00,$97,$32',
    '         .byte $2c,$30,$3a,$9e,$32,$30',
    '         .byte $37,$30,$00,$00,$00,$a9',
    '         .byte $01,$85,$02',
]
    
def convert(options):
    global g_input_path
    g_input_path=options.input_path
    
    with open(options.input_path,'rt') as f: lines=[line.rstrip() for line in f.readlines()]

    if len(lines)<len(start_lines): fatal('file too short')
    if lines[:len(start_lines)]!=start_lines: fatal('unexpected start lines')

    def line(x): print('        %s'%x)

    line('*=$1900')
    line('.init_beeb_hacks')
    
    lines=lines[len(start_lines):]

    def replace(old,new):
        for i in range(len(lines)):
            if lines[i].endswith(old):
                lines[i]=lines[i][:-len(old)]+new

    # print character
    replace(' $ffd2',' print_char')

    # load
    replace(' $e16f',' load_file')

    # scan keyboard
    replace(' $ffe4',' scan_keyboard')

    # exit
    replace('jmp $8000','jmp exit')
    replace('jmp ($a002)','jmp exit')

    for line in lines: print(line)
    
    print('        .include "../beeb_hacks.s65"')

def main(argv):
    parser=argparse.ArgumentParser()

    parser.add_argument('input_path',metavar='FILE',help='''read input from %(metavar)s''')

    convert(parser.parse_args(argv))

if __name__=='__main__': main(sys.argv[1:])

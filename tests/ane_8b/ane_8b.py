#!/usr/bin/python3
import sys,argparse,os.path

##########################################################################
##########################################################################

# each file holds result chunks for a given C/A input
#
# there are 256 result chunks in the file, one for each input
#
# each result chunk is 3 256-byte arrays, indexed by XAA immediate
# value: 256 x A, 256 x X, 256 x P

g_data=[]

##########################################################################
##########################################################################

def fatal(msg):
    sys.stderr.write('FATAL: %s\n'%msg)
    sys.stderr.flush()
    sys.exit(1)
    
##########################################################################
##########################################################################

def get_result(c,a,x,imm):
    data=g_data[c*256+a]
    i=x*768
    return (data[i+imm],data[i+256+imm],data[i+512+imm])

def describe_result(r):
    return '(A=$%02x X=$%02x P=%s%s%s%s%s%s%s%s)'%(
        r[0],
        r[1],
        'N' if r[2]&0x80 else '_',
        'V' if r[2]&0x40 else '_',
        '1' if r[2]&0x20 else '_',
        'B' if r[2]&0x10 else '_',
        'D' if r[2]&0x08 else '_',
        'I' if r[2]&0x04 else '_',
        'Z' if r[2]&0x02 else '_',
        'C' if r[2]&0x01 else '_')

def main2(options):
    print('Loading...')
    for c in range(2):
        for a in range(256):
            path=os.path.join(options.input_path,'$.C%dA%02X'%(c,a))
            with open(path,'rb') as f: data=f.read()
            expected_size=65536*3
            if len(data)!=expected_size:
                fatal('bad size %d (should be %d): %s'%(len(data),
                                                        expected_size,
                                                        path))

            g_data.append(data)

    byte_values=range(256)

    # awful flag naming here
    if options.no_test_c: pass
    else:
        for a in byte_values:
            print('Testing C influence: A=$%02x'%a)
            for x in byte_values:
                for imm in byte_values:
                    r0=get_result(0,a,x,imm)
                    r1=get_result(1,a,x,imm)

                    if (r0[0]!=r1[0] or
                        r0[1]!=r1[1]):
                        print('\nA=$%02x X=$%02x imm=$%02x: C=0: %s; C=1: %s'%(a,x,imm,describe_result(r0),describe_result(r1)))

    for c in range(2):
        for a in byte_values:
            print('Testing: C=%d A=$%02x'%(c,a))
            for x in byte_values:
                for imm in byte_values:
                    r=get_result(c,a,x,imm)

                    # check X is unchanged
                    #if r[1]!=x: print('X wrong: A=$%02x X=$%02x imm=$%02x: %s'%(a,x,imm,describe_result(r)))

                    # what is A?
                    #if r[0]!=(x&imm): print('A wrong: A=$%02x X=$%02x imm=$%02x: %s'%(a,x,imm,describe_result(r)))

                    #
                    # if (r[0]==0)!=((r[2]&2)!=0): print('Z wrong: A=$%02x X=$%02x imm=$%02x: %s'%(a,x,imm,describe_result(r)))
                    if (r[0]&0x80)!=(r[2]&0x80): print('N wrong: A=$%02x X=$%02x imm=$%02x: %s'%(a,x,imm,describe_result(r)))
            
##########################################################################
##########################################################################
    
def main(argv):
    p=argparse.ArgumentParser()
    p.add_argument('--no-test-c',action='store_true',help='''skip the carry flag influence test''')
    p.add_argument('-i',dest='input_path',metavar='FOLDER',default='./cold',help='''read files from %(metavar)s. Default: %(default)s''')
    main2(p.parse_args(argv))

if __name__=='__main__': main(sys.argv[1:])

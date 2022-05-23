#!/usr/bin/python3

def main():
    name='start'
    while name!='trap1':
        with open('ascii-src/%s.asm'%name,'rt') as f: lines=f.readlines()

        old_name=name

        prefix='name     .text "'
        for line in lines:
            if line.startswith(prefix):
                name=line.rstrip()[len(prefix):-1]
                break

        print('%s->%s'%(old_name,name))
    
if __name__=='__main__': main()

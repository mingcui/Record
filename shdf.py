#!/bin/evn python
import os
import sys
import argparse

 
def df_command(argument):
   os.system('df %s' % (argument))

if __name__ == '__main__':
 parser = argparse.ArgumentParser(description='df command by python', prog='df',usage='%(prog)s [OPTION]...[FILE]', add_help=False)
 parser.add_argument('--help',help='print help message', action='store_true')
 parser.add_argument('-h', help='humen read',action='store_true')
 parser.add_argument('-a', help='print all file system used infomation',action='store_true')
 args = parser.parse_args()
 if args.h:
   df_command("-h")
 elif args.a:
   df_command("-a")
 else:
   parser.print_help()

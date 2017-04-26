#!/bin/bash
##########################################################
#This script is just for remove foglight from catalina.sh#
##########################################################
 

# function

function help()   #help useage
{ 
 echo "Usage: "
 echo "$0 [option] "
 echo "-h ----------- show this useage"

 echo "-p [path] ----------- the path was the catalina work directory"
 echo "for example: $0 -p '/usr/local/tomcat/' " 
 return 0
}

function backup()   #backup catalina
{
 #[ $catalina_dir -eq  ]
 ls -d ${catalina_dir} > /dev/null 2>&1
 if [ $? -ne 0 ];then
    echo "The path not exist or wrong type please checking"
    exit 1
 else
    cd $catalina_dir 
    ls catalina.sh > /dev/null 2>&1
    if [ $? -ne 0 ];then
       echo "There is no catalina.sh exist, please checking"
       exit 1
    eles
        /bin/cp catalina.sh catalina.sh.bakup`date "+%Y%m%d"`
    fi
 fi
}

function clean()        #remove foglight 
{
 grep -q -o "# BEGIN" catalina.sh
 if [ $? -ne 0 ];then
   echo "This file do not need clean foglight"
   exit 0
 else
   sed -r '/^# BEGIN/,/^#.*END/'d catalina.sh -i
   echo "foglight clean successfully" 
 fi
 exit 0   
}

### main
if [[ $# -lt 1 ]];then
  echo "Should type -p with right path"
  help
fi

while getopts ":p:h" opt; do
 case $opt in
  p)
    catalina_dir=$OPTARG
    backup
    clean
    ;;
  h)
    help
    ;;
  *)
    echo "Invalid option, please see the useage:\n"
    help
    ;;
  esac
done


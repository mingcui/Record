#!/bin/bash
war_file='complete.war'
app_path='/usr/local/tomcat-7.0.39'

#copy war
cd ${app_path}
#cp complete.war complete_bakup_`date +%Y%H%M%s`
cp ${war_file} webapps/nbs.war
rm -rf nbs

function check_java()
{
 ps -ef |grep -v grep |grep -q java
 return $?
}

#restart tomcat
./bin/shutdown.sh
sleep 30
check_java
if [ $? -ne 0 ];then
  ./bin/startup.sh
else
  echo "shutdown tomcat failed!"
  exit 1 
fi

for i in 0..100
do 
 check_java  
 if [ $? -eq 0 ];then
   echo "tomcat service running..."
   exit 0 
 else 
   sleep 1
 fi
done
echo "tomcat service start up failed!"

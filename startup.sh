#!/bin/bash


set -e

if [ -f /etc/configured ]; then
        echo 'already configured'
else
        #code that need to run only one time ....
        cd /build/dspace-4.2-src-release/dspace/target/dspace-4.1-build
        #need database running for this command to work ...
        # /sbin/setuser postgres /usr/lib/postgresql/9.3/bin/postgres -D /var/lib/postgresql/9.3/main -c config_file=/etc/postgresql/9.3/main/postgresql.conf >>/var/log/postgresd.log 2>&1
        ant fresh_install
        chown tomcat7:tomcat7 /dspace -R
         #this need some help for no interractive
         /dspace/bin/dspace create-administrator 
         #stop database ... after install ... 
  
        #needed for fix problem with ubuntu and cron
        update-locale 
        date > /etc/configured
fi

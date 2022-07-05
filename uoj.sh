cd install/bundle && sh install.sh -p && echo "\
#!/bin/sh\n\
chown -R mysql:mysql /var/lib/mysql /var/run/mysqld\n\
if [ ! -f \"/var/uoj_data/.UOJSetupDone\" ]; then\n\
  cd /opt/uoj/install/bundle && sh install.sh -i\n\
fi\n\
service ntp start\n\
service mysql start\n\
service apache2 start\n\
su local_main_judger -c \"/opt/uoj/judger/judge_client start\"\n\
exec bash\n" >/opt/up && chmod +x /opt/up

/opt/up

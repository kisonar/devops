# Manual work
```
/u01/app/oracle/product/11.2.0/xe/config/scripts/init.ora -> set memory_target=1G
/u01/app/oracle/product/11.2.0/xe/config/scripts/initXETemp.ora -> set memory_target=1G

/etc/init.d/oracle-xe configure

netstat -tulpn

/etc/init.d/oracle-xe start
/etc/init.d/oracle-xe status

ORACLE_HOME=/u01/app/oracle/product/11.2.0/xe
export ORACLE_HOME

ORACLE_SID=XE
export ORACLE_SID
NLS_LANG=`$ORACLE_HOME/bin/nls_lang.sh`
export NLS_LANG
PATH=$ORACLE_HOME/bin:$PATH
export PATH
sqlplus /nolog

in sql connect
exex query
in sql disconnect
```
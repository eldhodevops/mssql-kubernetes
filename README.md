#Mssql
Install sqlcmd  for connection check after deployment:

Refer https://docs.microsoft.com/en-us/sql/linux/sql-server-linux-setup-tools?view=sql-server-2017#ubuntu

https://docs.microsoft.com/en-us/sql/t-sql/statements/grant-database-permissions-transact-sql?view=sql-server-2017

sqlcmd -S <servicename> -USA
```
# sqlcmd -S mssql-1-0 -USA
Password:
1> SELECT Name from sys.Databases
2> GO
Name
--------------------------------------------------------------------------------------------------------------------------------
master
tempdb
model
msdb
testDBQ
testeldho
```

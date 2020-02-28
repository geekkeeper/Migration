@echo off
set CCDIR=%~dp0
@echo on

cd /d %~dp0 
osql -S 127.0.0.1 -U sa -P HiODS-9527 -i %CCDIR%t1.sql

net stop MSSQL$HIODSHOLLYSYS
net start MSSQL$HIODSHOLLYSYS
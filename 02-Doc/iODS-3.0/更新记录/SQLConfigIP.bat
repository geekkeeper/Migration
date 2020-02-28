@echo off
set CCDIR=%~dp0
@echo on

echo Modify SQLServer TCPIP support......

@echo off
reg add "HKLM\SOFTWARE\Microsoft\Microsoft SQL Server\MSSQL13.HIODSHOLLYSYS\MSSQLServer\SuperSocketNetLib\Tcp\IPAll" /V "TcpPort" /T REG_SZ /D "1433" /F
@echo on
echo Modify OK 
echo restart sql server......
net stop MSSQL$HIODSHOLLYSYS
net start MSSQL$HIODSHOLLYSYS


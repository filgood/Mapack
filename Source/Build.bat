@echo off

set FrameworkPath=%SystemRoot%\Microsoft.NET\Framework\v2.0.50727
if exist "%FrameworkPath%\csc.exe" goto :start
set FrameworkPath=%SystemRoot%\Microsoft.NET\Framework\v4.0.30319
if exist "%FrameworkPath%\csc.exe" goto :start
:start

%FrameworkPath%\csc.exe /target:library /out:..\Build\Mapack.dll /doc:..\Build\Mapack.xml *.cs %1 /keyfile:KeyPair.snk
copy ReadMe.htm ..\Build

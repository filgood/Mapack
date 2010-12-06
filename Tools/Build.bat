@echo off

set FrameworkPath=%SystemRoot%\Microsoft.NET\Framework\v2.0.50727
if exist "%FrameworkPath%\csc.exe" goto :start
set FrameworkPath=%SystemRoot%\Microsoft.NET\Framework\v4.0.30319
if exist "%FrameworkPath%\csc.exe" goto :start
:start

if exist ..\Build rd /q /s ..\Build
md ..\Build

pushd ..\Source
%FrameworkPath%\csc.exe /target:library /out:..\Build\Mapack.dll /doc:..\Build\Mapack.xml *.cs /keyfile:KeyPair.snk %1 
copy ReadMe.htm ..\Build
popd

pushd ..\Example
%FrameworkPath%\csc.exe /target:exe /out:..\Build\Example.exe *.cs %1 /r:..\Build\Mapack.dll
popd
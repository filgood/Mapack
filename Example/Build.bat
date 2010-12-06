@echo off

set FrameworkPath=%SystemRoot%\Microsoft.NET\Framework\v2.0.50727
if exist "%FrameworkPath%\csc.exe" goto :start
set FrameworkPath=%SystemRoot%\Microsoft.NET\Framework\v4.0.30319
if exist "%FrameworkPath%\csc.exe" goto :start
:start

%FrameworkPath%\csc.exe /out:..\Build\Example.exe Example.cs /r:..\Build\Mapack.dll %1

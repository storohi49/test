
cd /d %~dp0

set CURDIR=%~dp0

echo %CURDIR%

REM call bundle exec rerun --no-notify ruby mainapp.rb
call bundle exec rerun --restart ruby mainapp.rb


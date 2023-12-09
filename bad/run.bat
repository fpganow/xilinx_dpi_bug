ech off
call set install_root=F:\Xilinx\Vivado\2023.2\

call %install_root%\bin\xsc function.c

call %install_root%\bin\xvlog -svlog file.sv

call %install_root%\bin\xelab work.m -sv_lib dpi -R

echo.
echo Result:
echo.
if %ERRORLEVEL% NEQ 0 (echo Compilation Error) ELSE (echo Compilation Success)

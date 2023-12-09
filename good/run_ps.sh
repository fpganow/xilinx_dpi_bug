#!/usr/bin/bash

export vivado_ver=2023.2
export vivado_drive="F"
export vivado_home="${vivado_drive}:\\Xilinx\\Vivado\\${vivado_ver}"
export vivado_bin="${vivado_home}\\bin"


echo "Run this from within WSL on a machine that has the Windows Version of Vivado installed"
echo "Edit this file and tweak the vivado_ver and vivado_drive variables"

powershell.exe ${vivado_bin}\\xsc.bat ./function.c -v
powershell.exe ${vivado_bin}\\xvlog.bat -svlog ./file.sv
powershell.exe ${vivado_bin}\\xelab.bat work.m -sv_lib dpi -R

ret_val=$(echo $?)
if [ "${ret_val}"  -eq "0" ]; then
    echo "SUCCESS"
else
    echo "FAILURE"
fi

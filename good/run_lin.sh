#!/usr/bin/bash

export vivado_ver=2023.2
export vivado_home="/tools/Xilinx/Vivado/${vivado_ver}"
export vivado_bin="${vivado_home}/bin"


echo "Edit this file and tweak the vivado_ver and vivado_home variables"

${vivado_bin}/xsc ./function.c -v
${vivado_bin}/xvlog -svlog ./file.sv
${vivado_bin}/xelab work.m -sv_lib dpi -R

ret_val=$(echo $?)
if [ "${ret_val}"  -eq "0" ]; then
    echo "SUCCESS"
else
    echo "FAILURE"
fi

# xilinx_dpi_bug
Repo to replicate compile issue with Vivado compilation of DPI on Windows 11

# From WSL

Update the variables:
- vivado_ver
- vivado_drive

in the files:
- bad/run_ps.sh
- good/run_ps.sh

# From Windows:

Update the variable
- install_root

in the files:
- bad/run.bat
- good/run.bat


the code in the bad directory will succeed very sporadically
the code in the good directory will fail very sporadically

The only difference is the use of passing a dynamic array in to the C function from SystemVerilog

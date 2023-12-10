# xilinx_dpi_bug
Repo to replicate compile issue with Vivado compilation of DPI on Windows 11

# Issue Compiling a SystemVerilog library that uses DPI and arrays:

```
D:\fpganow\xilinx_dpi_bug\ >

cd bad
.\run.bat

cd ..\good
.\run.bat
```

xelab.bat will finish without having the simulation run and without showing any error message.  Additionally the exit code will be either 1 or 2.
This occurs very frequently with the code in the *bad* directory, and very infrequently with the code in the *good* directory.
- the bad directory does not use any safe arrays
- the good directory uses a safe array as an input to the C function being called via the dpi library.

```
cd bad
.\run.bat
...
Starting simulation data flow analysis
Completed simulation data flow analysis
Time Resolution for simulation is 1ps
Compiling module work.m

Result:

Compilation Error
```

```
cd good
.\run.bat
...
****** xsim v2023.2 (64-bit)
  **** SW Build 4029153 on Fri Oct 13 20:14:34 MDT 2023
  **** IP Build 4028589 on Sat Oct 14 00:45:43 MDT 2023
  **** SharedData Build 4025554 on Tue Oct 10 17:18:54 MDT 2023
    ** Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
    ** Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.

source xsim.dir/work.m/xsim_script.tcl
# xsim {work.m} -autoloadwcfg -runall
Time resolution is 1 ps
run -all
STDOUT from C

PASSED
$finish called at time : 1 ns : File "D:/work/fpganow/xilinx_dpi_bug/good/file.sv" Line 17
exit
INFO: [Common 17-206] Exiting xsim at Sat Dec  9 20:03:02 2023...

Result:

Compilation Success
```

# To Replicate the issue

## From WSL with Xilinx Vivado 2023.2 installed on the host system running Windows:

Update the variables:
- vivado_ver
- vivado_drive

in the files:
- bad/run_ps.sh
- good/run_ps.sh

# From Windows with Xilinx Vivado 2023.2 installed:

Update the variable
- install_root

in the files:
- bad/run.bat
- good/run.bat

the code in the bad directory will succeed very sporadically
the code in the good directory will fail very sporadically

The only difference is the use of passing a dynamic array in to the C function from SystemVerilog

# From Linux with Xilinx Vivado 2023.2 installed in the /tools/Xilinx/Vivado/2023.2 directory:

Run either file:
- bad/run_lin.sh
- good/run_lin.sh
  
The issue has not been reproduced by me on a Linux/Ubuntu-22 install of Vivado 2023.2

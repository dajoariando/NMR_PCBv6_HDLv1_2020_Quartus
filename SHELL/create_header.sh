#!/bin/bash

sopc-create-header-files ../QUARTUS-SoC/CODE_qsys/soc_system.sopcinfo --single "./hps_soc_system.h" --module hps_0
# copy to the C folder
cp ./hps_soc_system.h "D:\GDrive\DS5_Workspace\nmr_pcb2.0_hdl1.0_2018\hps_soc_system.h"

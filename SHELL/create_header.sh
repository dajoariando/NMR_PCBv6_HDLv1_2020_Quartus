#!/bin/bash

sopc-create-header-files ../QUARTUS-SoC/CODE_qsys/soc_system_v5.sopcinfo --single "./hps_soc_system.h" --module hps_0
# copy to the C folder
cp ./hps_soc_system.h "D:\GDrive\WORKSPACES\DS5_2019\nmr_2019_pcb_v5\hps_soc_system.h"

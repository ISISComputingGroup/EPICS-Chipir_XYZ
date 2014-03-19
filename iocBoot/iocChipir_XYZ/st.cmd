#!../../bin/windows-x64/Chipir_XYZ

## You may have to change Chipir_XYZ to something else
## everywhere it appears in this file

< envPaths

cd ${TOP}

## Register all support components
dbLoadDatabase "dbd/Chipir_XYZ.dbd"
Chipir_XYZ_registerRecordDeviceDriver pdbbase

##ISIS## Run IOC initialisation 
< $(IOCSTARTUP)/init.cmd

## Load record instances

##ISIS## Load common DB records 
< $(IOCSTARTUP)/dbload.cmd

## Load our record instances
#dbLoadRecords("db/xxx.db","user=kvlb23Host")
epicsEnvSet "IOCNAME" "$(P=$(MYPVPREFIX))CHIPIR_XYZ"
#lvDCOMConfigure("frontpanel", "frontpanel", "$(TOP)/Chipir_XYZApp/protocol/Chipir_XYZ.xml", "ndxchipir", 6, "", "spudulike", "reliablebeam")
lvDCOMConfigure("frontpanel", "frontpanel", "$(TOP)/Chipir_XYZApp/protocol/Chipir_XYZ.xml", "", 6, "", "")
dbLoadRecords("$(TOP)/db/Chipir_XYZ.db","P=$(IOCNAME):")

##ISIS## Stuff that needs to be done after all records are loaded but before iocInit is called 
< $(IOCSTARTUP)/preiocinit.cmd

cd ${TOP}/iocBoot/${IOC}
iocInit

## Start any sequence programs
#seq sncxxx,"user=kvlb23Host"

##ISIS## Stuff that needs to be done after iocInit is called e.g. sequence programs 
< $(IOCSTARTUP)/postiocinit.cmd

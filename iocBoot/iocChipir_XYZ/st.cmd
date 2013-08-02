#!../../bin/windows-x64/Chipir_XYZ

## You may have to change Chipir_XYZ to something else
## everywhere it appears in this file

< envPaths

epicsEnvSet "IOCNAME" "$(P=$(MYPVPREFIX))CHIPIR_XYZ"
epicsEnvSet "IOCSTATS_DB" "$(DEVIOCSTATS)/db/iocAdminSoft.db"

cd ${TOP}

## Register all support components
dbLoadDatabase "dbd/Chipir_XYZ.dbd"
Chipir_XYZ_registerRecordDeviceDriver pdbbase

# Turn on asynTraceFlow and asynTraceError for global trace, i.e. no connected asynUser.
#asynSetTraceMask("", 0, 17)

## main args are:  portName, configSection, configFile, host, options (see lvDCOMConfigure() documentation in lvDCOMDriver.cpp)
##
## there are additional optional args to specify a DCOM ProgID for a compiled LabVIEW application 
## and a different username + password for remote host if that is required 
##
## the "options" argument is a combination of the following flags (as per the #lvDCOMOptions enum in lvDCOMInterface.h)
##    viWarnIfIdle=1, viStartIfIdle=2, viStopOnExitIfStarted=4, viAlwaysStopOnExit=8
#lvDCOMConfigure("frontpanel", "frontpanel", "$(TOP)/Chipir_XYZApp/protocol/Chipir_XYZ.xml", "ndxchipir", 6, "", "spudulike", "reliablebeam")
lvDCOMConfigure("frontpanel", "frontpanel", "$(TOP)/Chipir_XYZApp/protocol/Chipir_XYZ.xml", "", 6)

dbLoadRecords("$(TOP)/db/Chipir_XYZ.db","P=$(IOCNAME):")
dbLoadRecords("$(IOCSTATS_DB)","IOC=$(IOCNAME)")

#asynSetTraceMask("frontpanel",0,0xff)
asynSetTraceIOMask("ex1",0,0x2)

iocInit

TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#=============================

#=============================
# Build the IOC application

PROD_IOC = Chipir_XYZ
# Chipir_XYZ.dbd will be created and installed
DBD += Chipir_XYZ.dbd

# Chipir_XYZ.dbd will be made up from these files:
Chipir_XYZ_DBD += base.dbd
Chipir_XYZ_DBD += lvDCOM.dbd

# Include dbd files from all support applications:
Chipir_XYZ_DBD += devIocStats.dbd

# Add all the support libraries needed by this IOC
Chipir_XYZ_LIBS += devIocStats

# Chipir_XYZ_registerRecordDeviceDriver.cpp derives from Chipir_XYZ.dbd
Chipir_XYZ_SRCS += Chipir_XYZ_registerRecordDeviceDriver.cpp

# Build the main IOC entry point on workstation OSs.
Chipir_XYZ_SRCS_DEFAULT += Chipir_XYZMain.cpp
Chipir_XYZ_SRCS_vxWorks += -nil-

# Add support from base/src/vxWorks if needed
#Chipir_XYZ_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

Chipir_XYZ_LIBS +=  lvDCOMSupport asyn autosave
Chipir_XYZ_SYS_LIBS_WIN32 += msxml2

# Finally link to the EPICS Base libraries
Chipir_XYZ_LIBS += $(EPICS_BASE_IOC_LIBS)

#===========================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE


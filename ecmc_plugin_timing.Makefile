#
#  Copyright (c) 2019            Jeong Han Lee
#  Copyright (c) 2018 - 2019     European Spallation Source ERIC
#
#  The program is free software: you can redistribute
#  it and/or modify it under the terms of the GNU General Public License
#  as published by the Free Software Foundation, either version 2 of the
#  License, or any newer version.
#
#  This program is distributed in the hope that it will be useful, but WITHOUT
#  ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
#  FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
#  more details.
#
#  You should have received a copy of the GNU General Public License along with
#  this program. If not, see https://www.gnu.org/licenses/gpl-2.0.txt
#
# 
# Author  : Jeong Han Lee
# email   : han.lee@esss.se
# Date    : Thursday, March 28 23:06:01 CET 2019
# version : 0.0.4
#

where_am_I := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))
include $(E3_REQUIRE_TOOLS)/driver.makefile
include $(E3_REQUIRE_CONFIG)/DECOUPLE_FLAGS

ifneq ($(strip $(ASYN_DEP_VERSION)),)
asyn_VERSION=$(ASYN_DEP_VERSION)
endif

ifneq ($(strip $(ECMC_DEP_VERSION)),)
ecmc_VERSION=$(ECMC_DEP_VERSION)
endif

# 
APPSRC_ECMC := ecmc_plugin_timing

#APPINC := $(PATCH_DIR)/include
USR_CFLAGS   += -shared -fPIC -Wall -Wextra

# c++17 not allowed because of centos 7
#USR_CPPFLAGS += -shared -fPIC -Wall -Wextra -std=c++17
USR_CPPFLAGS += -shared -fPIC -Wall -Wextra
USR_LDFLAGS  += -lstdc++ 

#USR_INCLUDES += -I$(where_am_I)/include

# Don't include debug symbols in the binary needed for a debugger
# We don't have a debuuger, so shrink the size from 29MB to 9MB under
# /opt/epics/modules
OPT_CXXFLAGS_YES = -O3

SOURCES+=$(APPSRC_ECMC)/ecmcPluginTiming.c

#DBDS    += $(APPSRC_ECMC)/ecmcTiming.dbd

db: 
.PHONY: db 
#
.PHONY: vlibs
vlibs:
#

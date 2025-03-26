#
# Copyright (C) 2025 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

import common
import os
import sys
import time

def FullOTA_InstallEnd(info):
  info.script.AppendExtra('mount("ext4", "EMMC", "/dev/block/platform/hi_mci.0/by-name/system", "/system", "");')
  info.script.AppendExtra('assert(run_program("/sbin/rm", "/system/app/Bluetooth/Bluetooth.apk") == 0 || abort("Could not delete Bluetooth!"););')
  info.script.AppendExtra('unmount("/system");')

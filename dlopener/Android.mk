#
# Copyright (C) 2025 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_SRC_FILES := dlopen.c
LOCAL_32_BIT_ONLY := true
LOCAL_MODULE := dlopen32
include $(BUILD_EXECUTABLE)

include $(CLEAR_VARS)
LOCAL_SRC_FILES := dlopen.c
LOCAL_MODULE := dlopen64
include $(BUILD_EXECUTABLE)

# Copyright (C) 2016 The CyanogenMod Project
# Copyright (C) 2016 The MoKee Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

LOCAL_PATH:= $(call my-dir)

#
# MK Audio Service
#
include $(CLEAR_VARS)

LOCAL_PACKAGE_NAME := MKAudioService

LOCAL_STATIC_JAVA_LIBRARIES := org.mokee.platform.internal

LOCAL_SRC_FILES := $(call all-java-files-under, src)

LOCAL_RESOURCE_DIR := $(LOCAL_PATH)/res

LOCAL_PROGUARD_ENABLED := disabled

LOCAL_JNI_SHARED_LIBRARIES := libmkaudio_jni

LOCAL_PRIVILEGED_MODULE := true

# Sign the package when not using test-keys
ifneq ($(DEFAULT_SYSTEM_DEV_CERTIFICATE),build/target/product/security/testkey)
LOCAL_CERTIFICATE := cyngn-priv-app
endif

include $(BUILD_PACKAGE)

ifeq ($(strip $(LOCAL_PACKAGE_OVERRIDES)),)

# make jni
include $(call all-makefiles-under, $(LOCAL_PATH))

endif

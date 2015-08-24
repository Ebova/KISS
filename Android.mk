LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)
LOCAL_MODULE := KISS

module_root := $(LOCAL_PATH)
module_dir := KISS
module_out := $(OUT_DIR)/target/common/obj/apps/$(LOCAL_MODULE)_intermediates
module_build := $(module_root)/$(module_dir)/build
module_apk := build/outputs/apk/$(LOCAL_MODULE)-release-unsigned.apk

$(module_root)/$(module_dir)/$(module_apk):
    rm -Rf $(module_build)
    mkdir -p $(module_out)
    ln -s $(module_out) $(module_build)
    cd $(module_root)/$(module_dir) && gradle assembleRelease

LOCAL_CERTIFICATE := platform
LOCAL_SRC_FILES := $(module_dir)/$(module_apk)
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_SUFFIX := $(COMMON_ANDROID_PACKAGE_SUFFIX)

include $(BUILD_PREBUILT)
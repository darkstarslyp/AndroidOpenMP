LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)


LOCAL_MODULE := native-lib


LOCAL_SRC_FILES := $(abspath ${LOCAL_PATH}/../..)/app/src/main/cpp/native-lib.cpp


LOCAL_LDLIBS += -fopenmp

LOCAL_CPPFLAGS += -fopenmp
LOCAL_CFLAGS += -fopenmp
LOCAL_LDFLAGS += -lgomp

include $(BUILD_SHARED_LIBRARY)
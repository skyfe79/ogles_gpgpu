# Must define the LOCAL_PATH and return the current dir
LOCAL_PATH := $(call my-dir)
# Cleans various variables... making a clean build
include $(CLEAR_VARS)

# Set path to ogles_gpgpu source
OG_SRC_PATH=../../../../ogles_gpgpu

# Identify the module/library's name
LOCAL_MODULE := og_jni_wrapper

LOCAL_C_INCLUDES += $(OG_SRC_PATH)

LOCAL_CFLAGS    += -DDEBUG
LOCAL_CFLAGS	+= -DOGLES_GPGPU_BENCHMARK

# Specify the source files
LOCAL_SRC_FILES := \
	og_jni_wrapper.cpp \
	og_pipeline.cpp \
	$(OG_SRC_PATH)/common/core.cpp \
	$(OG_SRC_PATH)/common/tools.cpp \
	$(OG_SRC_PATH)/common/gl/fbo.cpp \
	$(OG_SRC_PATH)/common/gl/memtransfer.cpp \
	$(OG_SRC_PATH)/common/gl/memtransfer_factory.cpp \
	$(OG_SRC_PATH)/common/gl/shader.cpp \
	$(OG_SRC_PATH)/common/proc/disp.cpp \
	$(OG_SRC_PATH)/common/proc/grayscale.cpp \
	$(OG_SRC_PATH)/common/proc/thresh.cpp \
	$(OG_SRC_PATH)/common/proc/base/filterprocbase.cpp \
	$(OG_SRC_PATH)/common/proc/base/multipassproc.cpp \
	$(OG_SRC_PATH)/common/proc/base/procbase.cpp \
	$(OG_SRC_PATH)/common/proc/multipass/adapt_thresh_pass.cpp \
	$(OG_SRC_PATH)/common/proc/multipass/gauss_pass.cpp \
	$(OG_SRC_PATH)/platform/android/egl.cpp \
	$(OG_SRC_PATH)/platform/android/memtransfer_android.cpp 

# Load local libraries
LOCAL_LDLIBS += -llog -ldl  -landroid -lGLESv2 -lEGL

# Build the shared library defined above
include $(BUILD_SHARED_LIBRARY)

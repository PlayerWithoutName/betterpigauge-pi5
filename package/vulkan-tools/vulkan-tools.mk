################################################################################
#
# vulkan-tools
#
################################################################################

VULKAN_TOOLS_VERSION = $(VULKAN_HEADERS_VERSION)
VULKAN_TOOLS_SITE = $(call github,KhronosGroup,Vulkan-Tools,v$(VULKAN_TOOLS_VERSION))
VULKAN_TOOLS_LICENSE = Apache-2.0
VULKAN_TOOLS_LICENSE_FILES = LICENSE.txt

VULKAN_TOOLS_DEPENDENCIES = \
	vulkan-headers \
	vulkan-loader \
	vulkan-sdk

VULKAN_TOOLS_CONF_OPTS += \
	-DBUILD_CUBE=ON \
	-DBUILD_ICD=OFF \
	-DBUILD_VULKANINFO=ON \
	-DINSTALL_ICD=OFF \
	-DBUILD_WSI_DIRECTFB_SUPPORT=OFF

ifeq ($(BR2_PACKAGE_LIBXCB),y)
VULKAN_TOOLS_DEPENDENCIES += libxcb
VULKAN_TOOLS_CONF_OPTS += \
	-DBUILD_WSI_XCB_SUPPORT=ON \
	-DBUILD_WSI_XLIB_SUPPORT=ON
else
VULKAN_TOOLS_CONF_OPTS += \
	-DBUILD_WSI_XCB_SUPPORT=OFF \
	-DBUILD_WSI_XLIB_SUPPORT=OFF
endif

ifeq ($(BR2_PACKAGE_WAYLAND),y)
VULKAN_TOOLS_DEPENDENCIES += wayland
VULKAN_TOOLS_CONF_OPTS += -DBUILD_WSI_WAYLAND_SUPPORT=ON
else
VULKAN_TOOLS_CONF_OPTS += -DBUILD_WSI_WAYLAND_SUPPORT=OFF
endif

$(eval $(cmake-package))

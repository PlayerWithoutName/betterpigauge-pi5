################################################################################
#
# edk2-platforms
#
################################################################################

# Keep in sync with latest commit as of the release date for boot/edk2
EDK2_PLATFORMS_VERSION = 92f7d69e8aa31e0ae06d4dabbcee12f4ebdb78ed
EDK2_PLATFORMS_SITE = $(call github,tianocore,edk2-platforms,$(EDK2_PLATFORMS_VERSION))
EDK2_PLATFORMS_LICENSE = BSD-2-Clause-Patent
EDK2_PLATFORMS_LICENSE_FILES = License.txt
EDK2_PLATFORMS_INSTALL_TARGET = NO
EDK2_PLATFORMS_INSTALL_STAGING = YES

# There is nothing to build for edk2-platforms. All we need to do is to copy
# all description files to staging, for other packages to build with.
define EDK2_PLATFORMS_INSTALL_STAGING_CMDS
	mkdir -p $(STAGING_DIR)/usr/share/edk2-platforms
	cp -rf $(@D)/*/ $(STAGING_DIR)/usr/share/edk2-platforms/
endef

$(eval $(generic-package))

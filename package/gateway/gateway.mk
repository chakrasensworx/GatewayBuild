################################################################################
#
######################## 	SensWorx Application	############################
#
################################################################################
GATEWAY_VERSION = 1.0
GATEWAY_DEPENDENCIES = libxml2 libcurl

GATEWAY_OVERRIDE_SRCDIR = $(TOPDIR)/../trunk
GATEWAY_INSTALL_TARGET = YES

define GATEWAY_BUILD_CMDS
     $(TARGET_MAKE_ENV) $(MAKE) CC="$(TARGET_CC)" -C $(@D) all
endef

define GATEWAY_INSTALL_TARGET_CMDS
	rm -rf $(TARGET_DIR)/etc/network/interfaces
	rm -rf $(TARGET_DIR)/etc/ppp/peers/fona
	rm -rf $(TARGET_DIR)/etc/sensworx_gateway.conf
	$(INSTALL) -D -m 0755 $(@D)/gateway $(TARGET_DIR)/usr/bin/
	$(INSTALL) -D -m 0755 $(@D)/gateway_console $(TARGET_DIR)/usr/bin/
	$(INSTALL) -D -m 0755 $(@D)/gateway_testing $(TARGET_DIR)/usr/bin/
	rsync -avz $(@D)/etc $(TARGET_DIR)/
endef

$(eval $(generic-package))

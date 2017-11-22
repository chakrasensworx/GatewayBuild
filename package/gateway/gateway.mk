GATEWAY_VERSION = 1.0
GATEWAY_DEPENDENCIES = \
libxml2 libcurl

GATEWAY_OVERRIDE_SRCDIR = $(TOPDIR)/../trunk
GATEWAY_INSTALL_TARGET = YES

define GATEWAY_CLEAN_CMDS
    $(MAKE) CC="$(TARGET_CC)" -C $(@D) clean 
endef

define GATEWAY_BUILD_CMDS
    $(MAKE) CC="$(TARGET_CC)" -C $(@D) clean 
    $(MAKE) CC="$(TARGET_CC)" -C $(@D) all
endef

define GATEWAY_CLEAN_CMDS
	$(MAKE) -C $(@D) clean
endef

define GATEWAY_INSTALL_TARGET_CMDS
	rm -rf $(TARGET_DIR)/etc/network/interfaces
	rm -rf $(TARGET_DIR)/etc/ppp/peers/fona
	rm -rf $(TARGET_DIR)/etc/sensworx_gateway.conf
	$(INSTALL) -D -m 0755 $(@D)/gateway $(TARGET_DIR)/usr/bin/
	rsync -avz $(@D)/etc $(TARGET_DIR)/
@echo "Harini"
endef

define GATEWAY_UNINSTALL_TARGET_CMDS
	rm -f $(TARGET_DIR)/usr/bin/gateway
endef

$(eval $(generic-package))

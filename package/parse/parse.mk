################################################################################
#
# parse 
#
################################################################################
PARSE_VERSION = master
PARSE_SDK	= parse-embedded-sdks-$(PARSE_VERSION)
PARSE_SOURCE = parse-embedded-sdks-$(PARSE_VERSION).zip
PARSE_SITE = https://github.com/parse-community/parse-embedded-sdks
PARSE_LICENSE = Parse 
PARSE_LICENSE_FILES = LICENSE 
PARSE_INSTALL_STAGING = YES
PARSE_DEPENDANCIES = libcurl libuuid host-pkgconf host-autoconf
PARSE_AUTORECONF = YES

define PARSE_EXTRACT_CMDS
	rm -rf $(@D)
	$(UNZIP) $(DL_DIR)/$(PARSE_SOURCE) -d $(@D)
	mv $(@D)/$(PARSE_SDK)/* $(@D)
	mkdir $(@D)/m4
	touch $(@D)/README
	rm -rf $(@D)/$(PARSE_SDK)
endef


$(eval $(autotools-package))
$(eval $(host-autotools-package))

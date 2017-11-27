################################################################################
#
# parse 
#
################################################################################
PARSE_VERSION = master
PARSE_SOURCE = $(PARSE_VERSION).zip
PARSE_SDK = parse-embedded-sdks
PARSE_UNZIP_DIR = $(PARSE_SDK)-$(PARSE_VERSION)
PARSE_SITE = https://github.com/parse-community/$(PARSE_SDK)/archive
PARSE_LICENSE = Parse
PARSE_LICENSE_FILES = LICENSE
PARSE_INSTALL_STAGING = YES
PARSE_DEPENDENCIES = libcurl util-linux host-pkgconf host-autoconf
PARSE_AUTORECONF = YES

define PARSE_EXTRACT_CMDS
	$(UNZIP) -d $(@D) $(DL_DIR)/$(PARSE_SOURCE)
	mv $(@D)/$(PARSE_UNZIP_DIR)/* $(@D)
	rm -rf $(@D)/$(PARSE_SDK)
	mkdir $(@D)/m4
	touch $(@D)/README
endef


$(eval $(autotools-package))

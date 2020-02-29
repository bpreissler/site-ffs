GLUON_FEATURES := \
	autoupdater \
	ebtables-filter-multicast \
	ebtables-filter-ra-dhcp \
	mesh-batman-adv-15 \
	mesh-vpn-fastd \
	radv-filterd \
	respondd \
	alfred \
	status-page \
	web-advanced \
	web-wizard

GLUON_SITE_PACKAGES := \
	gluon-config-mode-zip \
	gluon-web-private-wifi \
	gluon-web-mesh-vpn-fastd \
	gluon-neighbour-info \
	gluon-mesh-vpn-fastd \
	gluon-ssid-changer \
	haveged \
	iptables \
	iwinfo \
	ffs-set-segment \
	ffs-watchdog

ADD_DRIVERS_X86 := \
	kmod-8139too \
	kmod-ath \
	kmod-ath9k-common \
	kmod-ath9k-htc \
	kmod-atl2 \
	kmod-brcmfmac \
	kmod-carl9170 \
	kmod-forcedeth \
	kmod-igb \
	kmod-mii \
	kmod-nls-base \
	kmod-r8169 \
	kmod-rt73-usb \
	kmod-rtl8187 \
	kmod-rtl8192cu \
	kmod-sky2 \
	kmod-usb-core \
	kmod-usb-hid \
	kmod-usb-net \
	kmod-usb-net-asix \
	kmod-usb-net-asix \
	kmod-usb-net-asix-ax88179 \
	kmod-usb-net-cdc-eem \
	kmod-usb-net-cdc-ether \
	kmod-usb-net-cdc-mbim \
	kmod-usb-net-cdc-ncm \
	kmod-usb-net-cdc-subset \
	kmod-usb-net-dm9601-ether \
	kmod-usb-net-hso \
	kmod-usb-net-huawei-cdc-ncm \
	kmod-usb-net-ipheth \
	kmod-usb-net-kalmia \
	kmod-usb-net-kaweth \
	kmod-usb-net-mcs7830 \
	kmod-usb-net-pegasus \
	kmod-usb-net-qmi-wwan \
	kmod-usb-net-rndis \
	kmod-usb-net-rtl8152 \
	kmod-usb-net-sierrawireless \
	kmod-usb-net-smsc95xx \
	kmod-usb-ohci-pci \
	kmod-usb2

# add addition network drivers and usb support only to targes where disk space does not matter.
ifeq ($(GLUON_TARGET),x86-generic)
GLUON_SITE_PACKAGES += \
	$(ADD_DRIVERS_X86)
endif

ifeq ($(GLUON_TARGET),x86-64)
GLUON_SITE_PACKAGES += \
	$(ADD_DRIVERS_X86)
endif

DEFAULT_BUILD_DATE := $(shell date '+%Y-%m-%d')

FFS_BUILD_DATE ?= $(DEFAULT_BUILD_DATE)

DEFAULT_GLUON_RELEASE := 1.9+$(FFS_BUILD_DATE)-g.$(shell git -C $(GLUON_SITEDIR)/gluon log --pretty=format:'%h' -n 1)-s.$(shell git -C $(GLUON_SITEDIR) log --pretty=format:'%h' -n 1)

GLUON_LANGS := de en

# Allow overriding the release number from the command line
GLUON_RELEASE ?= $(DEFAULT_GLUON_RELEASE)

# Region code required for some images; supported values: us eu
GLUON_REGION ?= eu

# Default priority for updates.
GLUON_PRIORITY ?= 0.1

#enable generation of images for ath10k devices with ibss mode
GLUON_WLAN_MESH ?= 11s

# only build upgrade images for legacy devices
GLUON_DEPRECATED ?= upgrade

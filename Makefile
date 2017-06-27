THEOS_DEVICE_IP = 192.168.199.108
THEOS_DEVICE_PORT = 22

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = FLEXLoader
FLEXLoader_FILES = Tweak.xm

include $(THEOS_MAKE_PATH)/tweak.mk

before-package::
	@echo "Run FLEX dylib build script..."
	./build_dylib.sh

after-install::
	install.exec "killall -9 SpringBoard"

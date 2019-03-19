ARCHS = arm64

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = DailyPaper
DailyPaper_FILES = $(wildcard *.m) Tweak.xm NCHax.x
DailyPaper_FRAMEWORKS = UIKit CoreGraphics
DailyPaper_PRIVATE_FRAMEWORKS = PersistentConnection PhotoLibrary SpringBoardFoundation
DailyPaper_EXTRA_FRAMEWORKS = Cephei

include $(THEOS_MAKE_PATH)/tweak.mk

SUBPROJECTS += prefs weeapp
include $(THEOS_MAKE_PATH)/aggregate.mk

after-install::
	install.exec "killall -9 SpringBoard"

{ ... }: {
  # General UI/UX
  system.defaults.NSGlobalDomain = {
    AppleShowScrollBars = "Always";
    NSWindowResizeTime = 0.001;
    NSNavPanelExpandedStateForSaveMode = true;
    NSNavPanelExpandedStateForSaveMode2 = true;
    PMPrintingExpandedStateForPrint = true;
    PMPrintingExpandedStateForPrint2 = true;
    ApplePressAndHoldEnabled = false;
    KeyRepeat = 1;
    InitialKeyRepeat = 10;
    "com.apple.springing.enabled" = true;
    "com.apple.springing.delay" = 0.0;
    "com.apple.mouse.tapBehavior" = 1;
    AppleShowAllExtensions = true;
  };

  # Trackpad
  system.defaults.trackpad.Clicking = true;

  # Dock
  system.defaults.dock = {
    tilesize = 36;
    minimize-to-application = true;
    show-process-indicators = true;
    mru-spaces = false;
    show-recents = false;
  };

  # Finder
  system.defaults.finder = {
    ShowStatusBar = true;
    ShowPathbar = true;
    FXDefaultSearchScope = "SCcf";
    FXEnableExtensionChangeWarning = false;
    _FXSortFoldersFirst = true;
    FXPreferredViewStyle = "icnv";
    NewWindowTarget = "PfDe";
    NewWindowTargetPath = "file://\${HOME}/Desktop/";
    WarnOnEmptyTrash = false;
  };

  # Screenshots
  system.defaults.screencapture = {
    location = "~/Desktop";
    type = "png";
    disable-shadow = true;
  };

  # Custom preferences
  system.defaults.CustomUserPreferences = {
    "com.apple.print.PrintingPrefs" = {
      "Quit When Finished" = true;
    };
    "com.apple.desktopservices" = {
      DSDontWriteNetworkStores = true;
      DSDontWriteUSBStores = true;
    };
    "com.apple.universalaccess" = {
      closeViewScrollWheelToggle = true;
      HIDScrollZoomModifierMask = 262144;
    };
  };

  # PlistBuddy commands for Finder icon view settings
  system.activationScripts.extraUserDefaults.text = ''
    /usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:showItemInfo true" ~/Library/Preferences/com.apple.finder.plist 2>/dev/null || true
    /usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:showItemInfo true" ~/Library/Preferences/com.apple.finder.plist 2>/dev/null || true
    /usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:showItemInfo true" ~/Library/Preferences/com.apple.finder.plist 2>/dev/null || true
    /usr/libexec/PlistBuddy -c "Set DesktopViewSettings:IconViewSettings:labelOnBottom false" ~/Library/Preferences/com.apple.finder.plist 2>/dev/null || true
    /usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist 2>/dev/null || true
    /usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist 2>/dev/null || true
    /usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist 2>/dev/null || true
  '';
}

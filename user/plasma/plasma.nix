# plasma conifig; split into multiple modules
# and reload based on NixAYO
{ ... }:
{
  # I dunnoi
  imports = [
  ];
 # enable plasma?
  programs.plasma = {
    enable = true;
    
    # set MMB on desktop
    desktop.mouseActions.middleClick = "applicationLauncher";


    # walls
    workspace.wallpaper = "/home/igor/.dotfiles/user/plasma/walls/cool.jpg";
    kscreenlocker.appearance.wallpaper = "/home/igor/.dotfiles/user/plasma/walls/fox-clearing.png";

    # keyboard layouts
    input.keyboard.layouts = [
      { 
        layout = "us";
        variant = "euro";
      }
      {
        layout = "at";
      }
      {
        layout = "pl";
      }
    ];

    #shortcuts 
    shortcuts = {
      # korhnkite shortcuts 
      "kwin"."KrohnkiteFloatAll" = "Meta+Shift+F,none,Krohnkite: Toggle Float All";
      "kwin"."KrohnkiteFocusDown" = "Meta+J,none,Krohnkite: Focus Down";
      "kwin"."KrohnkiteFocusLeft" = "Meta+H,none,Krohnkite: Focus Left";
      "kwin"."KrohnkiteFocusUp" = "Meta+K,none,Krohnkite: Focus Up";
      "kwin"."KrohnkiteGrowHeight" = "Meta+Ctrl+J,none,Krohnkite: Grow Height";
      "kwin"."KrohnkiteIncrease" = "Meta+I,none,Krohnkite: Increase";
      "kwin"."KrohnkiteMonocleLayout" = "Meta+M,none,Krohnkite: Monocle Layout";
      "kwin"."KrohnkiteNextLayout" = "Meta+\\\\,none,Krohnkite: Next Layout";
      "kwin"."KrohnkitePreviousLayout" = "Meta+|,none,Krohnkite: Previous Layout";
      "kwin"."KrohnkiteSetMaster" = "Meta+Return,none,Krohnkite: Set master";
      "kwin"."KrohnkiteShiftDown" = "Meta+Shift+J,none,Krohnkite: Move Down/Next";
      "kwin"."KrohnkiteShiftLeft" = "Meta+Shift+H,none,Krohnkite: Move Left";
      "kwin"."KrohnkiteShiftRight" = "Meta+Shift+L,none,Krohnkite: Move Right";
      "kwin"."KrohnkiteShiftUp" = "Meta+Shift+K,none,Krohnkite: Move Up/Prev";
      "kwin"."KrohnkiteShrinkHeight" = "Meta+Ctrl+K,none,Krohnkite: Shrink Height";
      "kwin"."KrohnkiteShrinkWidth" = "Meta+Ctrl+H,none,Krohnkite: Shrink Width";
      "kwin"."KrohnkiteSpiralLayout" = "Meta+\\,,none,Krohnkite: Spiral Layout";
      "kwin"."KrohnkitegrowWidth" = "Meta+Ctrl+L,none,Krohnkite: Grow Width";

      # window management shortcuts 
      "kwin"."MinimizeAll" = "Meta+D,none,MinimizeAll";
      "kwin"."Overview" = "Meta+W";
      "kwin"."Switch One Desktop Down" = "Ctrl+F3";
      "kwin"."Switch One Desktop Up" = "Ctrl+F4";
      "kwin"."Switch One Desktop to the Left" = "Ctrl+F2";
      "kwin"."Switch One Desktop to the Right" = "Ctrl+F1";
     
      "kwin"."Walk Through Windows" = "Alt+Tab";
      "kwin"."Window Close" = ["Meta+Q" "Alt+F4,Alt+F4,Close Window"];
      "kwin"."Window Maximize" = "Meta+PgUp";
      "kwin"."Window Minimize" = "Meta+PgDown";
      "kwin"."Window One Desktop Down" = "Meta+Ctrl+Shift+Down";
      "kwin"."Window One Desktop Up" = "Meta+Ctrl+Shift+Up";
      "kwin"."Window One Desktop to the Left" = "Meta+Ctrl+Shift+Left";
      "kwin"."Window One Desktop to the Right" = "Meta+Ctrl+Shift+Right";
      "kwin"."Window Quick Tile Bottom" = "Meta+Down";
      "kwin"."Window Quick Tile Left" = "Meta+Left";
      "kwin"."Window Quick Tile Right" = "Meta+Right";
      "kwin"."Window Quick Tile Top" = "Meta+Up";
      
      # my app shortcuts
      "plasmashell"."activate application launcher" = ["Meta,Meta" "Alt+F1,Activate Application Launcher"];
      
      "plasmashell"."clipboard_action" = "Meta+Ctrl+X";
      "plasmashell"."cycle-panels" = "Meta+Alt+P";
      "plasmashell"."show-on-mouse-pos" = "Meta+V";

      "services/Alacritty.desktop"."_launch" = "Meta+X";
      "services/firefox.desktop"."_launch" = "Meta+B";
      "services/firefox.desktop"."new-private-window" = "Meta+Shift+B";
      "services/obsidian.desktop"."_launch" = "Meta+O";

      "services/org.kde.krunner.desktop"."_launch" = "Alt+Space";
      "services/org.kde.plasma-systemmonitor.desktop"."_launch" = "Meta+`";
      "services/org.kde.plasma.emojier.desktop"."_launch" = "Meta+.";
      "services/org.kde.spectacle.desktop"."RectangularRegionScreenShot" = "Meta+Shift+S";
      "services/org.kde.spectacle.desktop"."_launch" = "Print";
      "services/systemsettings.desktop"."_launch" = "Meta+Esc";
    };

    configFile = {

      # visuals
      "kcminputrc"."Mouse"."cursorTheme" = "catppuccin-mocha-lavender-cursors";
      "kdeglobals"."General"."font" = "Noto Sans,10,-1,5,400,0,0,0,0,0,0,0,0,0,0,1";
      "kdeglobals"."Icons"."Theme" = "breeze-dark";
      "ksplashrc"."KSplash"."Theme" = "a2n.kuro";
      
      # no idea 
      "kdeglobals"."KFileDialog Settings"."Allow Expansion" = false;
      "kdeglobals"."KFileDialog Settings"."Automatically select filename extension" = true;
      "kdeglobals"."KFileDialog Settings"."Breadcrumb Navigation" = true;
      "kdeglobals"."KFileDialog Settings"."Decoration position" = 2;
      "kdeglobals"."KFileDialog Settings"."LocationCombo Completionmode" = 5;
      "kdeglobals"."KFileDialog Settings"."PathCombo Completionmode" = 5;
      "kdeglobals"."KFileDialog Settings"."Show Bookmarks" = false;
      "kdeglobals"."KFileDialog Settings"."Show Full Path" = false;
      "kdeglobals"."KFileDialog Settings"."Show Inline Previews" = true;
      "kdeglobals"."KFileDialog Settings"."Show Preview" = false;
      "kdeglobals"."KFileDialog Settings"."Show Speedbar" = true;
      "kdeglobals"."KFileDialog Settings"."Show hidden files" = true;
      "kdeglobals"."KFileDialog Settings"."Sort by" = "Name";
      "kdeglobals"."KFileDialog Settings"."Sort directories first" = true;
      "kdeglobals"."KFileDialog Settings"."Sort hidden files last" = true;
      "kdeglobals"."KFileDialog Settings"."Sort reversed" = false;
      "kdeglobals"."KFileDialog Settings"."Speedbar Width" = 140;
      "kdeglobals"."KFileDialog Settings"."View Style" = "DetailTree";

      "kdeglobals"."WM"."activeBackground" = "49,54,59";
      "kdeglobals"."WM"."activeBlend" = "252,252,252";
      "kdeglobals"."WM"."activeForeground" = "252,252,252";
      "kdeglobals"."WM"."inactiveBackground" = "42,46,50";
      "kdeglobals"."WM"."inactiveBlend" = "161,169,177";
      "kdeglobals"."WM"."inactiveForeground" = "161,169,177";

      # Desktops

      "kwinrc"."Desktops"."Id_1" = "df3d8330-9ddd-48f6-97dc-b6f8d483370a";
      "kwinrc"."Desktops"."Id_2" = "69923433-b754-4ac8-a5e2-e56d74b57782";
      "kwinrc"."Desktops"."Id_3" = "857f14b7-3f74-4255-9417-7c22e354d686";
      "kwinrc"."Desktops"."Id_4" = "f21f7522-e948-46d1-baa1-e3dda4dbfeaf";
      "kwinrc"."Desktops"."Id_5" = "fa51b701-4f88-4160-9673-0e57e66b25e3";
      "kwinrc"."Desktops"."Id_6" = "d02e91bc-0462-43ac-b87a-17d657120a41";
      "kwinrc"."Desktops"."Id_7" = "8ea9a27e-5d30-4ad4-bcd3-5de5d5a4c9ff";
      "kwinrc"."Desktops"."Id_8" = "b869d9be-b3f8-4e62-a8dc-5e415b732624";
      "kwinrc"."Desktops"."Number" = 8;
      "kwinrc"."Desktops"."Rows" = 2;

      # Kwin plugins
      "kwinrc"."Plugins"."krohnkiteEnabled" = true;
      "kwinrc"."Plugins"."minimizeallEnabled" = true;
      
      # Tiling config
      "kwinrc"."Script-krohnkite"."enableFloatingLayout" = true;
      "kwinrc"."Script-krohnkite"."screenGapBottom" = 10;
      "kwinrc"."Script-krohnkite"."screenGapLeft" = 10;
      "kwinrc"."Script-krohnkite"."screenGapRight" = 10;
      "kwinrc"."Script-krohnkite"."screenGapTop" = 10;
      "kwinrc"."Script-krohnkite"."tileLayoutGap" = 10;
      "kwinrc"."Tiling"."padding" = 4;
      "kwinrc"."Tiling/7fb20a58-cc22-505d-87d4-c4725ee3ccb3"."tiles" = "{\"layoutDirection\":\"horizontal\",\"tiles\":[{\"width\":0.25},{\"width\":0.5},{\"width\":0.25}]}";
      "kwinrc"."Tiling/8e8627ee-ca90-59c0-a3de-c8c3d2e00fc2"."tiles" = "{\"layoutDirection\":\"horizontal\",\"tiles\":[{\"width\":0.25},{\"width\":0.5},{\"width\":0.25}]}";
      "kwinrc"."Tiling/92e842d7-5928-5c43-884a-4912e7cc82ed"."tiles" = "{\"layoutDirection\":\"horizontal\",\"tiles\":[{\"width\":0.25},{\"width\":0.5},{\"width\":0.25}]}";

      # No clue
      "kdeglobals"."General"."TerminalApplication" = "alacritty";
      "kdeglobals"."General"."TerminalService" = "Alacritty.desktop";

      "plasmanotifyrc"."Applications/firefox"."Seen" = true;
      "spectaclerc"."ImageSave"."translatedScreenshotsFolder" = "Screenshots";
      "spectaclerc"."VideoSave"."translatedScreencastsFolder" = "Screencasts";
    };
    dataFile = {
      "dolphin/view_properties/global/.directory"."Settings"."HiddenFilesShown" = true;
    };
  };
}

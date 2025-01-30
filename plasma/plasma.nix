# plasma conifig; split into multiple modules
# and reload based on NixAYO
{ pkgs, ... }:
{
  imports = [
  ];

  programs.plasma = {
    enable = true;

    desktop.mouseActions.middleClick = "applicationLauncher";

    workspace.wallpaper = "/home/igor/.dotfiles/plasma/walls/cool.jpg";
    kscreenlocker.appearance.wallpaper = "/home/igor/.dotfiles/plasma/walls/fox-clearing.png";




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

    shortcuts = {
      "KDE Keyboard Layout Switcher"."Switch to Next Keyboard Layout" = "Meta+Alt+K";
 
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

      "plasmashell"."activate application launcher" = ["Meta,Meta" "Alt+F1,Activate Application Launcher"];

      "services/Alacritty.desktop"."_launch" = "Meta+X";
      "services/firefox.desktop"."_launch" = "Meta+B";
      "services/firefox.desktop"."new-private-window" = "Meta+Shift+B";
      "services/org.kde.plasma-systemmonitor.desktop"."_launch" = "Meta+`";
      "services/systemsettings.desktop"."_launch" = "Meta+Esc";
    };

    configFile = {
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

      "kwinrc"."Desktops"."Id_1" = "df3d8330-9ddd-48f6-97dc-b6f8d483370a";
      "kwinrc"."Desktops"."Id_2" = "69923433-b754-4ac8-a5e2-e56d74b57782";
      "kwinrc"."Desktops"."Id_3" = "857f14b7-3f74-4255-9417-7c22e354d686";
      "kwinrc"."Desktops"."Id_4" = "f21f7522-e948-46d1-baa1-e3dda4dbfeaf";
      "kwinrc"."Desktops"."Number" = 4;
      "kwinrc"."Desktops"."Rows" = 2;

      "kwinrc"."Plugins"."krohnkiteEnabled" = true;
      "kwinrc"."Plugins"."minimizeallEnabled" = true;

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

      "plasmanotifyrc"."Applications/firefox"."Seen" = true;
      "spectaclerc"."ImageSave"."translatedScreenshotsFolder" = "Screenshots";
      "spectaclerc"."VideoSave"."translatedScreencastsFolder" = "Screencasts";
    };
    dataFile = {
      "dolphin/view_properties/global/.directory"."Settings"."HiddenFilesShown" = true;
    };
  };
}

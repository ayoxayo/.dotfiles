{ config, pkgs, ... }:

{

  programs.firefox = {
    enable = true;

    profiles.default = {
      id = 0;
      name = "AYO";
      settings = {
        # Enable HHTPS-Only
        "dom.security.https_only_mode" = true;
        "dom.security.https_only_mode_ever_enabled" = true;
        # Privacy settings
        "privacy.donottrackheader.enabled" = true;
        "privacy.trackingprotection.enabled" = true;
        "privacy.trackingprotection.socialtracking.enabled" = true;
        "privacy.partition.network_state.ocsp_cache" = true;
        # Disable all sorts of telemetry
        "browser.newtabpage.activity-stream.feeds.telemetry" = false;
        "browser.newtabpage.activity-stream.telemetry" = false;
        "browser.ping-centre.telemetry" = false;
        "toolkit.telemetry.archive.enabled" = false;
        "toolkit.telemetry.bhrPing.enabled" = false;
        "toolkit.telemetry.enabled" = false;
        "toolkit.telemetry.firstShutdownPing.enabled" = false;
        "toolkit.telemetry.hybridContent.enabled" = false;
        "toolkit.telemetry.newProfilePing.enabled" = false;
        "toolkit.telemetry.reportingpolicy.firstRun" = false;
        "toolkit.telemetry.shutdownPingSender.enabled" = false;
        "toolkit.telemetry.unified" = false;
        "toolkit.telemetry.updatePing.enabled" = false;
        # Firefox 'experiments'
        "experiments.activeExperiment" = false;
        "experiments.enabled" = false;
        "experiments.supported" = false;
        "network.allow-experiments" = false;
        # Disable Pocket Integration
        "browser.newtabpage.activity-stream.section.highlights.includePocket" = false;
        "extensions.pocket.enabled" = false;
        "extensions.pocket.api" = "";
        "extensions.pocket.oAuthConsumerKey" = "";
        "extensions.pocket.showHome" = false;
        "extensions.pocket.site" = "";
        # Others
        "browser.contentblocking.category" = { Value = "strict"; Status = "locked"; };
        "browser.topsites.contile.enabled" = false;
        "browser.formfill.enable" = false;
        "browser.search.suggest.enabled" = false;
        "browser.search.suggest.enabled.private" = false;
        "browser.urlbar.suggest.searches" = false;
        "browser.urlbar.showSearchSuggestionsFirst" = false;
        "browser.newtabpage.activity-stream.feeds.section.topstories" = false;
        "browser.newtabpage.activity-stream.feeds.snippets" = false;
        "browser.newtabpage.activity-stream.section.highlights.includeBookmarks" = false;
        "browser.newtabpage.activity-stream.section.highlights.includeDownloads" = false;
        "browser.newtabpage.activity-stream.section.highlights.includeVisited" = false;
        "browser.newtabpage.activity-stream.showSponsored" = false;
        "browser.newtabpage.activity-stream.system.showSponsored" = false;
        "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
        "layers.acceleration.force-enabled" = true;
        "gfx.webrender.all" = true;
        "svg.context-properties.content.enabled" = true;
        "browser.startup.preXulSkeletonUI" = false;
      };

      # Rice
	  userChrome = (builtins.readFile ./userChrome.css);
      userContent = (builtins.readFile ./userContent.css);
    };
      # Policies
      policies = {
        DisableTelemetry = true;
        DisableFirefoxStudies = true;
        EnableTrackingProtection = {
          Value= true;
          Locked = true;
          Cryptomining = true;
          Fingerprinting = true;
        };
        DisablePocket = true;
        DisableFirefoxAccounts = true;
        DisableAccounts = true;
        DisableFirefoxScreenshots = true;
        OverrideFirstRunPage = "";
        OverridePostUpdatePage = "";
        DontCheckDefaultBrowser = true;
        DisplayBookmarksToolbar = "never"; # alternatives: "always" or "newtab"
        DisplayMenuBar = "default-off"; # alternatives: "always", "never" or "default-on"
        SearchBar = "unified"; # alternative: "separate"

    # Extensions
    # Check about:support for extension/add-on ID strings.
    # Valid strings for installation_mode are "allowed", "blocked",
    # "force_installed" and "normal_installed".
    ExtensionSettings = {
      "*".installation_mode = "blocked"; # blocks all addons except the ones specified below
      # uBlock Origin:
      "uBlock0@raymondhill.net" = {
      install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
      installation_mode = "force_installed";
      };
          # Bitwarden
          "{446900e4-71c2-419f-a6a7-df9c091e268b}" = {
           install_url = "https://addons.mozilla.org/firefox/downloads/latest/bitwarden-password-manager/latest.xpi";
          installation_mode = "force_installed";
        };
          # Stylus
          "{7a7a4a92-a2a0-41d1-9fd7-1e92480d612d}" = {
          installation_mode = "force_installed";
          install_url = "https://addons.mozilla.org/firefox/downloads/file/4338993/styl_us-1.5.51.xpi";
          };
          # Firefox Color
          "FirefoxColor@mozilla.com" = {
          installation_mode = "force_installed";
          install_url = "https://addons.mozilla.org/firefox/downloads/file/3643624/firefox_color-2.1.7.xpi";
          };
          # Youtube Enhancer
          "enhancerforyoutube@maximerf.addons.mozilla.org" = {
            install_url =  "https://addons.mozilla.org/firefox/downloads/latest/enhancer-for-youtube/latest.xpi";
            installation_mode = "force_installed";
          };
          # Sponsor Blocker
          "sponsorBlocker@ajay.app" = {
            install_url =  "https://addons.mozilla.org/firefox/downloads/latest/sponsorblock/latest.xpi";
            installation_mode = "force_installed";
          };
          # Return Youtube Dislike
          "{762f9885-5a13-4abd-9c77-433dcd38b8fd}" = {
            install_url =  "https://addons.mozilla.org/firefox/downloads/latest/return-youtube-dislikes/latest.xpi";
            installation_mode = "force_installed";
          };
          # Youtube NonStop
          "{0d7cafdd-501c-49ca-8ebb-e3341caaa55e}" = {
            install_url =  "https://addons.mozilla.org/firefox/downloads/latest/youtube-nonstop/latest.xpi";
            installation_mode = "force_installed";
          };
          # DarkReader
          "addon@darkreader.org" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/darkreader/latest.xpi";
            installation_mode = "force_installed";
          };
          # Sidebery
          "{3c078156-979c-498b-8990-85f7987dd929}" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/sidebery/latest.xpi";
            installation_mode = "force_installed";
          };
          # Tabliss
          "extension@tabliss.io" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/tabliss/latest.xpi";
            installation_mode = "force_installed";
          };
          # adaptive-tab-bar-colour
        # "ATBC@EasonWong" = {
        ##   install_url = "https://addons.mozilla.org/firefox/downloads/latest/adaptive-tab-bar-colour/latest.xpi";
        #  installation_mode = "force_installed";
        # };
        };
    };
  };
}

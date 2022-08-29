{ pkgs, ...}:

let assocs = {
        "x-scheme-handler/http" = [ "firefox.desktop" ];
        "x-scheme-handler/https" = [ "firefox.desktop" ];
    }; in
{
  programs.firefox = {
    enable = true;
    package = pkgs.firefox.override { cfg = { enableTridactylNative = true; enableGnomeExtensions = true;}; };
    extensions = with pkgs.nur.repos.rycee.firefox-addons; [
        firenvim
        floccus
        https-everywhere
        i-dont-care-about-cookies
        keepassxc-browser
        privacy-badger
        # tree-style-tab
        tridactyl
        ublock-origin
    ];
    profiles = {
      default = {
        id = 0;
        settings = {
            "browser.aboutConfig.showWarning" = false;
            "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
            "browser.startup.page" = 3; # restore previous tabs and windows
            "browser.urlbar.placeholderName" = "DuckDuckGo";
            "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
        };
      };
    };
  };

  zsh.env.BROWSER = "firefox";
  xdg = {
			mimeApps.defaultApplications = assocs;
			mimeApps.associations.added = assocs;
  };
}

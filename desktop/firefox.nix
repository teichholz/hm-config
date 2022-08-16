{ pkgs, ...}:

{
  programs.firefox = {
    enable = true;
    enableGnomeExtensions = true;
    package = pkgs.firefox.override { cfg = { enableTridactylNative = true; }; };
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

  xdg.desktopEntries.firefox = {
    name = "Firefox";
    genericName = "Web Browser";
    exec = "firefox %U";
    terminal = false;
    categories = [ "Application" "Network" "WebBrowser" ];
    mimeType = [ "text/html" "text/xml" ];
  };
}

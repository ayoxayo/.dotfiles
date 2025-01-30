# nvf config module; add key mappings
{ ... }:
{
  programs.nvf = {
    enable = true;
    settings.vim = {
      theme.enable = true;
      theme.name = "catppuccin";
      theme.style = "mocha";
      viAlias = true;
      vimAlias = true;
      options.shiftwidth = 2;
      statusline.lualine.enable = true;
      statusline.lualine.theme = "horizon";

      telescope.enable = true;
      telescope.mappings.findFiles = "<space>f";

      filetree.neo-tree = {
        enable = true;
        setupOpts = {
          add_blank_line_at_top = true;
        };
      };

      autocomplete.nvim-cmp.enable = true;
 
      languages = {
        enableLSP = true;
        enableTreesitter = true;

        nix.enable = true;
        clang.enable = true;
        java.enable = true;
        ts.enable = true;
        css.enable = true;
        html.enable = true;
        lua.enable = true;
      };
    };
  };
}

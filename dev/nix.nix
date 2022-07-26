{ pkgs, ... }: 

{
  home.packages = [ pkgs.rnix-lsp pkgs.statix pkgs.deadnix ];
}

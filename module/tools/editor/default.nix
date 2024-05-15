{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # TODO: for now this is defined here but it should live inside of the
    # neovim repo I'm eventually adding

    # This is used for Markdown files
    nodejs_20
    vale
  ];

  editorconfig = {
    enable = true;
    settings = {
      "*" = {
        end_of_line = "lf";
        insert_final_newline = true;
        charset = "utf-8";
        indent_style = "space";
        indent_size = 2;
        trim_trailing_whitespace = true;
      };

      "*.dsl" = {
        indent_style = "space";
        indent_size = 4;
      };

      "*.cs" = {
        indent_style = "space";
        indent_size = 4;
      };

      "*.ledger" = {
        indent_style = "space";
        indent_size = 4;
      };

      "*.py" = {
        indent_style = "space";
        indent_size = 4;
      };

      "*.{txt,md,markdown}" = {
        indent_style = "space";
        indent_size = 2;
      };
    };
  };

}

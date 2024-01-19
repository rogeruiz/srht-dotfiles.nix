{ pkgs, ... }:

{
  home.packages = with pkgs; [ ];

  editorconfig = {
    enable = true;
    settings = {
      "*" = {
        end_of_line = "lf";
        insert_final_newline = true;
        charset = "utf-8";
        indent_style = "space";
        indent_size = 2;
        time_trailing_whitespace = true;
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

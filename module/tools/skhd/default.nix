{ ... }:

let
  margins = "20";
in
{
  services.skhd = {
    enable = true;
    skhdConfig = ''
      # Navegación
      alt - h : yabai -m window --focus west
      alt - j : yabai -m window --focus south
      alt - k : yabai -m window --focus north
      alt - l : yabai -m window --focus east

      # Moviendo ventanas
      shift + alt - h : yabai -m window --warp west
      shift + alt - j : yabai -m window --warp south
      shift + alt - k : yabai -m window --warp north
      shift + alt - l : yabai -m window --warp east

      # Cambiar el tamaño de las ventanas
      lctrl + alt - h : yabai -m window --resize left:-${margins}:0; \
                        yabai -m window --resize right:-${margins}:0
      lctrl + alt - j : yabai -m window --resize bottom:0:${margins}; \
                        yabai -m window --resize top:0:${margins}
      lctrl + alt - k : yabai -m window --resize top:0:-${margins}; \
                        yabai -m window --resize bottom:0:-${margins}
      lctrl + alt - l : yabai -m window --resize right:${margins}:0; \
                        yabai -m window --resize left:${margins}:0

      # Moviendo el foco de el espacio de trabajo
      shift + alt - m : yabai -m window --space last; yabai -m space --focus last
      shift + alt - p : yabai -m window --space prev; yabai -m space --focus prev
      shift + alt - n : yabai -m window --space next; yabai -m space --focus next

      # Flotar o sin flotar la ventana
      shift + alt - space : \
          yabai -m window --toggle float; \
          yabai -m window --toggle border
    '';
  };
}

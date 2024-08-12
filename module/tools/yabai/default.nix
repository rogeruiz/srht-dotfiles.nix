{ ... }:

let
  margins = 10;
  bar_height = 40;
  bar_y_offset = 24;
  top_padding = margins + bar_height + bar_y_offset;
in
{
  services.yabai = {
    enable = true;
    config = {
      window_origin_display = "default";
      window_placement = "second_child";
      window_topmost = "off";
      window_shadow = "on";
      window_animation_duration = 0.0;
      window_opacity_duration = 0.0;
      active_window_opacity = 1.0;
      normal_window_opacity = 0.8;
      window_opacity = "on";
      window_border_width = 2;
      window_border_radius = 10;
      window_border_blur = "off";
      window_border_hidpi = "on";
      window_border = "off";
      split_ratio = 0.50;
      split_type = "auto";
      auto_balance = "off";
      bottom_padding = margins;
      right_padding = margins;
      left_padding = margins;
      window_gap = margins;
      top_padding = top_padding;
      layout = "bsp";
      mouse_modifier = "fn";
      mouse_action1 = "move";
      mouse_action2 = "resize";
      mouse_drop_action = "swap";
      mouse_follows_focus = "off";
      focus_follows_mouse = "off";
    };
    extraConfig = (builtins.readFile ./yabairc);
  };
}

# Yabai Nix module
# Copyright (C) 2024 Roger Steve Ruiz
#
# This program is free software: you can redistribute it and/or modify it
# under the terms of the GNU General Public License as published by the Free
# Software Foundation, either version 3 of the License, or (at your option)
# any later version.
#
# This program is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
# FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for
# more details.
#
# You should have received a copy of the GNU General Public License along with
# this program. If not, see <https://www.gnu.org/licenses/>.

{ ... }:

let
  gaps = 24;
  bar_height = 28;
  bar_y_offset = 27;
  top_padding = gaps + bar_height + bar_y_offset;
in
{
  services.yabai = {
    enable = true;
    config = {
      window_origin_display = "default";
      window_placement = "second_child";
      window_shadow = "off";
      window_animation_duration = 0.2;
      window_animation_easing = "ease_out_quart";
      window_opacity_duration = 0.2;
      window_opacity_easing = "ease_out_quart";
      active_window_opacity = 0.9;
      normal_window_opacity = 0.9;
      window_opacity = "on";
      split_ratio = 0.50;
      split_type = "auto";
      auto_balance = "off";
      bottom_padding = gaps;
      right_padding = gaps;
      left_padding = gaps;
      window_gap = gaps;
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

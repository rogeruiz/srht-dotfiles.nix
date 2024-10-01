#!/usr/bin/env bash

# SketchyBar Setting Bar Styles plugin
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

# shellcheck disable=SC2034 # these warnings are irrelevant for this script
# color definitions {{{
# mocha {{{
mocha_rosewater="f5e0dc"
mocha_flamingo="f2cdcd"
mocha_pink="f5c2e7"
mocha_mauve="cba6f7"
mocha_red="f38ba8"
mocha_maroon="eba0ac"
mocha_peach="fab387"
mocha_yellow="f9e2af"
mocha_green="a6e3a1"
mocha_teal="94e2d5"
mocha_sky="89dceb"
mocha_sapphire="74c7ec"
mocha_blue="89b4fa"
mocha_lavender="b4befe"
mocha_text="cdd6f4"
mocha_subtext1="bac2de"
mocha_subtext0="a6adc8"
mocha_overlay2="9399b2"
mocha_overlay1="7f849c"
mocha_overlay0="6c7086"
mocha_surface2="585b70"
mocha_surface1="45475a"
mocha_surface0="313244"
mocha_base="1e1e2e"
mocha_mantle="181825"
mocha_crust="11111b"
## }}}

## macchiato {{{
macchiato_rosewater="f4dbd6"
macchiato_flamingo="f0c6c6"
macchiato_pink="f5bde6"
macchiato_mauve="c6a0f6"
macchiato_red="ed8796"
macchiato_maroon="ee99a0"
macchiato_peach="f5a97f"
macchiato_yellow="eed49f"
macchiato_green="a6da95"
macchiato_teal="8bd5ca"
macchiato_sky="91d7e3"
macchiato_sapphire="7dc4e4"
macchiato_blue="8aadf4"
macchiato_lavender="b7bdf8"
macchiato_text="cad3f5"
macchiato_subtext1="b8c0e0"
macchiato_subtext0="a5adcb"
macchiato_overlay2="939ab7"
macchiato_overlay1="8087a2"
macchiato_overlay0="6e738d"
macchiato_surface2="5b6078"
macchiato_surface1="494d64"
macchiato_surface0="363a4f"
macchiato_base="24273a"
macchiato_mantle="1e2030"
macchiato_crust="181926"
## }}}

# frappe {{{
frappe_rosewater="f2d5cf"
frappe_flamingo="eebebe"
frappe_pink="f4b8e4"
frappe_mauve="ca9ee6"
frappe_red="e78284"
frappe_maroon="ea999c"
frappe_peach="ef9f76"
frappe_yellow="e5c890"
frappe_green="a6d189"
frappe_teal="81c8be"
frappe_sky="99d1db"
frappe_sapphire="85c1dc"
frappe_blue="8caaee"
frappe_lavender="babbf1"
frappe_text="c6d0f5"
frappe_subtext1="b5bfe2"
frappe_subtext0="a5adce"
frappe_overlay2="949cbb"
frappe_overlay1="838ba7"
frappe_overlay0="737994"
frappe_surface2="626880"
frappe_surface1="51576d"
frappe_surface0="414559"
frappe_base="303446"
frappe_mantle="292c3c"
frappe_crust="232634"
## }}}

## latte {{{
latte_rosewater="dc8a78"
latte_flamingo="dd7878"
latte_pink="ea76cb"
latte_mauve="8839ef"
latte_red="d20f39"
latte_maroon="e64553"
latte_peach="fe640b"
latte_yellow="df8e1d"
latte_green="40a02b"
latte_teal="179299"
latte_sky="04a5e5"
latte_sapphire="209fb5"
latte_blue="1e66f5"
latte_lavender="7287fd"
latte_text="4c4f69"
latte_subtext1="5c5f77"
latte_subtext0="6c6f85"
latte_overlay2="7c7f93"
latte_overlay1="8c8fa1"
latte_overlay0="9ca0b0"
latte_surface2="acb0be"
latte_surface1="bcc0cc"
latte_surface0="ccd0da"
latte_crust="dce0e8"
latte_mantle="e6e9ef"
latte_base="eff2f5"
## }}}
# }}}

LIGHT_THEME="latte"
DARK_THEME="mocha"

# check wether or not macOS is in dark mode
if defaults read -g AppleInterfaceStyle &>/dev/null; then
  theme=$DARK_THEME
else
  theme=$LIGHT_THEME
fi

function color() {
  alpha=${2:-255}
  color="$1"

  printf -v alpha "%02x" "$alpha"
  selected_color="${theme}_${color}"
  echo "0x${alpha}${!selected_color}"
}

bar_styles=(
  background.border_color="$(color crust 51)"
  color="$(color mantle)"
)
default_styles=(
  background.color="$(color mantle)"
  background.border_color="$(color crust)"
  icon.color="$(color text)"
  label.color="$(color text)"
)
front_app_styles=(
  background.border_color="$(color blue 102)"
  background.color="$(color blue 51)"
  icon.color="$(color rosewater)"
  label.color="$(color text)"
)
space_styles=(
  icon.color="$(color blue)"
  icon.highlight_color="$(color mauve)"
)
spaces_styles=(
  background.border_color="$(color blue 102)"
  background.color="$(color blue 51)"
)
mic_styles=(
  background.color="$(color mantle 102)"
  icon.color="$(color red)"
  icon.highlight_color="$(color green)"
)
headphones_styles=(
  background.border_color="$(color yellow 102)"
  background.color="$(color yellow 51)"
  icon.color="$(color yellow)"
  label.color="$(color overlay0)"
)
sound_styles=(
  background.border_color="$(color lavender 102)"
  background.color="$(color lavender 51)"
  icon.color="$(color green)"
  icon.highlight_color="$(color red)"
  label.color="$(color text)"
  label.highlight_color="$(color red)"
)
music_styles=(
  background.border_color="$(color overlay2 102)"
  background.color="$(color overlay2 51)"
  icon.color="$(color mauve)"
  label.color="$(color subtext0)"
)
wifi_styles=(
  background.border_color="$(color flamingo 102)"
  background.color="$(color flamingo 51)"
  icon.color="$(color flamingo)"
  label.color="$(color text)"
)
battery_styles=(
  background.border_color="$(color mauve 102)"
  background.color="$(color mauve 51)"
  label.color="$(color subtext1)"
)
clock_styles=(
  background.border_color="$(color green 102)"
  background.color="$(color green 51)"
  icon.color="$(color blue)"
  label.color="$(color text)"
)
keyboard_alias_styles=(
  background.border_color="$(color overlay0 102)"
  background.color="$(color overlay0 51)"
  icon.color="$(color teal)"
)
network_styles=(
  background.border_color="$(color flamingo 102)"
  background.color="$(color flamingo 51)"
  icon.color="$(color overlay2)"
)
# cpu_styles=(
#   background.border_color="$(color overlay0 102)"
#   background.color="$(color mantle)"
#   icon.color="$(color overlay0)"
# )
# ram_styles=(
#   background.border_color="$(color overlay0 102)"
#   background.color="$(color mantle)"
#   icon.color="$(color overlay0)"
# )

sketchybar \
  --bar "${bar_styles[@]}" \
  --default "${default_styles[@]}" \
  --set front_app "${front_app_styles[@]}" \
  --set /space\./ "${space_styles[@]}" \
  --set spaces "${spaces_styles[@]}" \
  --set headphones "${headphones_styles[@]}" \
  --set sound "${sound_styles[@]}" \
  --set music "${music_styles[@]}" \
  --set wifi "${wifi_styles[@]}" \
  --set battery "${battery_styles[@]}" \
  --set clock "${clock_styles[@]}" \
  --set "TextInputMenuAgent,Item-0" "${keyboard_alias_styles[@]}" \
  --set "Stats,Network_network_chart" "${network_styles[@]}"
# --set mic "${mic_styles[@]}" \
# --set "Stats,CPU_mini" "${cpu_styles[@]}" \
# --set "Stats,RAM_mini" "${ram_styles[@]}"

# set the yabai colors as well
yabai \
  -m config insert_feedback_color "$(color mauve)"

# fijar los colores de los bordes usando JankyBorders
borders \
  active_color="$(color mauve)" \
  inactive_color="$(color base)"

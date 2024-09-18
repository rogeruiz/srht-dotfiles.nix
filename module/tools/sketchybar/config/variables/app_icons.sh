#!/usr/bin/env bash
#
# SketchyBar application icons retriever
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

_ejecutar() {
  local simbolo=''
  case $1 in
  "1Password") simbolo="󰟵" ;;
  "Acceso a Llaveros" | "Keychain Access") simbolo="󱕴" ;;
  "Adobe Photoshop 2024") simbolo="" ;;
  "Adobe Illustrator 2024") simbolo="" ;;
  "Alacritty") simbolo="" ;;
  "Amphetamine") simbolo="" ;;
  "Anki") simbolo="󰛇" ;;
  "App Store") simbolo="" ;;
  "Asistente de Redes Captivas") simbolo="󰀂" ;;
  "Backblaze") simbolo="" ;;
  "Bitdefender Endpoint Security Tools" | "SecurityAgent") simbolo="󰒃" ;;
  "Bolsa") simbolo="" ;;
  "Calculadora" | "Calculator") simbolo="󰪚" ;;
  "Calendario" | "Calendar") simbolo="󰧒" ;;
  "Catálogo Tipográfico" | "Font Book") simbolo="" ;;
  "Centro de control") simbolo="󰕮" ;;
  "Centro de notificaciones") simbolo="󰕮" ;;
  "Chromium" | "Google Chrome" | "Google Chrome Canary") simbolo="󰊯" ;;
  "Citrix Viewer") simbolo="󰨡" ;;
  "Clima") simbolo="󰖐" ;;
  "Compartir Pantalla") simbolo="󱒃" ;;
  "Compilador de problemas") simbolo="" ;;
  "Configuración del Sistema" | "System Settings" | "CoreUIAgent") simbolo="" ;;
  "Consola" | "Console") simbolo="" ;;
  "Creative Cloud") simbolo="" ;;
  "Discord") simbolo="󰙯" ;;
  "DiskImages UI Agent") simbolo="󰨣" ;;
  "Docker" | "Docker Desktop") simbolo="󰡨" ;;
  "Dropbox") simbolo="" ;;
  "Due") simbolo="" ;;
  "FaceTime") simbolo="" ;;
  "Familia") simbolo="󱘎" ;;
  "Finder") simbolo="󰀶" ;;
  "Firefox") simbolo="󰈹" ;;
  "Fotos") simbolo="" ;;
  "Instalador") simbolo="" ;;
  "Instapaper") simbolo="󰬐" ;;
  "KeyCastr") simbolo="" ;;
  "Keybase") simbolo="󱕵" ;;
  "Kindle Classic" | "Kindle") simbolo="" ;;
  "Lagrange") simbolo="󰪁" ;;
  "LaunchBar") simbolo="󰌓" ;;
  "Mail") simbolo="󰛮" ;;
  "Mapas" | "Maps") simbolo="" ;;
  "Mensajes" | "Messages") simbolo="󰍡" ;;
  "Menú de Kandji") simbolo="󰾡" ;;
  "Microsoft Teams (work or school)" | "Microsoft Teams") simbolo="󰊻" ;;
  "Miro") simbolo="󱁉" ;;
  "Mirror") simbolo="" ;;
  "Monitor de Actividad" | "Activity Monitor") simbolo="󱎴" ;;
  "Música" | "Music") simbolo="" ;;
  "News") simbolo="󰎕" ;;
  "Numbers") simbolo="" ;;
  "Pages") simbolo="󱔗" ;;
  "Photo Booth") simbolo="" ;;
  "Pocket Sync") simbolo="󱎓" ;;
  "Postman") simbolo="󱂛" ;;
  "QuickTime Player") simbolo="󱜅" ;;
  "Recordatorios") simbolo="󰢌" ;;
  "Reloj" | "Clock") simbolo="󱉊" ;;
  "RetroArch") simbolo="󰯉" ;;
  "Safari") simbolo="󰀹" ;;
  "ScreenSaverEngine") simbolo="" ;;
  "Slack") simbolo="󰒱" ;;
  "Spotify") simbolo="󰓇" ;;
  "TV") simbolo="" ;;
  "The Archive") simbolo="" ;;
  "Thunderbird") simbolo="󰴃" ;;
  "Transmission") simbolo="󰴾" ;;
  "UserNotificationCenter") simbolo="" ;;
  "Velja") simbolo="󰄛" ;;
  "Vista Previa" | "Preview") simbolo="" ;;
  "Wacom Center") simbolo="󰰮" ;;
  "Xcode") simbolo="" ;;
  "bzbmenu") simbolo="󰈸" ;;
  "calibre") simbolo="󱉟" ;;
  "coreautha") simbolo="󱅞" ;;
  "deno") simbolo="󱜙" ;;
  "iA Presenter") simbolo="󰐨" ;;
  "iA Writer") simbolo="󰴒" ;;
  "loginwindow") simbolo="󰍂" ;;
  "osascript") simbolo="󰯁" ;;
  "zoom.us" | "ZoomAutoUpdater") simbolo="󰨜" ;;
  *) simbolo="󰣆" ;;
  esac

  # Imprimir el icono a la pantalla
  printf "%s" "${simbolo}"
}

_ejecutar "$@"

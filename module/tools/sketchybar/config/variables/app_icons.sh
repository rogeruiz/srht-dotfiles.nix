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
  local icono=''
  case $1 in
  "1Password") icono="󰟵" ;;
  "Acceso a Llaveros" | "Keychain Access") icono="󱕴" ;;
  "Adobe Photoshop 2024") icono="" ;;
  "Adobe Illustrator 2024") icono="" ;;
  "Alacritty" | "Ghostty") icono="" ;;
  "Amphetamine") icono="" ;;
  "Anki") icono="󰛇" ;;
  "App Store") icono="" ;;
  "Asistente de Redes Captivas") icono="󰀂" ;;
  "Backblaze") icono="" ;;
  "Bitdefender Endpoint Security Tools" | "SecurityAgent") icono="󰒃" ;;
  "Bolsa") icono="" ;;
  "Calculadora" | "Calculator") icono="󰪚" ;;
  "Calendario" | "Calendar") icono="󰧒" ;;
  "Catálogo Tipográfico" | "Font Book") icono="" ;;
  "Centro de control") icono="󰕮" ;;
  "Centro de notificaciones") icono="󰕮" ;;
  "Chromium" | "Google Chrome" | "Google Chrome Canary") icono="󰊯" ;;
  "Citrix Viewer") icono="󰨡" ;;
  "Clima") icono="󰖐" ;;
  "Compartir Pantalla") icono="󱒃" ;;
  "Compilador de problemas") icono="" ;;
  "Configuración del Sistema" | "System Settings" | "CoreUIAgent") icono="" ;;
  "Consola" | "Console") icono="" ;;
  "Creative Cloud") icono="" ;;
  "Discord") icono="󰙯" ;;
  "DiskImages UI Agent") icono="󰨣" ;;
  "Docker" | "Docker Desktop") icono="󰡨" ;;
  "Dropbox") icono="" ;;
  "Due") icono="" ;;
  "FaceTime") icono="" ;;
  "Familia") icono="󱘎" ;;
  "Finder") icono="󰀶" ;;
  "Firefox") icono="󰈹" ;;
  "Fotos") icono="" ;;
  "Flycast") icono="󰯉" ;;
  "Instalador") icono="" ;;
  "Instapaper") icono="󰬐" ;;
  "KeyCastr") icono="" ;;
  "Keybase") icono="󱕵" ;;
  "Kindle Classic" | "Kindle") icono="" ;;
  "Lagrange") icono="󰪁" ;;
  "LaunchBar") icono="󰌓" ;;
  "Mail") icono="󰛮" ;;
  "Mapas" | "Maps") icono="" ;;
  "Mensajes" | "Messages") icono="󰍡" ;;
  "Menú de Kandji") icono="󰾡" ;;
  "Microsoft Teams (work or school)" | "Microsoft Teams") icono="󰊻" ;;
  "Miro") icono="󱁉" ;;
  "Mirror") icono="" ;;
  "Monitor de Actividad" | "Activity Monitor") icono="󱎴" ;;
  "Música" | "Music") icono="" ;;
  "News") icono="󰎕" ;;
  "Numbers") icono="" ;;
  "Pages") icono="󱔗" ;;
  "Photo Booth") icono="" ;;
  "Pocket Sync") icono="󱎓" ;;
  "Postman") icono="󱂛" ;;
  "QuickTime Player") icono="󱜅" ;;
  "Recordatorios") icono="󰢌" ;;
  "Reloj" | "Clock") icono="󱉊" ;;
  "RetroArch") icono="󰯉" ;;
  "Safari") icono="󰀹" ;;
  "ScreenSaverEngine") icono="" ;;
  "Slack") icono="󰒱" ;;
  "Spotify") icono="󰓇" ;;
  "TV") icono="" ;;
  "The Archive") icono="" ;;
  "Thunderbird") icono="󰴃" ;;
  "Transmission") icono="󰴾" ;;
  "UserNotificationCenter") icono="" ;;
  "Velja") icono="󰄛" ;;
  "Vista Previa" | "Preview") icono="" ;;
  "Wacom Center") icono="󰰮" ;;
  "Xcode") icono="" ;;
  "bzbmenu") icono="󰈸" ;;
  "calibre") icono="󱉟" ;;
  "coreautha") icono="󱅞" ;;
  "deno") icono="󱜙" ;;
  "iA Presenter") icono="󰐨" ;;
  "iA Writer") icono="󰴒" ;;
  "loginwindow") icono="󰍂" ;;
  "osascript") icono="󰯁" ;;
  "zoom.us" | "ZoomAutoUpdater") icono="󰨜" ;;
  *) icono="󰣆" ;;
  esac

  # Imprimir el icono a la pantalla
  printf "%s" "${icono}"
}

_ejecutar "$@"

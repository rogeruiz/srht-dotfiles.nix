#!/usr/bin/env bash

_ejecutar() {
  case $1 in
  "1Password") echo "󰟵" ;;
  "Acceso a Llaveros" | "Keychain Access") echo "󱕴" ;;
  "Adobe Photoshop 2024") echo "" ;;
  "Alacritty") echo "" ;;
  "Amphetamine") echo "" ;;
  "Anki") echo "󰛇" ;;
  "App Store") echo "" ;;
  "Asistente de Redes Captivas") echo "󰀂" ;;
  "Backblaze") echo "" ;;
  "Bitdefender Endpoint Security Tools" | "SecurityAgent") echo "󰒃" ;;
  "Bolsa") echo "" ;;
  "Calculadora" | "Calculator") echo "󰪚" ;;
  "Calendario" | "Calendar") echo "󰧒" ;;
  "Catálogo Tipográfico" | "Font Book") echo "" ;;
  "Centro de control") echo "󰕮" ;;
  "Centro de notificaciones") echo "󰕮" ;;
  "Citrix Viewer") echo "󰨡" ;;
  "Clima") echo "󰖐" ;;
  "Compartir Pantalla") echo "󱒃" ;;
  "Compilador de problemas") echo "" ;;
  "Configuración del Sistema" | "System Settings" | "CoreUIAgent") echo "" ;;
  "Consola" | "Console") echo "" ;;
  "Creative Cloud") echo "" ;;
  "Discord") echo "󰙯" ;;
  "DiskImages UI Agent") echo "󰨣" ;;
  "Docker" | "Docker Desktop") echo "󰡨" ;;
  "Dropbox") echo "" ;;
  "Due") echo "" ;;
  "FaceTime") echo "" ;;
  "Familia") echo "󱘎" ;;
  "Finder") echo "󰀶" ;;
  "Firefox") echo "󰈹" ;;
  "Fotos") echo "" ;;
  "Google Chrome") echo "󰊯" ;;
  "Instalador") echo "" ;;
  "Instapaper") echo "󰬐" ;;
  "KeyCastr") echo "" ;;
  "Keybase") echo "󱕵" ;;
  "Kindle Classic" | "Kindle") echo "" ;;
  "Lagrange") echo "󰪁" ;;
  "LaunchBar") echo "󰌓" ;;
  "Mail") echo "󰛮" ;;
  "Mapas" | "Maps") echo "" ;;
  "Mensajes" | "Messages") echo "󰍡" ;;
  "Menú de Kandji") echo "󰾡" ;;
  "Microsoft Teams (work or school)" | "Microsoft Teams") echo "󰊻" ;;
  "Miro") echo "󱁉" ;;
  "Mirror") echo "" ;;
  "Monitor de Actividad" | "Activity Monitor") echo "󱎴" ;;
  "Música" | "Music") echo "" ;;
  "News") echo "󰎕" ;;
  "Numbers") echo "" ;;
  "Pages") echo "󱔗" ;;
  "Photo Booth") echo "" ;;
  "Pocket Sync") echo "󱎓" ;;
  "Postman") echo "󱂛" ;;
  "QuickTime Player") echo "󱜅" ;;
  "Recordatorios") echo "󰢌" ;;
  "Reloj" | "Clock") echo "󱉊" ;;
  "RetroArch") echo "󰯉" ;;
  "Safari") echo "󰀹" ;;
  "ScreenSaverEngine") echo "" ;;
  "Slack") echo "󰒱" ;;
  "Spotify") echo "󰓇" ;;
  "TV") echo "" ;;
  "The Archive") echo "" ;;
  "Thunderbird") echo "󰴃" ;;
  "Transmission") echo "󰴾" ;;
  "UserNotificationCenter") echo "" ;;
  "Velja") echo "󰄛" ;;
  "Vista Previa" | "Preview") echo "" ;;
  "Wacom Center") echo "󰰮" ;;
  "Xcode") echo "" ;;
  "bzbmenu") echo "󰈸" ;;
  "calibre") echo "󱉟" ;;
  "coreautha") echo "󱅞" ;;
  "deno") echo "󱜙" ;;
  "iA Presenter") echo "󰐨" ;;
  "iA Writer") echo "󰴒" ;;
  "loginwindow") echo "󰍂" ;;
  "osascript") echo "󰯁" ;;
  "zoom.us" | "ZoomAutoUpdater") echo "󰨜" ;;
  *) echo "󰣆" ;;
  esac
}

_ejecutar "$@"

#!/bin/zsh

# shopt -s extglob

# Some events send additional information specific to the event in the $INFO
# variable. E.g. the front_app_switched event sends the name of the newly
# focused application in the $INFO variable:
# https://felixkratz.github.io/SketchyBar/config/events#events-and-scripting

case $INFO in
  "1Password") INFO="󰟵" ;;
  "Acceso a Llaveros" | "Keychain Access") INFO="󱕴" ;;
  "Adobe Photoshop 2024") INFO="" ;;
  "Asistente de Redes Captivas") INFO="󰀂" ;;
  "Alacritty") INFO="" ;;
  "Amphetamine") INFO="" ;;
  "Anki") INFO="󰛇" ;;
  "App Store") INFO="" ;;
  "Backblaze") INFO="" ;;
  "bzbmenu") INFO="󰈸" ;;
  "Bitdefender Endpoint Security Tools" | "SecurityAgent") INFO="󰒃" ;;
  "Bolsa") INFO="" ;;
  "Calculadora" | "Calculator") INFO="󰪚" ;;
  "coreautha") INFO="󱅞" ;;
  "calibre") INFO="󱉟" ;;
  "Calendario" | "Calendar") INFO="󰧒" ;;
  "Catálogo Tipográfico" | "Font Book") INFO="" ;;
  "Centro de control") INFO="󰕮" ;;
  "Centro de notificaciones") INFO="󰕮" ;;
  "Citrix Viewer") INFO="󰨡" ;;
  "Clima") INFO="󰖐" ;;
  "Configuración del Sistema" | "System Settings" | "CoreUIAgent") INFO="" ;;
  "Consola" | "Console") INFO="" ;;
  "Compartir Pantalla") INFO="󱒃" ;;
  "Creative Cloud") INFO="" ;;
  "Docker" | "Docker Desktop") INFO="󰡨" ;;
  "Dropbox") INFO="" ;;
  "DiskImages UI Agent") INFO="󰨣" ;;
  "Discord") INFO="󰙯" ;;
  "Due") INFO="" ;;
  "FaceTime") INFO="" ;;
  "Familia") INFO="󱘎" ;;
  "Finder") INFO="󰀶" ;;
  "Firefox") INFO="󰈹" ;;
  "Fotos") INFO="" ;;
  "Google Chrome") INFO="󰊯" ;;
  "iA Writer") INFO="󰴒" ;;
  "iA Presenter") INFO="󰐨" ;;
  "Instalador") INFO="" ;;
  "Instapaper") INFO="󰬐" ;;
  "Keybase") INFO="󱕵" ;;
  "KeyCastr") INFO="" ;;
  "Kindle Classic" | "Kindle") INFO="" ;;
  "LaunchBar") INFO="󰌓" ;;
  "Lagrange") INFO="󰪁" ;;
  "loginwindow") INFO="󰍂" ;;
  "Mail") INFO="󰛮" ;;
  "Mapas" | "Maps") INFO="" ;;
  "Menú de Kandji") INFO="󰾡" ;;
  "Mensajes" | "Messages") INFO="󰍡" ;;
  "Miro") INFO="󱁉" ;;
  "Mirror") INFO="" ;;
  "Música" | "Music") INFO="" ;;
  "Monitor de Actividad" | "Activity Monitor") INFO="󱎴" ;;
  "Microsoft Teams (work or school)" | "Microsoft Teams") INFO="󰊻" ;;
  "News") INFO="󰎕" ;;
  "Notational Velocity") INFO="" ;;
  "Numbers") INFO="" ;;
  "osascript") INFO="󰯁" ;;
  "Pages") INFO="󱔗" ;;
  "Photo Booth") INFO="" ;;
  "Postman") INFO="󱂛" ;;
  "Pocket Sync") INFO="󱎓" ;;
  "QuickTime Player") INFO="󱜅" ;;
  "Recordatorios") INFO="󰢌" ;;
  "Reloj" | "Clock") INFO="󱉊" ;;
  "RetroArch") INFO="󰯉" ;;
  "Safari") INFO="󰀹" ;;
  "ScreenSaverEngine") INFO="" ;;
  "Slack") INFO="󰒱" ;;
  "Spotify") INFO="󰓇" ;;
  "Thunderbird") INFO="󰴃" ;;
  "TV") INFO="" ;;
  "Transmission") INFO="󰴾" ;;
  "Velja") INFO="󰄛" ;;
  "Vista Previa" | "Preview") INFO="" ;;
  "zoom.us" | "ZoomAutoUpdater") INFO="󰨜" ;;
  "UserNotificationCenter") INFO="" ;;
  "Compilador de problemas") INFO="" ;;
  *)
    ;;
esac

sketchybar --set $NAME label="${INFO:= }"

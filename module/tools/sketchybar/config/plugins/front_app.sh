#!/bin/bash

# Some events send additional information specific to the event in the $INFO
# variable. E.g. the front_app_switched event sends the name of the newly
# focused application in the $INFO variable:
# https://felixkratz.github.io/SketchyBar/config/events#events-and-scripting

case $INFO in
"1Password") ICON="󰟵" ;;
"Acceso a Llaveros" | "Keychain Access") ICON="󱕴" ;;
"Adobe Photoshop 2024") ICON="" ;;
"Asistente de Redes Captivas") ICON="󰀂" ;;
"Alacritty") ICON="" ;;
"Amphetamine") ICON="" ;;
"Anki") ICON="󰛇" ;;
"App Store") ICON="" ;;
"Backblaze") ICON="" ;;
"bzbmenu") ICON="󰈸" ;;
"Bitdefender Endpoint Security Tools" | "SecurityAgent") ICON="󰒃" ;;
"Bolsa") ICON="" ;;
"Calculadora" | "Calculator") ICON="󰪚" ;;
"coreautha") ICON="󱅞" ;;
"calibre") ICON="󱉟" ;;
"Calendario" | "Calendar") ICON="󰧒" ;;
"Catálogo Tipográfico" | "Font Book") ICON="" ;;
"Centro de control") ICON="󰕮" ;;
"Centro de notificaciones") ICON="󰕮" ;;
"Citrix Viewer") ICON="󰨡" ;;
"Clima") ICON="󰖐" ;;
"Configuración del Sistema" | "System Settings" | "CoreUIAgent") ICON="" ;;
"Consola" | "Console") ICON="" ;;
"Compartir Pantalla") ICON="󱒃" ;;
"Creative Cloud") ICON="" ;;
"deno") ICON="󱜙" ;;
"Docker" | "Docker Desktop") ICON="󰡨" ;;
"Dropbox") ICON="" ;;
"DiskImages UI Agent") ICON="󰨣" ;;
"Discord") ICON="󰙯" ;;
"Due") ICON="" ;;
"FaceTime") ICON="" ;;
"Familia") ICON="󱘎" ;;
"Finder") ICON="󰀶" ;;
"Firefox") ICON="󰈹" ;;
"Fotos") ICON="" ;;
"Google Chrome") ICON="󰊯" ;;
"iA Writer") ICON="󰴒" ;;
"iA Presenter") ICON="󰐨" ;;
"Instalador") ICON="" ;;
"Instapaper") ICON="󰬐" ;;
"Keybase") ICON="󱕵" ;;
"KeyCastr") ICON="" ;;
"Kindle Classic" | "Kindle") ICON="" ;;
"LaunchBar") ICON="󰌓" ;;
"Lagrange") ICON="󰪁" ;;
"loginwindow") ICON="󰍂" ;;
"Mail") ICON="󰛮" ;;
"Mapas" | "Maps") ICON="" ;;
"Menú de Kandji") ICON="󰾡" ;;
"Mensajes" | "Messages") ICON="󰍡" ;;
"Miro") ICON="󱁉" ;;
"Mirror") ICON="" ;;
"Música" | "Music") ICON="" ;;
"Monitor de Actividad" | "Activity Monitor") ICON="󱎴" ;;
"Microsoft Teams (work or school)" | "Microsoft Teams") ICON="󰊻" ;;
"News") ICON="󰎕" ;;
"The Archive") ICON="" ;;
"Numbers") ICON="" ;;
"osascript") ICON="󰯁" ;;
"Pages") ICON="󱔗" ;;
"Photo Booth") ICON="" ;;
"Postman") ICON="󱂛" ;;
"Pocket Sync") ICON="󱎓" ;;
"QuickTime Player") ICON="󱜅" ;;
"Recordatorios") ICON="󰢌" ;;
"Reloj" | "Clock") ICON="󱉊" ;;
"RetroArch") ICON="󰯉" ;;
"Safari") ICON="󰀹" ;;
"ScreenSaverEngine") ICON="" ;;
"Slack") ICON="󰒱" ;;
"Spotify") ICON="󰓇" ;;
"Thunderbird") ICON="󰴃" ;;
"TV") ICON="" ;;
"Transmission") ICON="󰴾" ;;
"Velja") ICON="󰄛" ;;
"Vista Previa" | "Preview") ICON="" ;;
"zoom.us" | "ZoomAutoUpdater") ICON="󰨜" ;;
"UserNotificationCenter") ICON="" ;;
"Compilador de problemas") ICON="" ;;
"Wacom Center") ICON="󰰮" ;;
*) ICON="󰣆" ;;
esac

sketchybar --set "${NAME}" icon="${ICON}" label="${INFO:=SketchyBar}"

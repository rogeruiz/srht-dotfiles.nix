#!/bin/bash

VARIABLES_DIR="${CONFIG_DIR}/variables"
ICON=$("${VARIABLES_DIR}/app_icons.sh" "${INFO}")

sketchybar --set "${NAME}" icon="${ICON}" label="${INFO:=SketchyBar}"

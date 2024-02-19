#!/bin/bash
sed -i 's/kb_layout=[a-z]*/kb_layout=us/' ~/.config/hypr/configs/Settings.conf
cat ~/.config/hypr/configs/Settings.conf | grep "kb_layout"

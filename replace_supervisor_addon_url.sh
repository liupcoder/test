#by chuixue
#! /bin/bash
# v1.2

addons_url_file="/usr/src/supervisor/supervisor/const.py"

if [ -n "$(cat ${addons_url_file} | grep -o 'URL_HASSIO_ADDONS = "https://github.com/home-assistant/addons"')" ]; then 
  sed -i 's/URL_HASSIO_ADDONS = "https\:\/\/github.com\/home-assistant\/addons\"/URL_HASSIO_ADDONS = "https\:\/\/mirror.ghproxy.com\/home-assistant\/addons\"/g' ${addons_url_file}
  if [ -n "$(cat ${addons_url_file} | grep -o 'URL_HASSIO_ADDONS = "https://mirror.ghproxy.com/home-assistant/addons"')" ]; then
    echo "Succeed! Addons downloading URL was replaced. Supervisor will reboot now to take effect..."
    reboot
  else
    echo "Failed. Addons downloading URL was not replaced!"
  fi
elif [ -n "$(cat ${addons_url_file} | grep -o 'URL_HASSIO_ADDONS = "https://mirror.ghproxy.com/home-assistant/addons"')" ]; then
  echo "No change was made. Because addons downloading URL has already been replaced."
fi

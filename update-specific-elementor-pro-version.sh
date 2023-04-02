#!/bin/bash

for file in /home/*/domains/*/public_html/wp-content/plugins/elementor-pro/license.txt; do
    dir=$(dirname "$file")
    version=$(grep "Version: " "${dir}/elementor-pro.php" | sed "s/[^0-9.]*\([0-9.]*\).*/\1/")
    if [ "$version" = "3.11.6" ]; then
        echo "Vurnable Elementor Pro version 3.11.6 found at ${dir}"
        read -p "Do you want to update to the latest version? (y/n) " -n 1 -r
        echo
        if [[ $REPLY =~ ^[Yy]$ ]]; then
            cd "${dir}" || exit
            wp plugin update elementor-pro
            echo "Elementor Pro updated to the latest version."
        else
            echo "Elementor Pro not updated."
        fi
    fi
done

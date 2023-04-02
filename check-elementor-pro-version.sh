#!/bin/bash

# Define the Elementor Pro version to check for
elementor_version="3.11.6"

# Find all directories that match the pattern /home/*/domains/*/public_html/
for user_dir in /home/*/domains/*/public_html/
do
    # Check if Elementor Pro is installed in this directory
    if [ -f "$user_dir/wp-content/plugins/elementor-pro/elementor-pro.php" ]
    then
        # Get the version of Elementor Pro installed in this directory
        installed_version=$(grep -oP "Version:\s*\K.*" "$user_dir/wp-content/plugins/elementor-pro/elementor-pro.php")
        
        # Compare the installed version to the vulnerable version
        if [ "$installed_version" = "$elementor_version" ]
        then
            echo "User directory $user_dir contains Elementor Pro version $elementor_version (vulnerable)"
        fi
    fi
done

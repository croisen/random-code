#!/usr/bin/env bash


laptop_res="1366x768"

source "$(dirname $(readlink -f  ${BASH_SOURCE[0]}))/file-dependency/check_dependency.sh"
echo "Checking for ImageMagick convert util..."
check_dependency convert

for file in *.jpg *.png *.webp *.jpeg; do
    filename="$(echo "$file" | sed -sE "s/\.\w+$//")"

    if [[ $filename != "*" ]]; then
        width=$(identify -format "%w" "$file")
        height=$(identify -format "%h" "$file")

        if [[ $height -lt $width ]]; then
            echo "Converting $file into landscape-$filename.png"
            convert "$file" -resize $laptop_res\! "landscape-$filename.png"
        fi
    fi
done

echo "Done!"
exit 0

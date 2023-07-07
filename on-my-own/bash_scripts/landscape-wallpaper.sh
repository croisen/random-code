#!/usr/bin/env bash


laptop_res="1366x768"

if ! command -v convert &> /dev/null; then
    echo "Convert not found, please install ImageMagick"
    exit 1
fi

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

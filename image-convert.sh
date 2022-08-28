#!/usr/bin/env bash


if ! command -v convert &> /dev/null; then
    echo "Convert not found, please install ImageMagick"
    exit 1
fi

for file in *.jpg *.jpeg *.webp; do
    filename=$(echo $file | sed -sE 's/\.\w+$//')

    if [[ $filename != "*" ]]; then
        echo "Converting $file to output-$filename.png"
        convert $file "output-$filename.png"
    fi
done

echo "Done!"
exit 0

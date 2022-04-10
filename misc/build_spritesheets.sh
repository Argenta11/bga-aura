#!/bin/bash
FILE_PREFIX="02102016_aura"

magick montage ${FILE_PREFIX}_beige_back{1..4}-1.png ${FILE_PREFIX}_blue_back{1..4}-1.png ${FILE_PREFIX}_green_back{1..4}-1.png ${FILE_PREFIX}_purple_back{1..4}-1.png ${FILE_PREFIX}_red_back{1..4}-1.png -tile 4x5 -geometry +5+5 -background 'none' card_backs_portrait.jpg

magick montage ${FILE_PREFIX}_beige_fronts-0{8..1}.png ${FILE_PREFIX}_beige_fronts-09.png ${FILE_PREFIX}_beige_fronts-10.png ${FILE_PREFIX}_blue_fronts-0{8..1}.png ${FILE_PREFIX}_blue_fronts-09.png ${FILE_PREFIX}_blue_fronts-10.png ${FILE_PREFIX}_green_fronts-0{8..1}.png ${FILE_PREFIX}_green_fronts-09.png ${FILE_PREFIX}_green_fronts-10.png ${FILE_PREFIX}_purple_fronts-0{8..1}.png ${FILE_PREFIX}_purple_fronts-09.png ${FILE_PREFIX}_purple_fronts-10.png ${FILE_PREFIX}_red_fronts-0{8..1}.png ${FILE_PREFIX}_red_fronts-09.png ${FILE_PREFIX}_red_fronts-10.png -tile 10x5 -geometry +5+5 -background 'none' card_fronts_portrait.jpg

#!/bin/sh
conda activate evoenv
for i in abandonedfactory abandonedfactory_night endofworld carwelding amusement gascola hospital japanesealley neighborhood ocean office oldtown seasidetown seasonsforest seasonsforest_winter soulcity westerndesert
do
	echo "2kitti $i"
    python3 xyzq2kitti.py est/cvo_tartan_outdoor_${i}.txt est/${i}_kitti.txt
done
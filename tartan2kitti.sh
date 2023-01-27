#!/bin/sh
conda activate evoenv
for i in gascola hospital japanesealley neighborhood ocean office oldtown seasidetown seasonsforest seasonsforest_winter soulcity westerndesert
do
	echo "2kitti $i"
    python3 xyzq2kitti.py pose_left_$i.txt pose_left_${i}_kitti.txt
done
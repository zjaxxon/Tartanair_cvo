#!/bin/sh
for i in abandonedfactory abandonedfactory_night endofworld carwelding amusement gascola hospital japanesealley neighborhood ocean office oldtown seasidetown seasonsforest seasonsforest_winter soulcity westerndesert
do
    echo $i	
    python3 xyzq2kitti.py est_dep/cvo_tartan_rgbd_disp_$i.txt est_dep/${i}_kitti.txt
done
#!/bin/sh
for i in abandonedfactory abandonedfactory_night endofworld carwelding amusement gascola hospital japanesealley neighborhood ocean office oldtown seasidetown seasonsforest seasonsforest_winter soulcity westerndesert
do
	echo $i	
	evo_rpe kitti ./ref/pose_left_{$i}_kitti.txt ./est/cvo_tartan_outdoor_$i.txt -va --plot --plot_mode xz --save_results results/{$i}.zip
done

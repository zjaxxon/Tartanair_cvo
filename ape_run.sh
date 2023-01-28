#!/bin/sh
for i in abandonedfactory abandonedfactory_night endofworld carwelding amusement gascola hospital japanesealley neighborhood ocean office oldtown seasidetown seasonsforest seasonsforest_winter soulcity westerndesert
do
	echo $i	
	evo_ape kitti ./ref/pose_left_${i}_kitti.txt ./est/${i}_kitti.txt -va --save_results results_ape/${i}.zip
done

#!/bin/sh
# for i in abandonedfactory abandonedfactory_night endofworld carwelding amusement gascola hospital japanesealley neighborhood ocean office oldtown seasidetown seasonsforest seasonsforest_winter soulcity westerndesert
# do
# 	echo $i	
# 	evo_rpe kitti ./ref/pose_left_${i}_kitti.txt ./est/${i}_kitti.txt -va --plot --plot_mode xyz --save_results results/${i}.zip --save_plot results/plot/$i
# done

# # rpe -deg
# for i in abandonedfactory abandonedfactory_night endofworld carwelding amusement gascola hospital japanesealley neighborhood ocean office oldtown seasidetown seasonsforest seasonsforest_winter soulcity westerndesert
# do
# 	echo $i	
# 	evo_rpe kitti ./ref/pose_left_${i}_kitti.txt ./est/${i}_kitti.txt -va --plot --plot_mode xyz -r angle_deg --save_results results_rpedeg/${i}.zip 
# done

for i in abandonedfactory abandonedfactory_night endofworld carwelding amusement gascola hospital japanesealley neighborhood ocean office oldtown seasidetown seasonsforest seasonsforest_winter soulcity westerndesert
do
	echo $i	
	evo_rpe kitti ./ref/pose_left_${i}_kitti.txt ./est_dep/${i}_kitti.txt -va --plot --plot_mode xyz --save_results est_dep/results/${i}.zip
done
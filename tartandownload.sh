#!/bin/sh
for i in gascola hospital japanesealley neighborhood ocean office oldtown seasidetown seasonsforest seasonsforest_winter soulcity westerndesert
do
	echo "scp $i"
	scp jyzh@sunny.engin.umich.edu:/media/sdc1/rzh/tartanair/$i/Easy/P001/pose_left.txt .
	mv pose_left.txt pose_left_$i.txt
done

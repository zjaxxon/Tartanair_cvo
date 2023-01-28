#!/bin/sh
for i in abandonedfactory abandonedfactory_night endofworld carwelding amusement gascola hospital japanesealley neighborhood ocean office oldtown seasidetown seasonsforest seasonsforest_winter soulcity westerndesert
do
    echo $i	
    mv ./est/cvo_tartan_outdoor_$i.txt $i.txt
done
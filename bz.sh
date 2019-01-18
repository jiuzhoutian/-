#!/bin/bash
DIR=/usr/share/backgrounds/壁纸
DIR1=/usr/share/backgrounds/壁纸1
DIR3=/usr/share/backgrounds
name="tedu-wallpaper-01.png"
while :
do
 n=`ls $DIR | wc -l`
 if [ $n == 0 ];then
 mv $DIR1/* $DIR
 for a in `ls $DIR` 
  do
   mv $DIR3/$name $DIR1/${a##*/}
   mv  $DIR/${a##*/}  $DIR3/$name
   sleep 15
  done 
else
for a in `ls $DIR`
  do
    mv $DIR3/$name $DIR1/${a##*/} 
    mv $DIR/${a##*/} $DIR3/$name
    sleep 15
 done
fi
done

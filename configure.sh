#!/bin/sh
UER=$1
HOMEPATH=
FILEPATH=$2
echo "usr = $UER"
echo "filepath = $2"
if [ -n "$UER" ] ; then
echo "no zero uer = $UER"
HOMEPATH=/home/$UER/
else
echo "zero"
HOMEPATH=~/
fi
cp -rf ./git-shell-commands $HOMEPATH
# FILEPATH 确定了你需要将git仓库建立到那个文件夹下
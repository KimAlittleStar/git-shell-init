#!/bin/sh
UER=$1
HOMEPATH=
FILEPATH=$2
echo "usr = $UER"
echo "filepath = $2"
if [ -n "$UER" ]; then
    echo "no zero uer = $UER"
    HOMEPATH=/home/$UER/
else
    echo "zero"
    HOMEPATH=~/
fi
cp -rf ./git-shell-commands $HOMEPATH

# FILEPATH 确定了你需要将git仓库建立到那个文件夹下
if [ -n "$FILEPATH" ]; then
    echo "no zero FILEPATH = $FILEPATH"
else
    echo "zero"
    FILEPATH=~/
fi

echo "#!/bin/sh" >$HOMEPATH/git-shell-commands/list                                                  #将list文件替换为 '#!/bin/sh'
echo "find $FILEPATH/ -maxdepth 3 -type d -name \"[\s\S]*.git\"" >>$HOMEPATH/git-shell-commands/list #将list文件追加内容
sed -i '3c\FILEPATH='$FILEPATH $HOMEPATH/git-shell-commands/init                                     #将init中的文本行替换

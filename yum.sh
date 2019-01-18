#！/bin/bash
 cd /var/ftp/ops
for folder in *
do
 if [ -d $folder ];then
 cat <<EOF >>/tmp/osp10.repo
[$folder]
name=$folder
baseurl=ftp://192.168.4.254/ops/$folder
enabled=1
gpgcheck=0
EOF
 fi
done
